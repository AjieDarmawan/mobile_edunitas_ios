part of 'home.dart';

class MainHome extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  _MainHomeState createState() => _MainHomeState();
/*
  final int selectedIndex;
  MainHome({Key key, this.selectedIndex}) : super(key: key);*/
}

class _MainHomeState extends State<MainHome> with TickerProviderStateMixin {
  //int selectedIndex = 0;
  bool _dummyNotif = true;
  PageController pageController = PageController(initialPage: 0);

  AnimationController _animationController;
  Animation _colortween;
  bool isPlaying = false;
  bool promoList = false;

  //Apeng Here
  AnimationController _ColorAnimationController;
  Animation _colorTweenContainer, _iconColorTween, _shadowColorTween;
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

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

  Future<List<BannerModel>> getBanner() async {
    final response = await http.get(Uri.parse(ConstanUrl().baseUrl + "banner"));
    return bannerModelFromJson(response.body);
  }

  // Future<void> checkVersion() async {
  //   final checkVersion = CheckVersion(context: context);
  //   final appStatus = await checkVersion.getVersionStatus();
  //   if (appStatus.canUpdate) {
  //     //checkVersion.showUpdateDialog("com.edunitas", "id0123456789");
  //     updateDialog('com.edunitas');
  //   }
  //   print("canUpdate ${appStatus.canUpdate}");
  //   print("localVersion ${appStatus.localVersion}");
  //   print("appStoreLink ${appStatus.appStoreUrl}");
  //   print("storeVersion ${appStatus.storeVersion}");
  // }

  // void updateDialog(
  //     String androidApplicationId,
  //     //String iOSAppId,
  //     {
  //       AppVersionStatus versionStatus,
  //       String message = "You can now update this app from store.",
  //       String titleText = 'Update Available',
  //       String dismissText = 'Later',
  //       String updateText = 'Update Now',
  //     }) async {
  //   Text title = Text(titleText);
  //   final content = Text(message);
  //   Text dismiss = Text(dismissText);
  //   final dismissAction = () => Navigator.pop(context);
  //   Text update = Text(updateText);
  //   final updateAction = () {
  //     _launched = _launchInBrowser('https://play.google.com/store/apps/details?id='+androidApplicationId);
  //     Navigator.pop(context);
  //   };
  //   final platform = Theme.of(context).platform;
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return platform == TargetPlatform.iOS
  //           ? CupertinoAlertDialog(
  //         title: title,
  //         content: content,
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             child: dismiss,
  //             onPressed: dismissAction,
  //           ),
  //           CupertinoDialogAction(
  //             child: update,
  //             onPressed: updateAction,
  //           ),
  //         ],
  //       )
  //           : AlertDialog(
  //         title: title,
  //         content: content,
  //         actions: <Widget>[
  //           FlatButton(
  //             child: dismiss,
  //             onPressed: dismissAction,
  //           ),
  //           FlatButton(
  //             child: update,
  //             onPressed: updateAction,
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void getData() {
    //checkVersion();
    getBanner();
    getTerpopuler();
    getberitaterbaru();
    getpromositerbaru();
    fcm();
  }

  //conn has been updated 1 August 2021

  var globalkey = "",
      globalEmail = "";
  var status = false;
  var mystatus;
  SessionManager sessionManager = SessionManager();

  void getPreferences() async {
    await sessionManager.getPreference().then((value) { //handled
      setState(() {
        mystatus = sessionManager.status;
        globalkey = sessionManager.key;
        globalEmail = sessionManager.email;
        print("email${globalEmail}");
        print("globalkey${globalkey}");
      });
    });
  }

  var waktu = Waktu();

