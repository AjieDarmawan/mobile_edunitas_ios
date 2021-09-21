part of 'inboxPages.dart';

class MainMessage extends StatefulWidget {
  MainMessage({Key key}) : super(key: key);

  @override
  _MainMessageState createState() => _MainMessageState();
}

class _MainMessageState extends State<MainMessage> {
  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  bool _readed = false;
   SessionManager sessionManager = SessionManager();
   ScrollController _controller;
  var gabs = ApiMessage.getData;
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {//handled
      setState(() {
        mystatus = sessionManager.status;
        globalkey = sessionManager.key;
        globalEmail = sessionManager.email;
        print("email${globalEmail}");
        print("globalkey${globalkey}");
        print("mystatus${mystatus}");
      });
    });
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  var datamessage = [];
  void dataapimessage(globalkey2) {
    //print("globalkey2${globalkey2}");
    Kampusview_model().getinbox(globalkey2).then((value1) {//handled
      print(value1);
      setState(() {
        datamessage = value1;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void onErrHandling(erro){
    print("do_login_err: "+erro.toString());
    if(erro.toString().contains("SocketException")){
      Flushbar(
          title: "Tidak ada koneksi",
          message: "Mohon cek koneksi internet",
          duration: Duration(days: 360),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.fastOutSlowIn,
          boxShadows: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(0.0, 3.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.red[600],
          isDismissible: true,
          mainButton: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: EduButton(
              onPressed: () {
                dataapimessage(globalkey);
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    dataapimessage(globalkey);
  }

  read(id_message) {
    Kampusview_model().read_message(id_message.toString()).then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        print("read success");
      } else if (data.status == 404) {
        print("read gagal");
      } else {
        print("read gagal lain");
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  del_message(id_message, context) {
    Kampusview_model().delete_message(id_message.toString()).then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        print("read success");

        Fluttertoast.showToast(
            msg: "Berhasil Di Hapus",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);

        Navigator.pop(context);
      } else if (data.status == 404) {
        print("read gagal");
      } else {
        print("read gagal lain");
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void show(idM) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 270,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //color: Colors.red,
                      height: 100,
                      child: Image.asset(
                        "assets/dialog/hapuspesanmdpi.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 32,
                          child: Text(
                            'Hapus Pesan ?',
                            style: blueFontStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Pesan akan di hapus dari kotak masuk',
                          style: blackFontStyle3,
                        ),
                      ],
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: EduButtonSecond(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              buttonText: "Batal",
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: EduButton(
                              onPressed: () {
                                del_message(idM, context);
                              },
                              buttonText: "Hapus",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    dataapimessage(globalkey);
    //print("datamessage${datamessage.length}");
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        child: globalkey == null
            ? NonLogin()
            : Container(
                child: datamessage.length == 0
                    ? NoMessage()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: datamessage.length,
                        itemBuilder: (context, index) {
                          //print("mencoba_read${datamessage[index].idM}");
                          return InkWell(
                              onTap: () {
                                //print("tes");
                                //print("read${datamessage[index].idM}");
                                read(datamessage[index].idM);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (MessageDetail(
                                            konten: datamessage[index].content,
                                            keterangan:
                                                datamessage[index].keterangan,
                                            sender:
                                                datamessage[index].sender))));
                              },
                              child: datamessage[index].readdate != null
                                  ? Stack(
                                      children: [
                                        Container(
                                          height: 100,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(top: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                child: Text(
                                                  datamessage[index].title,
                                                  style:
                                                      blackFontStyle1.copyWith(
                                                    fontSize: 13,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10.0),
                                                child: datamessage[index]
                                                            .waktu_crtd ==
                                                        null
                                                    ? Text("")
                                                    : Text(
                                                        datamessage[index]
                                                            .waktu_crtd,
                                                        style: blueFontStyle
                                                            .copyWith(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                              ),
                                              Divider(
                                                color: Colors.black12,
                                                height: 0.0,
                                                thickness: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.delete_rounded,
                                                  color: Colors.grey[400],
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  show(datamessage[index].idM);
                                                })),
                                      ],
                                    )
                                  : Stack(
                                      children: [
                                        Container(
                                          color: mainColor1.withOpacity(0.2),
                                          height: 100,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(top: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                child: Text(
                                                  datamessage[index].title,
                                                  style: blueFontStyle.copyWith(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 5),
                                                child: datamessage[index]
                                                            .waktu_crtd ==
                                                        null
                                                    ? Text("")
                                                    : Text(
                                                        datamessage[index]
                                                            .waktu_crtd,
                                                        style: blackFontStyle1
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                              ),
                                              Divider(
                                                color: Colors.black12,
                                                height: 0.0,
                                                thickness: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.delete_rounded,
                                                  color: mainColor1
                                                      .withOpacity(0.3),
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  show(datamessage[index].idM);
                                                })),
                                      ],
                                    ));
                        }),
              ),
      ),
    );
  }
}

class ApiMessage {
  static final getData = [
    {
      'pprofil': '',
      'pname': 'John Doe',
      'pmessage':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      'time': '3 Mar'
    },
    {
      'pprofil': '',
      'pname': 'John Doe',
      'pmessage':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      'time': '3 Mar'
    },
    {
      'pprofil': '',
      'pname': 'John Doe',
      'pmessage':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      'time': '3 Mar'
    },
    {
      'pprofil': '',
      'pname': 'John Doe',
      'pmessage':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      'time': '3 Mar'
    }
  ];
}
