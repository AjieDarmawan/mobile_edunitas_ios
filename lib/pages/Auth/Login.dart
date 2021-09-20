part of 'Auth.dart';

class Login extends StatefulWidget {
  //Login({Key key}) : super(key: key);
  final String etEmailAktivasil;
  Login({
    this.etEmailAktivasil,
  });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  var secureText = true;
  String email, password1;
  var status = false;

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  var InSignIn = false;
  var _trylogin = false;

  bool monVal = false;
  String _deviceId = 'Unknown';
  // TextEditingController etEmail = TextEditingController();
  TextEditingController etPassword = TextEditingController();

  Future<void> initPlatformState() async {
    String deviceId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   deviceId = await PlatformDeviceId.getDeviceId;
    // } on PlatformException {
    //   deviceId = 'Failed to get deviceId.';
    // }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
      print("deviceId->$_deviceId");
    });
  }

  final _formKey = GlobalKey<FormState>();

  void checkEmailAndPassowrd() async {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etEmail.text.isEmpty || etPassword.text.isEmpty) {
        Fluttertoast.showToast(
            msg: "Email/Password Tidak Boleh Kosong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else {
        // Toast.show("Login", context, duration: 3, gravity: Toast.BOTTOM);

        setState(() {
          _trylogin = true;
          InSignIn = true;
        });
        //checkInternet();
        masuklogin();
      }
    }
    ;
  }

  //conn has been updated 6 August 2021
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
        } else if (connectivityResult == ConnectivityResult.wifi) {
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
        } else {
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  void onErrHandling(erro){
    print("do_login_awal_err: "+erro.toString());
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
                Navigator.of(context).pop();
              },
              buttonText: 'Tutup',
            ),
          )).show(context);
    }
  }

  var etEmail;
  @override
  void initState() {
    super.initState();
    conn();
    _getFcmToken();
    initPlatformState();
    _initPackageInfo();
    etEmail = TextEditingController(text: widget.etEmailAktivasil);
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  //SessionManager sessionManager = SessionManager();

  String fcmToken;
  //final FirebaseMessaging _fcm = FirebaseMessaging();

  _getFcmToken() async {
    // fcmToken = await _fcm.getToken();
    // print("fcmtoken: " + fcmToken);
  }

  void masuklogin() {
    UserViewModel()
        .login(etEmail.text.toString(), etPassword.text.toString(),
            fcmToken.toString())
        .then((value) {//handled
      LoginModel data = value;

      if (data.status == 200) {
        setState(() {
          status = true;
          _trylogin = false;
          // sessionManager.savePreference(
          //     status, data.key, data.email, fcmToken.toString());
        });

        Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);
      } else if (data.status == 600) {
        setState(() {
          status = true;

          // sessionManager.savePreference(
          //     status, data.key, data.email, fcmToken.toString());
        });

        if (data.tmpdataKampus == null) {
          Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);
        } else {
          UserViewModel().check_login_tmp(data.tmpdataKampus).then((value) {//handled
            print("jackk: " + data.tmpdataProdi);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (HomeDetailPage(
                          campus: value[0],
                          kodejurusan: data.tmpdataProdi,
                          routef: 'Login',
                        ))));
          }).catchError((erro){
            onErrHandling(erro);
          });
        }

        //Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);

      } else if (data.status == 300) {
        setState(() {
          InSignIn = false;
        });

        return showDialog(
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
                            'Mohon Maaf !',
                            style: blueFontStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text('Anda Belum Reset Password !!'),
                      ],
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Batal",
                                style: blueFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                    width: 2.0, color: Colors.yellow[700]),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (FormForgetPassword(
                                              email2: etEmail.text.toString(),
                                            ))));
                              },
                              child: Text(
                                "Reset",
                                style: blueFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
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

        Flushbar(
          title: "Maaf !!",
          message: "Anda Belum Reset Password",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.fastOutSlowIn,
          boxShadows: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.red,
        )..show(context);

        // Fluttertoast.showToast(
        //     msg: "Email/Password Anda Salah",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.TOP,
        //     timeInSecForIosWeb: 1,
        //     fontSize: 16.0);

      } else if (data.status == 400) {
        Flushbar(
          title: "Maaf !!",
          message: "Email / Password Anda Salah",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.fastOutSlowIn,
          boxShadows: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.red,
        )..show(context);

        // Fluttertoast.showToast(
        //     msg: "Email/Password Anda Salah",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.TOP,
        //     timeInSecForIosWeb: 1,
        //     fontSize: 16.0);

        setState(() {
          InSignIn = false;
        });
      } else if (data.status == 401) {
        Flushbar(
          title: "Maaf !!",
          message: "Email Tidak Ditemukan",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.fastOutSlowIn,
          boxShadows: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.red,
        )..show(context);

        setState(() {
          InSignIn = false;
        });
      } else if (data.status == 405) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    (Activasi(email3: etEmail.text.toString()))));

        Flushbar(
          title: "Maaf !!",
          message: "Akun Anda Belum Aktif",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.fastOutSlowIn,
          boxShadows: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.red,
        )..show(context);

        setState(() {
          InSignIn = false;
        });
      } else if (data.status == 202) {
        Flushbar(
          title: "Berhasil",
          message: "Anda Berhasil Login Agent",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.fastOutSlowIn,
          boxShadows: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.green,
        )..show(context);

        setState(() {
          InSignIn = false;
        });

        setState(() {
          status = true;
          _trylogin = false;
          // sessionManager.savePreference(
          //     status, data.key, data.email, fcmToken.toString());
        });

        //masuk dari agent

        if (data.tmpdataKampus == null) {
          Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);
        } else {
          UserViewModel().check_login_tmp(data.tmpdataKampus).then((value) {//handled
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (AgensiLogin(
                          campus: value[0],
                          routef: 'agent',
                          email: etEmail.text.toString(),
                        ))));
          }).catchError((erro){
            onErrHandling(erro);
          });
        }

        // Navigator.of(context).pushNamedAndRemoveUntil(AGENSILOGIN, (route) => false);
      } else {
        Flushbar(
          title: "Maaf !!",
          message: "Email Tidak Ditemukan",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.fastOutSlowIn,
          boxShadows: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.red,
        )..show(context);
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          // systemNavigationBarColor: Colors.white, // navigation bar color
          statusBarColor: Colors.black26, // status bar color
          statusBarIconBrightness: Brightness.light, // status bar icon color
          statusBarBrightness: Brightness.light,
          // systemNavigationBarIconBrightness: Brightness.light, // color of navigation controls
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/intro/bgLogin.png'),
                        fit: BoxFit.cover)),
              ),
              ListView(
                children: [
                  SizedBox(height: 72),
                  Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 24, bottom: 8),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Selamat Datang",
                            textAlign: TextAlign.left,
                            style: blueFontStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          )),
                      Container(
                          padding: EdgeInsets.only(left: 24),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "di Komunitas Pendidikan",
                            textAlign: TextAlign.left,
                            style: blackFontStyle3.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        height: 56,
                      ),
                      Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 48, right: 48),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: double.infinity,
                                    child: Text(
                                      "Email",
                                      style: blackFontStyle2,
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: etEmail,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                        // focusedBorder: OutlineInputBorder(
                                        //   borderSide:
                                        //       BorderSide(color: Colors.white),
                                        //   borderRadius:
                                        //       BorderRadius.circular(25.7),
                                        // ),
                                        // enabledBorder: UnderlineInputBorder(
                                        //   borderSide:
                                        //       BorderSide(color: Colors.blue),
                                        //   borderRadius:
                                        //       BorderRadius.circular(25.7),
                                        // ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        // labelText: "Email",
                                        hintText: "me@email.com",
                                      ),
                                      validator: emailValidator,
                                      // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                                      onSaved: (value) {
                                        email = value;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: double.infinity,
                                    child: Text(
                                      "Kata Sandi",
                                      style: blackFontStyle2,
                                    ),
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                    obscureText: _isHidePassword,
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    //  keyboardType: TextInputType.visiblePassword,
                                    controller: etPassword,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide:
                                      //       BorderSide(color: Colors.white),
                                      //   borderRadius: BorderRadius.circular(25.7),
                                      // ),
                                      // enabledBorder: UnderlineInputBorder(
                                      //   borderSide:
                                      //       BorderSide(color: Colors.white),
                                      //   borderRadius: BorderRadius.circular(25.7),
                                      // ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          _togglePasswordVisibility();
                                        },
                                        child: Icon(
                                          _isHidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: _isHidePassword
                                              ? Colors.grey
                                              : Colors.blue,
                                        ),
                                      ),
                                      isDense: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      //labelText: "Password",
                                      hintText: "Kata Sandi",
                                    ),
                                    validator: nameValidator,
                                    onSaved: (value) {
                                      password1 = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            // Row(
                                            //   children: [
                                            //     Checkbox(
                                            //       value: monVal,
                                            //       onChanged: (bool value) {
                                            //         setState(() {
                                            //           monVal = value;
                                            //         });
                                            //       },
                                            //     ),
                                            //     Text(
                                            //       "Remember Me",
                                            //       style: TextStyle(
                                            //           color: Colors.black),
                                            //     ),
                                            //   ],
                                            // ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            (Email_forgetPassword())));
                                              },
                                              child: Text(
                                                "Lupa Kata Sandi",
                                                style: blueFontStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            (Navigation_bottom())));
                                              },
                                              child: Text(
                                                "Lewati",
                                                style: blueFontStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 48,
                                      child: InSignIn
                                          ? SpinKitFadingCircle(
                                              color: orenColor,
                                            )
                                          : EduButton(
                                              onPressed: () {
                                                checkEmailAndPassowrd();
                                              },
                                              buttonText: 'Masuk',
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48,
                                  ),
                                  Center(
                                    child: Text(
                                      'App version : ' +
                                          _packageInfo.version +
                                          '.' +
                                          _packageInfo.buildNumber,
                                      style: blueFontStyleBold.copyWith(
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 72,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 90, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Belum punya akun ?",
                      style: blackFontStyle3,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (Register())));
                        },
                        child: Text(
                          "Daftar",
                          style: blueFontStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