  // using specific time
  DateTime datetime =
  DateTime.parse(DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()));

  //DateTime _dateNow = DateTime.parse(DateFormat("dd-MMM-yyyy").format(DateTime.now()));

  var dataTerpopuler = new List();

  void getTerpopuler() {
    HomeViewModel().getTerpopuler().then((value) { //handled
      setState(() {
        dataTerpopuler = value;
        print("check_kampus_pop: " + databerita.toString());
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  //berita terbaru
  var databerita = new List();

  void getberitaterbaru() {
    Eduinfoview_model().getterbaru().then((value1) { //handled
      setState(() {
        databerita = value1;
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  var now = DateTime.now();

  //promosi terbaru
  var datapromosi = new List();
  var valtglhingga;

  void getpromositerbaru() {
    Eduinfoview_model().getPromositerbaru().then((value1) { //handled
      setState(() {
        datapromosi = value1;
        valtglhingga =
        datapromosi[0].hingga == null ? "" : datapromosi[0].hingga;
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  var _stillhandling = false;

  void onErrHandling(erro) {
    print("do_home_err: " + erro.toString());
    var _error_val_cather = erro.toString().substring(0, 49);
    if (_stillhandling == false) {
      setState(() {
        _stillhandling = true;
      });
      if (_error_val_cather.contains("SocketException")) {
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
                  _stillhandling = false;
                  getData();
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    }
  }

  int varcountread = 0;

  countread(globalkey1) {
    Kampusview_model().count_read(globalkey1.toString()).then((
        value) { //handled
      StatusModel data = value;
      //print("countdata${data.status}");
      setState(() {
        if (data.status == 200) {
          varcountread = 200;
          //print("read masih ada yg belum dibaca");
        } else if (data.status == 404) {
          varcountread = 404;
          //print("read bersih");
        } else {
          varcountread = 405;
          //print("read gagal lain");
        }
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void fcm() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        FlutterRingtonePlayer.playNotification();
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onResume: $message");
      },
    );
    //ios only
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: $token";
      });
      print(_homeScreenText);
    });
  }

  // Future<void> fcmSubcribe() async {
  //   {
  //     print(
  //         'FlutterFire Messaging Example: Subscribing to topic "fcm_test".');
  //     await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
  //     print(
  //         'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.');
  //   }
  // }
  //
  // Future<void> fcmUnsubcribe() async {
  //   {
  //       print(
  //           'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".');
  //       await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
  //       print(
  //           'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.');
  //     }
  //   }
  //
  //   Future<void> getToken() async {
  //         if (defaultTargetPlatform == TargetPlatform.iOS ||
  //             defaultTargetPlatform == TargetPlatform.macOS) {
  //           print('FlutterFire Messaging Example: Getting APNs token...');
  //           String token = await FirebaseMessaging.instance.getAPNSToken();
  //           print('FlutterFire Messaging Example: Got APNs token: $token');
  //         } else {
  //           print(
  //               'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.');
  //         }
  //   }

      Future changeColors() async {
        while (true) {
          await new Future.delayed(const Duration(milliseconds: 400), () {
            if (_animationController.status == AnimationStatus.completed) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          });
        }
      }

      @override
      void dispose() {
        _animationController.dispose();
        super.dispose();
      }

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  // AndroidNotificationChannel channel;

      @override
      void initState() {
        super.initState();
        getPreferences();
        getData();
        _animationController =
            AnimationController(
                vsync: this, duration: Duration(milliseconds: 200));
        _colortween = ColorTween(begin: Colors.white, end: Colors.transparent)
            .animate(_animationController);

        //apeng here
        _ColorAnimationController =
            AnimationController(vsync: this, duration: Duration(seconds: 0));
        _colorTweenContainer =
            ColorTween(begin: Colors.white.withOpacity(0.0), end: Colors.white)
                .animate(_ColorAnimationController);
        _iconColorTween = ColorTween(begin: Colors.white, end: Colors.grey[100])
            .animate(_ColorAnimationController);
        _shadowColorTween =
            ColorTween(begin: Colors.transparent, end: Colors.black12)
                .animate(_ColorAnimationController);

        changeColors();
        //checkInternet();
        //_getFcmToken();

        _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            setState(() {
              _messageText = "Push Messaging message: $message";
            });
            print("onMessage: $message");
          },
          onLaunch: (Map<String, dynamic> message) async {
            setState(() {
              _messageText = "Push Messaging message: $message";
            });
            print("onLaunch: $message");
          },
          onResume: (Map<String, dynamic> message) async {
            setState(() {
              _messageText = "Push Messaging message: $message";
            });
            print("onResume: $message");
          },
        );
        _firebaseMessaging.requestNotificationPermissions(
            const IosNotificationSettings(sound: true, badge: true, alert: true));
        _firebaseMessaging.onIosSettingsRegistered
            .listen((IosNotificationSettings settings) {
          print("Settings registered: $settings");
        });
        _firebaseMessaging.getToken().then((String token) {
          assert(token != null);
          setState(() {
            _homeScreenText = "Push Messaging token: $token";
          });
          print(_homeScreenText);
        });
        //
        // fcmSubcribe();
        // getToken();
      }

      //apeng here
      bool _scrollListener(ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.axis == Axis.vertical) {
          _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 100);

          return true;
        }
      }

      @override
      Widget build(BuildContext context) {
        countread(globalkey);
        SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white24));

        return Scaffold(
          backgroundColor: CupertinoColors.systemGrey6,
          body: WillPopScope(
            onWillPop: _onWillPop,
            child: Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: _scrollListener,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: FutureBuilder(
                              future: getBanner(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print(snapshot.hasError);
                                List<BannerModel> dataSlider = snapshot.data;
                                return Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: Column(
                                    children: <Widget>[
                                      CarouselSlider.builder(
                                          itemCount: dataSlider == null
                                              ? 0
                                              : dataSlider.length,
                                          itemBuilder: (context, index) {
                                            return snapshot.hasData
                                                ? Container(
                                              child: Image.network(
                                                dataSlider[index].file,
                                                fit: BoxFit.fill,
                                                width: double.infinity,
                                                height: 180,
                                              ),
                                            )
                                                : Container(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: SizedBox(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[350],
                                                  highlightColor:
                                                  Colors.white,
                                                  child: Container(
                                                    height:
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height /
                                                        4.9,
                                                    child: Card(),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          options: CarouselOptions(
                                            height:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height /
                                                4,
                                            viewportFraction: 1.0,
                                            enlargeCenterPage: false,
                                            autoPlay: true,
                                          ))
                                    ],
                                  ),
                                );
                              }),
                        ),

                        //MENU
                        Container(
                          color: Colors.white,
                          height: 100,
                          width: double.infinity,
                          child: MenuHome(keycode: globalkey.toString() == null
                              ? ""
                              : globalkey.toString()),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rekomendasi Kampus",
                                      style: blueFontStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Kampus Fleksibel dan Terjangkau",
                                      style: blackFontStyle1.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Bersponsor",
                                      maxLines: 1,
                                      style: blackFontStyle1.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        dataTerpopuler == null || dataTerpopuler.length == 0
                            ? Container(
                          color: Colors.white,
                          height: 160,
                          width: double.infinity,
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.5,
                            height: 130,
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
                                      width: 240,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.grey[350]),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.grey[350]),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                            : Container(
                          height: 160,
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dataTerpopuler.length,
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                final xrekomendasi = dataTerpopuler[i];
                                return MenuRekomendasi(
                                  rekomendasi: xrekomendasi,
                                );
                              },
                              // children: [
                              //   MenuRekomendasi(),
                              // ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        //PageKampus
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 3.6,
                          width: double.infinity,
                          child: PageKampus(),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 10.0,
                                    top: 16.0,
                                    bottom: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Info",
                                      style: blueFontStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Info Pilihan",
                                          style: blackFontStyle1.copyWith(
                                            fontSize: 11,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          Waktu(datetime).yMMMMEEEEd(),
                                          style:
                                          blueFontStyle.copyWith(fontSize: 11),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            (BeritatTab(
                                              key_enter: 1,
                                            ))));
                                  },
                                  child: Text(
                                    "Semua Info",
                                    maxLines: 1,
                                    style: blueFontStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Berita
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue[200],
                                Colors.blue[100],
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          height: 160,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: databerita == null || databerita.length == 0
                              ? Container(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 150,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[350],
                                highlightColor: Colors.white,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 240,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.grey[350]),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 240,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.grey[350]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                              : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: databerita.length,
                              itemBuilder: (context, index) {
                                final xdataberita = databerita[index];
                                return MenuBerita(
                                  databerita: xdataberita,
                                  kategori: "berita",
                                );
                              }
                            //MenuBerita(),
                          ),
                        ),

                        //Promosi
                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Promosi",
                                      style: blueFontStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Promo Pilihan",
                                          style: blackFontStyle1.copyWith(
                                            fontSize: 11,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          Waktu(datetime).yMMMMEEEEd(),
                                          style:
                                          blueFontStyle.copyWith(fontSize: 11),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            (PromosiTab(
                                              key_enter: 1,
                                            ))));
                                  },
                                  child: Text(
                                    "Semua Promosi",
                                    maxLines: 1,
                                    style: blueFontStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Promosi
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange[200],
                                Colors.orange[100],
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          height: 140,
                          width: double.infinity,
                          child: datapromosi == null || datapromosi.length == 0
                              ? Container(
                            margin: EdgeInsets.fromLTRB(8, 8, 0, 8),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 140,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[350],
                                highlightColor: Colors.white,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 240,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.grey[350]),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 240,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.grey[350]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                              : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  height: 140,
                                  width: 240,
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/promosi.jpg"),
                                            fit: BoxFit.cover),
                                      ),
                                      child: InkWell(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        onTap: () =>
                                            setState(() {
                                              _launched = _launchInBrowser(
                                                  'https://edunitas.com/edupromotion/partner');
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: datapromosi.length,
                                    itemBuilder: (context, index) {
                                      final xdatapromosi = datapromosi[index];
                                      DateTime _date =
                                      DateFormat('dd-MMM-yyyy').parse(
                                          (xdatapromosi.hingga)
                                              .toString());
                                      DateTime _dateN =
                                      DateFormat('yyyy-MM-dd hh:mm:ss')
                                          .parse((datetime).toString());
                                      if (_date.isAfter(_dateN) ||
                                          _date.isAtSameMomentAs(_dateN)) {
                                        return MenuPromosi(
                                          databerita: xdatapromosi,
                                          kategori: "promosi",
                                        );
                                      } else {
                                        return index == 0
                                            ? Container(
                                          margin: EdgeInsets.fromLTRB(
                                              8, 8, 8, 8),
                                          height: 140,
                                          width: 240,
                                          child: Card(
                                            elevation: 2,
                                            shape:
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10)),
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/NoPromosi.jpg"),
                                                    fit: BoxFit.cover),
                                              ),
                                              child: InkWell(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(10),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                        )
                                            : null;
                                      }
                                    }
                                  //MenuBerita(),
                                ),
                              ],
                            ),
                          ),
                          /*: Center(
                      child: Text("Tidak Ada Promo"),
                    ),*/
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kampus Populer",
                                      style: blueFontStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Tertarik Lihat Kampusnya?",
                                      style: blackFontStyle1.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Bersponsor",
                                      maxLines: 1,
                                      style: blackFontStyle1.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                            color: Colors.white,
                            height: 320,
                            child: dataTerpopuler == null ||
                                dataTerpopuler.length == 0
                                ? Container(
                              color: Colors.white,
                              child: GridView.builder(
                                padding: EdgeInsets.only(top: 16),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                                itemCount: 12,
                                itemBuilder: (BuildContext context, int i) {
                                  // return Container(child: Center(child: Terpopuler(logo : xpopuler.logo)));
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey[350],
                                    highlightColor: Colors.white,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 48,
                                            width: 48,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.grey[350]),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            child: Text(
                                              'loading',
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: mainColor1),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                                : GridView.builder(
                              padding: EdgeInsets.only(top: 16),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                              itemCount: dataTerpopuler.length,
                              itemBuilder: (BuildContext context, int i) {
                                final xpopuler = dataTerpopuler[i];
                                // return Container(child: Center(child: Terpopuler(logo : xpopuler.logo)));
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            (HomeDetailPage(
                                              campus: xpopuler,
                                              routef: 'HomeMain',
                                            ))));
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 48,
                                          width: 48,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 2.0,
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.network(
                                              xpopuler.logo,
                                              height: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height /
                                                  9,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width /
                                                  3,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: Text(
                                            xpopuler.singkatan,
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: mainColor1),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _ColorAnimationController,
                  builder: (context, child) =>
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 9,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: _shadowColorTween.value,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          ),
                          color: _colorTweenContainer.value,
                        ),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 24,
                                padding: EdgeInsets.only(left: 8),
                                child: Center(
                                  child: Image.asset('assets/logo.png'),
                                ),
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 24,
                                  width: MediaQuery.of(context).size.width / 1.8,
                                  child: Builder(
                                    builder: (context) => GestureDetector(
                                      onTap: () async {
                                        await showSearch(
                                            context: context, delegate: SearchHome(widget.list));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: _iconColorTween.value,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                offset: const Offset(1.1, 1.1),
                                                blurRadius: 4.0),
                                          ],
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.search,
                                                color: Colors.grey,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Pencarian Kampus",
                                                style: blueFontStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: mainColor1.withOpacity(0.6)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              IconButton(
                                icon: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/home/chat.png",
                                      width: 24,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 10,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => (MainInbox())));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        );
      }

      // Widget _wbuildLogo() {
      //   return Container(
      //     height: 24,
      //     padding: EdgeInsets.only(left: 8),
      //     child: Center(
      //       child: Image.asset('assets/logo.png'),
      //     ),
      //   );
      // }
      //
      // Widget _wbuildSearch() {
      //   return Container(
      //     //margin: EdgeInsets.symmetric(horizontal: 8),
      //       height: 24,
      //       width: MediaQuery
      //           .of(context)
      //           .size
      //           .width / 1.8,
      //       child: Builder(
      //         builder: (context) =>
      //             GestureDetector(
      //               onTap: () async {
      //                 await showSearch(
      //                     context: context, delegate: SearchHome(widget.list));
      //               },
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                   color: _iconColorTween.value,
      //                   boxShadow: <BoxShadow>[
      //                     BoxShadow(
      //                         color: Colors.grey.withOpacity(0.5),
      //                         offset: const Offset(1.1, 1.1),
      //                         blurRadius: 4.0),
      //                   ],
      //                 ),
      //                 child: Container(
      //                   padding: EdgeInsets.only(left: 8),
      //                   child: Row(
      //                     children: [
      //                       Icon(
      //                         Icons.search,
      //                         color: Colors.grey,
      //                         size: 15,
      //                       ),
      //                       SizedBox(
      //                         width: 5,
      //                       ),
      //                       Text(
      //                         "Pencarian Kampus",
      //                         style: blueFontStyle.copyWith(
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 10,
      //                             color: mainColor1.withOpacity(0.6)),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //       ));
      // }
      //
      // Widget _wbuildIcon() {
      //   return IconButton(
      //     icon: Stack(
      //       children: [
      //         Image.asset(
      //           "assets/home/chat.png",
      //           width: 24,
      //         ),
      //         Icon(
      //           Icons.circle,
      //           color: Colors.red,
      //           size: 10,
      //         ),
      //       ],
      //     ),
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => (MainInbox())));
      //     },
      //   );
      // }

      _buildLogo() => Container(
            height: 24,
            padding: EdgeInsets.only(left: 8),
            child: Center(
              child: Image.asset('assets/logo.png'),
            ),
          );

      _buildSearch() => Container(
          //margin: EdgeInsets.symmetric(horizontal: 8),
          height: 24,
          width: MediaQuery.of(context).size.width / 1.8,
          child: Builder(
            builder: (context) => GestureDetector(
              onTap: () async {
                await showSearch(
                    context: context, delegate: SearchHome(widget.list));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _iconColorTween.value,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 4.0),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Pencarian Kampus",
                        style: blueFontStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: mainColor1.withOpacity(0.6)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));

      _buildIcon() => IconButton(
            icon: Stack(
              children: [
                Image.asset(
                  "assets/home/chat.png",
                  width: 24,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 10,
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => (MainInbox())));
            },
          );
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";
  var _move = false;

  // List<Photo> datakampus1(String query, context) {
  //   List<Photo> dataSearchKampus = new List();
  //   //List<Photo> _photos = [];
  //
  //   Kampusview_model().SearchgetKampusFront(query).then((value1) {
  //     print(value1);
  //     print("SearchgetKampusq= $query");
  //     return dataSearchKampus = value1;
  //   }).catchError((erro){
  //     onErrHandlingS(erro, context);
  //   });
  //
  //   //return dataSearchKampus;
  //
  //   //print("resultnyabos=" + dataSearchKampus.length.toString());
  //   return dataSearchKampus;
  // }

  void onErrHandlingS(erro, context){
    print("do_login_err: "+erro.toString());
    var _error_val_cather = erro.toString().substring(0,49);
    if(_error_val_cather.contains("SocketException")){
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
                getSearch(context);
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  Future<List<Photo>> getSearch(context) async {
    List<Photo> data;
    await http.post(Uri.parse(ConstanUrl().baseUrl + "search_campus_home"), body: {
      'search': query,
    }).then((value) {//handled
      data = Photo.parseList(json.decode(value.body));
      return data;
    }).catchError((erro){
      onErrHandlingS(erro, context);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: getSearch(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.hasError);
          List<Photo> results = snapshot.data;
          var resleng = results == null ? 0 : results.length;
          if (resleng == 0) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
          } else {
            Photo dongs = results[0];
            return SingleChildScrollView(
              child: Container(
                //api kampus search
                child: ListView.builder(
                  itemCount: results.length == 0 ? 0 : results.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    final Photo xkampus = results[i];
                    return ListKampusCard(
                      campus: xkampus,
                      routef: 'Home',
                      nilaiunitarea: "",
                      nilaikelas: "",
                      nilaijurusan: "",
                      nilai: "1",
                      key_enter: 1,
                    );
                  },
                ),
              ),
            );
          }
        });
  }

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    /*List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );*/
    return Container();
  }
}