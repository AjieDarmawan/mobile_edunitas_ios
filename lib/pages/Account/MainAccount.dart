part of 'account.dart';

class MainAccount extends StatefulWidget {
  @override
  _MainAccountState createState() => _MainAccountState();
}

class _MainAccountState extends State<MainAccount> {
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
  SessionManager sessionManager = SessionManager();
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

  String fcmToken;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  _getFcmToken() async {
    fcmToken = await _fcm.getToken();
    print("fcmtoken: " + fcmToken);
  }

  String varnama,
      varemail,
      vargenre,
      varalamat,
      vartgl_lahir,
      vartempat_lahir,
      varpendidikan,
      varnohp,
      varnowa,
      vargender,
      no_virtual,
      campus_me,
      prodi_me,
      logo_me,
      kelas_me,
      nosel,
      singkatan_me,
      kode_campus_me,
      foto_me;

  UsersDetailModel data_me;
  void datausers() {
    UserViewModel().users_detail(globalEmail.toString()).then((value) {
      //handled
      UsersDetailModel data = value;
      data_me = value;

      if (data.status == 200) {
        setState(() {
          varnama = data.nama;
          varemail = data.email;
          varalamat = data.alamat;
          varpendidikan = data.pendidikan;
          varnohp = data.noHp;
          varnowa = data.noWa;
          vargender = data.genre;
          vartempat_lahir = data.tempatLahir;
          vartgl_lahir = data.tanggalLahir.toString();
          no_virtual = data.no_virtual;
          campus_me = data.campus;
          prodi_me = data.prodi;
          logo_me = data.logo;
          kelas_me = data.kelas;
          nosel = data.nosel;
          singkatan_me = data.singkatan;
          kode_campus_me = data.kodecampus;
          foto_me = data.foto;
        });
      }
    }).catchError((erro) {
      print("do_list_transaction_err: " + erro.toString());
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
                  conn();
                  getData();
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      } else {
        Flushbar(
            title: "Mohon Maaf",
            message: "Terjadi kesalahan, mohon hubungi pihak Edunitas",
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
                  conn();
                  getData();
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
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
    datausers();
    _getFcmToken();
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
    conn();
  }

  signOut() async {
    UserViewModel().logout(fcmToken.toString()).then((value) async {
      //handled
      StatusModel data = value;

      if (data.status == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        setState(() {
          preferences.setBool("status", false);
          preferences.clear();
          preferences.commit();
          Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);
        });
      } else {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        setState(() {
          preferences.setBool("status", false);
          preferences.clear();
          preferences.commit();
          Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);
        });
      }
    });
  }

  void _showcontent() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
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
                    "assets/dialog/dialogaskxhd.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 32,
                      child: Text(
                        'Logout',
                        style: blueFontStyle.copyWith(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Apakah anda yakin ingin keluar?',
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
                            Navigator.of(context).pop();
                          },
                          buttonText: "Batal",
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 32,
                        child: EduButton(
                          onPressed: () => signOut(),
                          buttonText: "Ya",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Timer _timerinfo;
  Widget _loadingView() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext builderContext) {
          _timerinfo = Timer(Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });

          return SpinKitThreeBounce(
            color: Colors.white,
          );
        });
  }

  Widget _loadingViewToNext() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext builderContext) {
          return SpinKitThreeBounce(
            color: Colors.white,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: globalkey == null
            ? null
            : AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: mainColor1,
          automaticallyImplyLeading: false,
          title: Text(
            "Akun Saya",
            style: whiteFontStyle,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _loadingView();
                  getPreferences();
                  conn();
                });
              },
            )
          ],
        ),
        body: globalkey == null
            ? NonLogin()
            : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: CupertinoColors.white,
                  child: Stack(
                    children: [
                      _background(),
                      varnama != null
                          ? _foreground()
                          : _foregroundLoading(),
                    ],
                  )),
              SizedBox(
                height: 24,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Dashboard Kampus",
                        style: blackFontStyle3,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: varnama != null
                          ? Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              checksingkron();
                            },
                            child: Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width /
                                  2.5,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  border: Border.all(
                                      color: mainColor1, width: 2)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.school_rounded,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Mahasiswa",
                                    style: blueFontStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        (SingkronPartner())));
                              },
                              child: Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: mainColor1,
                                        width: 2)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.supervisor_account,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Partner Kampus",
                                      style: blueFontStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                          : Container(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Dashboard Lowongan Kerja",
                        style: blackFontStyle3,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: varnama != null
                          ? Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      (KarirList(
                                        namalengkap:
                                        varnama == null
                                            ? ""
                                            : varnama,
                                        tempatlahir:
                                        vartempat_lahir ==
                                            null
                                            ? ""
                                            : vartempat_lahir,
                                        tanggallahir:
                                        vartgl_lahir == null
                                            ? ""
                                            : vartgl_lahir,
                                        nohp: varnohp == null
                                            ? ""
                                            : varnohp,
                                        nowa: varnowa == null
                                            ? ""
                                            : varnowa,
                                        pendidikan:
                                        varpendidikan ==
                                            null
                                            ? ""
                                            : varpendidikan,
                                        gender:
                                        vargender == null
                                            ? ""
                                            : vargender,
                                        alamat:
                                        varalamat == null
                                            ? ""
                                            : varalamat,
                                        foto_me: foto_me == null
                                            ? ""
                                            : foto_me,
                                        keycode: globalkey
                                            .toString() ==
                                            null
                                            ? ""
                                            : globalkey
                                            .toString(),
                                        //   ),
                                      ))));
                            },
                            child: Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width /
                                  2.5,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  border: Border.all(
                                      color: mainColor1, width: 2)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.work,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Karir Saya",
                                    style: blueFontStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        (MePartnerKarir(
                                          email: globalEmail
                                              .toString() ==
                                              null
                                              ? ""
                                              : globalEmail
                                              .toString(),
                                          keycode: globalkey
                                              .toString() ==
                                              null
                                              ? ""
                                              : globalkey
                                              .toString(),
                                        ))));
                              },
                              child: Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: mainColor1,
                                        width: 2)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.group_add,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Partner Karir",
                                      style: blueFontStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                          : Container(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Dashboard Pemberi Beasiswa",
                        style: blackFontStyle3,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: varnama != null
                          ? Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      (MeDonasi(
                                        keycode: globalkey
                                            .toString() ==
                                            null
                                            ? ""
                                            : globalkey
                                            .toString(),
                                      ))));
                            },
                            child: Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width /
                                  2.5,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  border: Border.all(
                                      color: mainColor1, width: 2)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.favorite_outlined,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Donasi Saya",
                                    style: blueFontStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        (MePartnerDonasi(
                                          keycode: globalkey
                                              .toString() ==
                                              null
                                              ? ""
                                              : globalkey
                                              .toString(),
                                          data_me: data_me,
                                        ))));
                              },
                              child: Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: mainColor1,
                                        width: 2)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.volunteer_activism,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Galang Dana",
                                      style: blueFontStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                          : Container(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    2.5,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              varnama != null
                  ? Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: mainColor1, width: 0.5),
                    bottom:
                    BorderSide(color: mainColor1, width: 0.5),
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ListDatadiri(
                            namalengkap: varnama == null ? "" : varnama,
                            tempatlahir: vartempat_lahir == null
                                ? ""
                                : vartempat_lahir,
                            tanggallahir: vartgl_lahir == null
                                ? ""
                                : vartgl_lahir,
                            nohp: varnohp == null ? "" : varnohp,
                            nowa: varnowa == null ? "" : varnowa,
                            pendidikan: varpendidikan == null
                                ? ""
                                : varpendidikan,
                            gender: vargender == null ? "" : vargender,
                            alamat: varalamat == null ? "" : varalamat,
                            foto_me: foto_me == null ? "" : foto_me,
                            keycode: globalkey.toString() == null
                                ? ""
                                : globalkey.toString(),
                            //   ),
                          ),
                    ));

                    // Navigator.of(context).push(new MaterialPageRoute(
                    //   builder: (BuildContext context) => EditAccount(
                    //     namalengkap: varnama == null ? "" : varnama ,
                    //     tempatlahir: vartempat_lahir == null ? "" : vartempat_lahir,
                    //     tanggallahir: vartgl_lahir == null ? "" :vartgl_lahir ,
                    //     nohp: varnohp == null ? "" : varnohp,
                    //     nowa: varnowa == null ? "" : varnowa ,
                    //     pendidikan: varpendidikan == null ? "" : varpendidikan,
                    //     gender: vargender == null ? "" : vargender,
                    //     alamat: varalamat == null ? "" : varalamat,
                    //     foto_me: foto_me == null ? "" : foto_me,
                    //   ),
                    // ));
                  },
                  leading: Icon(
                    Icons.person,
                    color: mainColor1,
                  ),
                  title: Text(
                    "Ubah Info Pribadi",
                    style: blackFontStyle2,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: mainColor1,
                  ),
                ),
              )
                  : Container(
                padding: EdgeInsets.only(top: 8),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[350],
                  highlightColor: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    color: Colors.grey[350],
                  ),
                ),
              ),
              varnama != null
                  ? Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                    BorderSide(color: mainColor1, width: 0.5),
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PasswordGanti(
                            email: globalEmail,
                          ),
                    ));
                  },
                  leading: Icon(
                    Icons.settings,
                    color: mainColor1,
                  ),
                  title: Text(
                    "Ganti Password",
                    style: blackFontStyle2,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: mainColor1,
                  ),
                ),
              )
                  : Container(
                padding: EdgeInsets.only(top: 8),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[350],
                  highlightColor: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    color: Colors.grey[350],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                height: 48,
                width: 250,
                child: EduButtonSecond(
                  onPressed: () {
                    _showcontent();
                  },
                  buttonText: "Keluar",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _background() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        gradient: LinearGradient(
          colors: [Colors.blue[200], Colors.blue[50]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //tileMode: TileMode.clamp,
        ),
      ),
    );
  }

  Widget _foreground() {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        varnama == null ? "" : varnama,
                        style: blueFontStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        varemail == null ? "" : varemail,
                        style: blueFontStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        varnohp == null ? "" : varnohp,
                        style: blueFontStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.network(
                      foto_me == null ? "" : foto_me,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 32,
              thickness: 1,
              color: Colors.white54,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2)
                    ],
                    stops: [
                      0.0,
                      1.0
                    ]),
              ),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pendidikan Terakhir :",
                        style: blackFontStyle3.copyWith(fontSize: 12),
                      ),
                      Text(
                        varpendidikan == null ? "" : varpendidikan,
                        style: blueFontStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jenis Kelamin :",
                        style: blackFontStyle3.copyWith(fontSize: 12),
                      ),
                      Text(
                        vargender == "L"
                            ? "Laki - Laki"
                            : vargender == "P"
                            ? "Perempuan"
                            : "",
                        style: blueFontStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tempat, Tanggal lahir :",
                        style: blackFontStyle3.copyWith(fontSize: 12),
                      ),
                      Text(
                        "${vartempat_lahir == null ? "" : vartempat_lahir}, ${vartgl_lahir == null ? "" : vartgl_lahir}",
                        style: blueFontStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alamat :",
                        style: blackFontStyle3.copyWith(fontSize: 12),
                      ),
                      Expanded(
                        child: Text(
                          varalamat == null ? "" : varalamat,
                          style: blueFontStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _foregroundLoading() {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350],
          highlightColor: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[350]),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 14,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[350]),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 14,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[350]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                          height: 64, width: 64, color: Colors.grey[350]),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 32,
                thickness: 1,
                color: Colors.white54,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[350]),
                width: double.infinity,
                height: 160,
              ),
            ],
          ),
        ));
  }

  void checksingkron() {
    _loadingViewToNext();
    Apiinfoview_model().check_singkron(globalEmail.toString()).then((value) {
      //handled
      StatusModel data = value;

      if (data.status == 200) {
        Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (List_me_campus(
                  email: globalEmail.toString() == null
                      ? ""
                      : globalEmail.toString(),
                  keycode: globalkey.toString() == null
                      ? ""
                      : globalkey.toString(),
                  namalengkap: varnama == null ? "" : varnama,
                  logo_me: logo_me == null ? "" : logo_me,
                  prodi_me: prodi_me == null ? "" : prodi_me,
                  campus_me: campus_me == null ? "" : campus_me,
                  no_virtual: no_virtual == null ? "" : no_virtual,
                  kelas_me: kelas_me == null ? "" : kelas_me,
                  nosel: nosel == null ? "" : nosel,
                  singkatan_me: singkatan_me == null ? "" : singkatan_me,
                  kode_campus_me: kode_campus_me.toString() == null
                      ? ""
                      : kode_campus_me.toString(),
                ))));
      } else if (data.status == 400) {
        Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (SingkronKampus(
                  email: globalEmail.toString() == null
                      ? ""
                      : globalEmail.toString(),
                  keycode: globalkey.toString() == null
                      ? ""
                      : globalkey.toString(),
                  namalengkap: varnama == null ? "" : varnama,
                  logo_me: logo_me == null ? "" : logo_me,
                  prodi_me: prodi_me == null ? "" : prodi_me,
                  campus_me: campus_me == null ? "" : campus_me,
                  no_virtual: no_virtual == null ? "" : no_virtual,
                  kelas_me: kelas_me == null ? "" : kelas_me,
                  nosel: nosel == null ? "" : nosel,
                  singkatan_me: singkatan_me == null ? "" : singkatan_me,
                  kode_campus_me: kode_campus_me.toString() == null
                      ? ""
                      : kode_campus_me.toString(),
                ))));
        // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      } else if (data.status == 404) {
        Navigator.of(context).pop();
        Flushbar(
          title: "Error",
          message: "Gagal",
          duration: Duration(seconds: 3),
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
        )..show(context);
        // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      } else {}
    });
  }
}
