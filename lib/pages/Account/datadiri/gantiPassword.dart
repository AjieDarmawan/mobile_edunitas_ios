part of 'pengaturan.dart';

class PasswordGanti extends StatefulWidget {
  //PasswordGanti({Key key}) : super(key: key);
  final String email;
  PasswordGanti({
    this.email,
  });
  @override
  _PasswordGantiState createState() => _PasswordGantiState();
}

class _PasswordGantiState extends State<PasswordGanti> {
  TextEditingController etPasswordLama = TextEditingController();
  TextEditingController etPasswordBaru = TextEditingController();
  bool _isHidePassword = true;
  bool _isHidePassword2 = true;

  String name, email, password1, confrim_password;
  var InSignIn = false;
  var etnama, ettempatlahir, etwa, ethp, etalamat;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _isHidePassword2 = !_isHidePassword2;
    });
  }

  void check() async {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      setState(() {
        InSignIn = true;
      });
      var passlama = etPasswordLama.text.toString();
      print("tes${passlama}");
      print("tes${etPasswordBaru.text.toString()}");

      // update_profile();

      UserViewModel()
          .gantiPassword(
        widget.email.toString(),
        etPasswordLama.text.toString(),
        etPasswordBaru.text.toString(),).then((value) {//handled
        StatusModel data = value;

        if (data.status == 200) {
          setState(() {
            InSignIn = false;
          });

          Navigator.pop(context);
          Flushbar(
            title: "Berhasil",
            message: "Data Berhasil Disimpan",
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
            backgroundColor: Colors.green[600],
          )..show(context);
        } else if (data.status == 500) {
          setState(() {
            InSignIn = false;
          });

          Flushbar(
            title: "Error",
            message:
                "Password harus lebih dari 6 karakter, mengandung huruf besar kecil dan angka",
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
        } else if (data.status == 400) {
          setState(() {
            InSignIn = false;
          });

          Flushbar(
            title: "Error",
            message: "Password sebelumnya Salah",
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
        } else if (data.status == 404) {
          setState(() {
            InSignIn = false;
          });

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
        } else {
          setState(() {
            InSignIn = false;
          });
        }
      }).catchError((erro){
        onErrHandling(erro);
      });
    };
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
                check();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("keycode${widget.email}");
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
              backgroundColor: Colors.blue[900],
              expandedHeight: 90.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Ganti Password',
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
                              "Password Lama",
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
                              controller: etPasswordLama,
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
                              "Password Baru",
                              style: blackFontStyle2,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              obscureText: _isHidePassword2,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              //  keyboardType: TextInputType.visiblePassword,
                              controller: etPasswordBaru,
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
                                    _togglePasswordVisibility2();
                                  },
                                  child: Icon(
                                    _isHidePassword2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: _isHidePassword2
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
                          SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 48,
                              child: InSignIn
                                  ? SpinKitFadingCircle(color: orenColor)
                                  : EduButton(
                                      onPressed: () {
                                        check();
                                      },
                                      buttonText: 'Simpan',
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]))
          ],
        ));
  }
}
