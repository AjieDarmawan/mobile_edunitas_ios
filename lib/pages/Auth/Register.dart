part of 'Auth.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, email, password1, confrim_password;

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final loading = false;
  var InSignIn = false;

  TextEditingController etEmail = TextEditingController();
  TextEditingController etPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void checkEmailAndPassowrd() async {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etEmail.text.isEmpty) {
        // Toast.show("Email/Password Tidak Boleh Kosong", context,
        //     duration: 3, gravity: Toast.BOTTOM);

        Fluttertoast.showToast(
            msg: "Email/Password Tidak Boleh Kosong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => (RegistarDatadiri())));
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

  void cek_email() {
    UserViewModel().register_email(etEmail.text.toString()).then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        // Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);

        setState(() {
          InSignIn = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (RegistarDatadiri(
                      email2: etEmail.text.toString(),
                    ))));
      } else if (data.status == 500) {
        setState(() {
          InSignIn = false;

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (Activasi(email3: email, status: data.status,))));
        });

        // Fluttertoast.showToast(
        //     msg: "email belum active",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     fontSize: 16.0);

        // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      } else if (data.status == 400) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf !!",
          message: "Email Sudah Digunakan",
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
        // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      }
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
                Navigator.of(context).pop();
              },
              buttonText: 'Tutup',
            ),
          )).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Color(0xFF039ec7),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/intro/bgLogin.png'),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 96),
              Container(
                  padding: EdgeInsets.only(left: 24, bottom: 8),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Daftar Sekarang !",
                    textAlign: TextAlign.left,
                    style: blueFontStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  )),
              SizedBox(height: 150),
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
                                  borderRadius: BorderRadius.circular(5),
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
                          SizedBox(height: 48),
                          Center(
                            child: SizedBox(
                                height: 48,
                                width: MediaQuery.of(context).size.width / 2,
                                child: InSignIn
                                    ? SpinKitFadingCircle(
                                        color: orenColor,
                                      )
                                    : EduButton(
                                        onPressed: () {
                                          checkEmailAndPassowrd();
                                        },
                                        buttonText: 'Selanjutnya',
                                      )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
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
                  "Sudah punya akun ?",
                  style: blackFontStyle3,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => (Login())));
                    },
                    child: Text(
                      "Masuk",
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
    );
  }
}
