part of 'wishlist.dart';

class MainWishlist extends StatefulWidget {
  MainWishlist({Key key}) : super(key: key);

  @override
  _MainWishlistState createState() => _MainWishlistState();
}

class _MainWishlistState extends State<MainWishlist> {
  DateTime currentBackPressTime;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "Tekan sekali lagi untuk keluar",
          backgroundColor: yellowColor,
          textColor: mainColor1,
          gravity: ToastGravity.BOTTOM);
      return Future.value(false);
    }
    return SystemNavigator.pop();
  }

  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  ScrollController _controller;
  SessionManager sessionManager = SessionManager();

  var gabs = CryptoData.getData;
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {
      //handled
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

  var datawhitlistget = [];
  void dataw(globalkey2) {
    //print("globalkey2${globalkey2}");
    Whitlistview_model().getwhitlist(globalkey2).then((value1) {
      //handled
      print(value1);
      setState(() {
        datawhitlistget = value1;
      });
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  void hapusw(id_hapus) {
    Whitlistview_model().hapuswhitlist(id_hapus.toString()).then((value1) {
      //handled
      StatusModel data = value1;
      if (data.status == 200) {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            //  timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            //  timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  void onErrHandling(erro) {
    print("do_login_err: " + erro.toString());
    if (erro.toString().contains("SocketException")) {
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
                getData();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void fcm() {
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     setState(() {
    //       _messageText = "Push Messaging message: $message";
    //     });
    //     FlutterRingtonePlayer.playNotification();
    //     print("onMessage: $message");
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     setState(() {
    //       _messageText = "Push Messaging message: $message";
    //     });
    //     print("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     setState(() {
    //       _messageText = "Push Messaging message: $message";
    //     });
    //     print("onResume: $message");
    //   },
    // );
    // //ios only
    // _firebaseMessaging.requestNotificationPermissions(
    //   const IosNotificationSettings(sound: true, badge: true, alert: true),
    // );
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });

    // _firebaseMessaging.getToken().then((String token) {
    //   assert(token != null);
    //   setState(() {
    //     _homeScreenText = "Push Messaging token: $token";
    //   });
    //   print(_homeScreenText);
    // });
  }

  //conn has been updated 22 August 2021
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
          getData();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
          getData();
        } else {
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  void getData() {
    fcm();
    dataw(globalkey);
  }

  @override
  void initState() {
    super.initState();
    conn();
    getPreferences();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  Widget shimmerLoading() {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[350],
              highlightColor: Colors.white,
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[350])),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[350])),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[350])),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[350])),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[350])),
                ],
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("datawhitlist${datawhitlistget.length}");
    // print("globalkey${globalkey}");
    dataw(globalkey);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
          child: globalkey == null
              ? NonLogin()
              : Scaffold(
                  appBar: AppBar(
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: Colors.transparent,
                    ),
                    automaticallyImplyLeading: false,
                    backgroundColor: mainColor1,
                    title: Text(
                      "Wishlist",
                      style: whiteFontStyle,
                    ),
                  ),
                  backgroundColor: CupertinoColors.systemGrey6,
                  body: Container(
                      //Center(datawhitlistget[0].nama=="tes123") ? Text("Belum Ada Whitlist") :
                      child: datawhitlistget == null
                          ? shimmerLoading()
                          : datawhitlistget.length == 0
                              ? shimmerLoading()
                              : Container(
                                  child: datawhitlistget[0].nama == "tes123"
                                      ? NoWishlist()
                                      : ListView.separated(
                                          padding: EdgeInsets.all(8.0),
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              height: 16,
                                            );
                                          },
                                          itemCount: datawhitlistget.length,
                                          itemBuilder: (context, index) {
                                            final Photo xkampus =
                                                datawhitlistget[index];
                                            return Container(
                                              height: 140,
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      spreadRadius: 2,
                                                      blurRadius: 4,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 128,
                                                    height: 128,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        datawhitlistget[index]
                                                            .cover,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                      child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              datawhitlistget[
                                                                      index]
                                                                  .singkatan,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                            ),
                                                            SizedBox(
                                                              height: 4,
                                                            ),
                                                            Text(
                                                              datawhitlistget[
                                                                      index]
                                                                  .nama,
                                                              style: TextStyle(
                                                                  color:
                                                                      mainColor1),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              height: 32,
                                                              child:
                                                                  EduButtonSecond(
                                                                      buttonText:
                                                                          "Daftar Sekarang",
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => (HomeDetailPage(
                                                                                      campus: xkampus,
                                                                                      routef: 'Wishlist',
                                                                                    ))));
                                                                      }),
                                                            ),
                                                            IconButton(
                                                                icon: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                onPressed: () {
                                                                  hapusw(datawhitlistget[
                                                                          index]
                                                                      .id);
                                                                })
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                                ],
                                              ),
                                            );
                                          }),
                                )),
                )),
    );
  }
}

class CryptoData {
  static final getData = [
    {'nameUnv': 'UM Surabaya', 'fnameUnv': ' Univesitas Muhammadiyah Surabaya'},
    {'nameUnv': 'Polnas', 'fnameUnv': 'Politeknik Nasional Denpasar'}
  ];
}
