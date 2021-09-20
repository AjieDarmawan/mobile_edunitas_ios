part of 'Auth.dart';

class FormForgetPassword extends StatefulWidget {
  final String email2;
  FormForgetPassword({
    this.email2,
  });

  @override
  _FormForgetPasswordState createState() => _FormForgetPasswordState();
}

class _FormForgetPasswordState extends State<FormForgetPassword> {
  String name, email, password1, confrim_password;
  List<PendidikanModel> datapendidikan = new List();
  var etemail;
  // TextEditingController etEmail = TextEditingController();

  TextEditingController etkode_aktivasi = TextEditingController();
  TextEditingController etnowa = TextEditingController();
  TextEditingController etPassword = TextEditingController();
  TextEditingController etPassword2 = TextEditingController();
  var InSignIn = false;
  var valpendidikan;

  final _formKey = GlobalKey<FormState>();
  bool _isHidePassword = true;

  void resend_pin2() {
    UserViewModel()
        .resend_pin(
      widget.email2.toString(),
    )
        .then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        Flushbar(
          title: "Sukses",
          message: "Email berhasil dikirim ke alamat email anda",
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
          backgroundColor: Colors.green[800],
        )..show(context);
      } else if (data.status == 400) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf",
          message: "Email Gagal Terkirim",
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
      } else {
        setState(() {
          InSignIn = false;
        });
      }
    }).catchError((erro){
      InSignIn = false;
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
                getpendidikan();
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
    getpendidikan();
    etemail = TextEditingController(text: widget.email2);
   // resend_pin2();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void getpendidikan() async {
    Masterview_model().masterpendidikan().then((value2) {//handled
      setState(() {
        datapendidikan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void checkEmailAndPassowrd() async {
    print("email${widget.email2.toString()}");
    print("codereff${etkode_aktivasi.toString()}");
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etPassword.text.isEmpty || valpendidikan.toString().isEmpty) {
        // Toast.show("Email/Password Tidak Boleh Kosong", context,
        //     duration: 3, gravity: Toast.BOTTOM);

        Fluttertoast.showToast(
            msg: "Harus Di isi Semua",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            fontSize: 16.0);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => (FormForgetPassword())));
      } else {
        // Toast.show("Login", context, duration: 3, gravity: Toast.BOTTOM);
        //login();

        setState(() {
          InSignIn = true;
        });

        cek_email();
      }
    }
    ;
  }

  String confirmValidator(String value) {
    _formKey.currentState.save();
    print("myPassword" + password1);
    if (value == password1) {
      print("berhasil $value $password1");
      return null;
    } else {
      print("gagal $value $password1");

      if (value.length == 0) {
        return "Kata sandi harus lebih dari 4";
      } else {
        return "Pengulangan kata sandi tidak sama";
      }
    }
  }

  void cek_email() {
    UserViewModel()
        .form_forgetpassword(widget.email2.toString(),
            etPassword.text.toString(), etkode_aktivasi.text.toString())
        .then((value) {//handled
      StatusModel data = value;
      print("status${data.status}");

      if (data.status == 200) {
        //Navigator.of(context).pushNamedAndRemoveUntil(ACTIVASI, (route) => false);

        

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => (Login())));

            Flushbar(
          title: "Sukses",
          message: "Email berhasil dikirim, silahkan cek email anda",
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
          backgroundColor: Colors.green[800],
        )..show(context);
      } else if (data.status == 404) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf",
          message:
              "Password harus lebih dari 6 karakter, mengandung huruf besar kecil dan angka",
          duration: Duration(seconds: 5),
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
      } else if (data.status == 400) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf",
          message: "Email tidak di temukan",
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
      } else if (data.status == 500) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf",
          message: "Kode aktivasi salah",
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
      } else {
        setState(() {
          InSignIn = false;
        });
      }
    }).catchError((erro){
      InSignIn = false;
      onErrHandling(erro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // backgroundColor: Color(0xFF039ec7),

        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              )),
              automaticallyImplyLeading: false,
              brightness: Brightness.dark,
              pinned: true,
              snap: true,
              floating: true,
              backgroundColor: mainColor1,
              expandedHeight: 90.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Formulir Lupa Kata Sandi',
                  style: whiteFontStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 16),
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
                                controller: etemail,
                                enabled: false,
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
                                    fillColor: Colors.blue[100],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    // labelText: "Email",
                                    hintText: "Email"),
                                validator: emailValidator,
                                // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                                onSaved: (value) {
                                  email = value;
                                },
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              child: Text(
                                "Kata Sandi",
                                style: blackFontStyle2,
                              ),
                            ),
                            Container(
                              child: TextFormField(
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
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              child: Text(
                                "Ulangi Kata Sandi",
                                style: blackFontStyle2,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                obscureText: _isHidePassword,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                //  keyboardType: TextInputType.visiblePassword,
                                controller: etPassword2,
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
                                validator: confirmValidator,
                                onSaved: (value) {
                                  confrim_password = value;
                                },
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              child: Text(
                                "Kode Aktivasi",
                                style: blackFontStyle2,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                keyboardType: TextInputType.phone,
                                controller: etkode_aktivasi,
                                maxLength: 7,
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // labelText: "Email",
                                  hintText: "123456",
                                ),
                                validator: activasiValidator,
                                // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                                onSaved: (value) {
                                  email = value;
                                },
                              ),
                            ),
                            SizedBox(height: 24),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 48,
                                child: InSignIn
                                    ? SpinKitFadingCircle(
                                        color: orenColor,
                                      )
                                    : EduButton(
                                        onPressed: () {
                                          checkEmailAndPassowrd();
                                        },
                                        buttonText: 'Kirim Formulir',
                                      ),
                              ),
                            ),
                            SizedBox(height: 48),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Belum mendapatkan PIN ?",
                                  style: blackFontStyle3,
                                ),
                                TextButton(
                                    onPressed: () {
                                      resend_pin2();
                                    },
                                    child: Text(
                                      "Kirim PIN",
                                      style: blackFontStyle3.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
