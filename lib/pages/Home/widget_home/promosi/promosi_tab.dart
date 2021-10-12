part of 'widget_promosi.dart';

class PromosiTab extends StatefulWidget {
  //PromosiTab({Key key}) : super(key: key);
  final int key_enter;

  PromosiTab({this.key_enter});

  @override
  _PromosiTabState createState() => _PromosiTabState();
}

class _PromosiTabState extends State<PromosiTab> {
  bool _loading = false;

  String valketegori = 'UMUM';
  var datacategori = new List();
  void getCategori2() {
    Eduinfoview_model().getCategoripromosi().then((value) {//handled
      setState(() {
        datacategori = value;
        // valketegori = "covid19";
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List dataedu = new List();
  String valcid,
      valtitle,
      valkonten,
      valtgl,
      valkategori21,
      valcaradapat,
      valpoinreedem,
      valshare;

  void getedu2(valkategori2) {
    Eduinfoview_model().getpromosilist(valkategori2.toString()).then((value) {//handled
      setState(() {
        _loading = false;
        dataedu = value;
        valcid = dataedu[0].cid;
        valtitle = dataedu[0].title;
        valkonten = dataedu[0].konten;
        valtgl = dataedu[0].crdt;
        valkategori21 = dataedu[0].kategori;
        valcaradapat = dataedu[0].caradapat;
        valpoinreedem =
            dataedu[0].poinreedem == null ? "" : dataedu[0].poinreedem;
        //print('valtz: ${valcid},\n${valtitle},\n${valkonten},\n${valtgl},\n${valkategori21},\n${valcaradapat},\n${valpoinreedem},\n');
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
                _loadingView();
                getCategori2();
                getedu2(valketegori);
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  bool isConn = false;

  //conn has been updated 29 Jun 2021
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          isConn = true;
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
        } else if (connectivityResult == ConnectivityResult.wifi) {
          isConn = true;
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
        } else {
          isConn = false;
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  @override
  void initState() {
    dataedu = [];
    if (_loading == false) {
      getCategori2();
      getedu2(valketegori);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("datacategori${dataedu.length}");
    getedu2(valketegori);
    return WillPopScope(
      //onWillPop: _backPressed,
      child: Scaffold(
          backgroundColor: CupertinoColors.white,
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: mainColor1,
            title: Text("Semua Promosi", style: whiteFontStyle),
          ),
          body: Container(
            child: widget.key_enter == 1
                ? Column(
                    children: [
                      Container(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          child: datacategori.length == 0
                              ? Container(
                                  margin: EdgeInsets.all(8),
                                  child: SizedBox(
                                    width: 150,
                                    height: MediaQuery.of(context).size.width,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[350],
                                      highlightColor: Colors.white,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey[350]),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey[350]),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey[350]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  itemCount: 1,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CustomRadioButton(
                                      width: 120,
                                      enableShape: true,
                                      elevation: 0,
                                      padding: 5,
                                      spacing: 0.0,
                                      autoWidth: false,
                                      enableButtonWrap: true,
                                      wrapAlignment: WrapAlignment.start,
                                      horizontal: false,
                                      absoluteZeroSpacing: false,
                                      unSelectedColor:
                                          Theme.of(context).canvasColor,
                                      buttonLables: datacategori.map((item) {
                                        return item.kategori.toString();
                                      }).toList(),
                                      // buttonValues
                                      buttonValues: datacategori.map((item) {
                                        return item.kategori.toString();
                                      }).toList(),
                                      defaultSelected: 'UMUM',
                                      buttonTextStyle: ButtonTextStyle(
                                          selectedColor: Colors.white,
                                          unSelectedColor: mainColor1,
                                          textStyle: TextStyle(fontSize: 12)),

                                      selectedColor: mainColor1,
                                      radioButtonValue: (value) {
                                        _loadingView();

                                        valketegori = value;
                                        Future.delayed(
                                            const Duration(seconds: 4), () {
                                          setState(() {
                                            dataedu = [];
                                            _loading = false;
                                          });
                                        });
                                        //print("value${value}");
                                      },
                                    );
                                  })),
                      Container(
                        child: _loading
                            ? _loadingView()
                            : Expanded(
                                child: SingleChildScrollView(
                                    child: dataedu.length != 0
                                        ? _body()
                                        : Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.5,
                                            child: Center(
                                                child: Container(
                                              height: 100,
                                              width: 150,
                                              child: Image.asset(
                                                  "assets/dialog/nopromo.png"),
                                            )),
                                          )),
                              ),
                      ),
                    ],
                  )
                : Container(
                    child: _loadingView(),
                  ),
          )
          //_loading ? _loadingView() : _body()
          ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _loading == true
            ? Center(
                child: Padding(
                padding: const EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ))
            : Container(),
        dataedu.length == 0
            ? Container(
                padding: EdgeInsets.all(20.0),
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[350],
                  highlightColor: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350]),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (PromosiDetail(
                                cid: valcid == null ? "" : valcid,
                                konten: valkonten == null ? '' : valkonten,
                                title: valtitle == null ? "" : valtitle,
                                caradapat:
                                    valcaradapat == null ? "" : valcaradapat,
                                poinredeem:
                                    valpoinreedem == null ? "" : valpoinreedem,
                              ))));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: valcid == null
                              ? Text("")
                              : ClipRRect(
                                  child:
                                      Image.network(valcid, fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width / 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0)),
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                valtitle == null ? "" : valtitle,
                                style: blueFontStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // Text(
                              //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold, fontSize: 13),
                              //   maxLines: 4,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                              // Html(
                              //   data: valkonten==null ? '' : valkonten.substring(0, 90) + '..',
                              // ),
                              Html(
                                data: valkonten == null ? '' : valkonten,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    valtgl == null ? "" : valtgl,
                                    style: blueFontStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    valkategori21 == null ? "" : valkategori21,
                                    style: blueFontStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height * 1.7,
          child: dataedu.length == 0
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[350],
                    highlightColor: Colors.white,
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[350]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[350]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[350]),
                        )
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataedu.length,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (PromosiDetail(
                                            cid: dataedu[index].cid == null
                                                ? ""
                                                : dataedu[index].cid,
                                            konten:
                                                dataedu[index].konten == null
                                                    ? ""
                                                    : dataedu[index].konten,
                                            title: dataedu[index].title == null
                                                ? ""
                                                : dataedu[index].title,
                                            caradapat:
                                                dataedu[index].caradapat == null
                                                    ? ""
                                                    : dataedu[index].caradapat,
                                            poinredeem:
                                                dataedu[index].poinreedem ==
                                                        null
                                                    ? ""
                                                    : dataedu[index].poinreedem,
                                          ))));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          child: Container(
                                            color: Colors.grey,
                                            height: 140,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Image.network(
                                                dataedu[index].cid,
                                                fit: BoxFit.fitHeight),
                                          ),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    ((MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3) +
                                                        40),
                                                child: Text(
                                                  dataedu[index].title,
                                                  style: blueFontStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              //SizedBox(height: 5),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    ((MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3) +
                                                        40),
                                                // child:Text("tes"),
                                                // Text(
                                                //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                                //   style: TextStyle(
                                                //       fontWeight: FontWeight.bold,
                                                //       fontSize: 13),
                                                //   maxLines: 3,
                                                //   overflow: TextOverflow.ellipsis,
                                                // ),

                                                // Html(
                                                //   data: dataedu[index]
                                                //       .konten
                                                //       .substring(
                                                //       0, 60) +
                                                //       '..',
                                                // ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                width: ((MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3) +
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3)) -
                                                    65,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      dataedu[index].crdt,
                                                      style: blueFontStyle
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Text(
                                                      dataedu[index].kategori,
                                                      style: blueFontStyle
                                                          .copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          );
                  }),
        ),
        SizedBox(
          height: 24,
        )
      ],
    );
  }

  Timer _timerpromo;

  Widget _loadingView() {
    if (_loading == false) {
      _loading = true;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext builderContext) {
            _timerpromo = Timer(Duration(seconds: 5), () {
              Navigator.of(context).pop();
            });

            return SpinKitThreeBounce(color: Colors.white);
          });
    }
  }

  Future<bool> _backPressed() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navigation_bottom()),
    );
  }
}
