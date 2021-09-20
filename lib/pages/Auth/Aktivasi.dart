part of 'Auth.dart';

class Activasi extends StatefulWidget {
  final String email3;
  final int status;
  Activasi({
    this.email3,
    this.status,
  });

  @override
  _ActivasiState createState() => _ActivasiState();
}

class _ActivasiState extends State<Activasi> {
  String name, email;

  Future<bool> _onWillPop() {
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
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
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

  final loading = false;
  var InSignIn = false;

  TextEditingController etEmail = TextEditingController();
  TextEditingController etactivasi = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void checkEmailAndPassowrd() async {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etactivasi.text.isEmpty) {
        Fluttertoast.showToast(
            msg: "Tidak Boleh Kosong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            fontSize: 16.0);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => (Login())));
      } else {
        setState(() {
          InSignIn = true;
        });

        activasi_api();
      }
    }
    ;
  }

  void resend_pin2() {
    UserViewModel()
        .resend_pin(widget.email3.toString(),).then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
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
      } else if (data.status == 400) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf",
          message: "Email tidak ditemukan",
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

  void activasi_api() {
    UserViewModel().aktivasi(widget.email3.toString(),
      etactivasi.text.toString(),).then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        // Fluttertoast.showToast(
        //     msg: "Success",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 3,
        //     fontSize: 16.0);

        Flushbar(
          title: "Sukses",
          message: "Akun anda sudah aktif",
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

        Navigator.of(context)
            .pushNamedAndRemoveUntil(SIGN_IN, (route) => false);

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => (Activasi(email3:widget.email2.toString()))));
      } else if (data.status == 404) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf",
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
      } else if (data.status == 400) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf",
          message: "Aktivasi Salah",
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
                Navigator.of(context).pop();
              },
              buttonText: 'Tutup',
            ),
          )).show(context);
    }
  }

  var etemail;
  int status =0;
  @override
  void initState() {
    super.initState();
    //resend_pin2();

    etemail = TextEditingController(text: widget.email3);
    status = widget.status;
    if(status==500){
      Flushbar(
        title: "Email Belum Aktif",
        message: "Anda Sudah Memiliki Akun Silahkan Aktivasi Terlebih dahulu",
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
        status=0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
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
              children: <Widget>[
                SizedBox(
                  height: 72,
                ),
                Container(
                    padding: EdgeInsets.only(left: 24, bottom: 8),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Silahkan Cek Email Anda",
                      textAlign: TextAlign.left,
                      style: blueFontStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    )),
                Container(
                    padding: EdgeInsets.only(left: 24),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "dan masukan kode aktivasi",
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
                                  hintText: "Email",
                                ),
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
                                "Kode Aktivasi",
                                style: blackFontStyle2,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                keyboardType: TextInputType.number,
                                controller: etactivasi,
                                maxLength: 6,
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
                                  hintText: "6 Digit PIN",
                                ),
                                validator: activasiValidator,
                                // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                                onSaved: (value) {
                                  email = value;
                                },
                              ),
                            ),
                            SizedBox(height: 16),
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
                                          buttonText: 'Konfirmasi',
                                        )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(bottom: 90, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Belum menerima PIN ?",
                    style: blackFontStyle3,
                  ),
                  TextButton(
                      onPressed: () {
                        resend_pin2();
                      },
                      child: Text(
                        "Kirim PIN",
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
      ),
    );
  }
}
