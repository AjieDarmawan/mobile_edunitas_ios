part of 'partner.dart';

class FormPatnerKampus extends StatefulWidget {
  final String email, keycode, namalengkap;
  FormPatnerKampus({
    this.email,
    this.keycode,
    this.namalengkap,
  });

  @override
  _FormPatnerKampusState createState() => _FormPatnerKampusState();
}

class _FormPatnerKampusState extends State<FormPatnerKampus> {
  TextEditingController etnamalengkap = TextEditingController();
  TextEditingController etemailresmikampus = TextEditingController();
  TextEditingController etnohp = TextEditingController();
  TextEditingController etnowa = TextEditingController();
  TextEditingController etnamakampus = TextEditingController();
  TextEditingController etemailpenanggungjawab = TextEditingController();
  TextEditingController etjabatanpenanggungjawab = TextEditingController();
  TextEditingController ettlpnkampus = TextEditingController();

  TextEditingController _captchaNumsRes = TextEditingController();

  List<MasterDaerahModel> datakota = new List();
  void getKota() async {
    Masterview_model().kota().then((value2) {//handled
      setState(() {
        datakota = value2;
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
                getKota();
                _captchaGenerator();
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
    getKota();
    _captchaGenerator();
  }

  var InSignIn = false;
  void check() {
    // print('tes');

    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      print('cees');
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etnamalengkap.text.toString().isEmpty ||
              etemailpenanggungjawab.text.toString().isEmpty ||
              etnohp.text.toString().isEmpty ||
              etnowa.text.toString().isEmpty ||
              etnamakampus.text.toString().isEmpty ||
              etemailresmikampus.text.toString().isEmpty ||
              etjabatanpenanggungjawab.text.toString().isEmpty ||
              ettlpnkampus.text.toString().isEmpty
          // ||
          // valkampus.toString().isEmpty ||
          // valkampus.toString() == "" ||
          // valkampus.toString() == "null" ||
          // valkampus.toString() == null
          ) {
        Flushbar(
          title: "Maaf !!",
          message: "Mohon Di lengkapi Terlebih dahulu",
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
      } else {
        if (_captchaNumsRes.text.toString() != "") {
          if (_captchaNums[0] + _captchaNums[1] ==
              int.parse(_captchaNumsRes.text.toString())) {
            setState(() {
              InSignIn = true;
            });

            HomeViewModel()
                .patner_kampus(
                    etnamalengkap.text.toString(),
                    etemailpenanggungjawab.text.toString(),
                    etnohp.text.toString(),
                    etnowa.text.toString(),
                    etnamakampus.text.toString(),
                    etemailresmikampus.text.toString(),
                    etjabatanpenanggungjawab.text.toString(),
                    ettlpnkampus.text.toString(),
                    valkota.toString())
                .then((value) {//handled
              StatusModel data = value;

              if (data.status == 200) {
                setState(() {
                  InSignIn = false;
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (Activasi(
                              email3:
                                  etemailpenanggungjawab.text.toString() == null
                                      ? ""
                                      : etemailpenanggungjawab.text.toString(),
                            ))));

                Flushbar(
                  title: "Berhasil",
                  message: "Silahkan Cek Email Anda",
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
              } else if (data.status == 400) {
                setState(() {
                  InSignIn = false;
                });

                Flushbar(
                  title: "Maaf",
                  message: "Maaf, email yang kamu masukan sudah terdaftar",
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
                  title: "Maaf !!",
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
              InSignIn = false;
              onErrHandling(erro);
            });
          } else {
            _captchaGenerator();
            Flushbar(
              title: "Maaf !!",
              message: "Captcha yang anda masukan salah",
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
          }
        } else {
          Flushbar(
            title: "Maaf !!",
            message: "Mohon isi captcha",
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
        }
      }

      // update_profile();

    }
    ;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
            automaticallyImplyLeading: false,
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: mainColor1,
            expandedHeight: 90.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Formulir Pendaftaran Partner',
                style: whiteFontStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Color(0xFFBAE3FF),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Anda ingin melakukan singkronisasi SIPEMA ?',
                  //         style: TextStyle(
                  //             color: mainColor1, fontWeight: FontWeight.bold),
                  //       ),
                  //       Text(
                  //           'Bagi yang tercatat sebagai mahasiswa aktif atau mahasiswa baru yang akan melakukan sinkronisasi SIPEMA ke eduNitas, anda tidak perlu Daftar Online Cukup lakukan sinkronisasi pada form di bawah',
                  //           style: TextStyle(color: mainColor1)),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.all(24),
                    color: Colors.white,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Bergabunglah dan dapatkan berbagai kemudahan dan keuntungan menjadi mitra kami.',
                              style: blackFontStyle1Bold.copyWith(fontSize: 12),
                            ),
                          ),
                          Divider(height: 24, color: Colors.grey),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "Nama Lengkap ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              cursorColor: mainColor1,
                              controller: etnamalengkap,
                              validator: nameValidator,
                              decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  hintText: "Nama Lengkap"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "Email Penanggung Jawab ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              cursorColor: mainColor1,
                              controller: etemailresmikampus,
                              validator: emailValidator,
                              //enabled: false,
                              decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  hintText: "nama@email.com"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "No Handphone Penanggung Jawab ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(bottom: 8, right: 15),
                                  child: Text(
                                    "+62",
                                    style: blueFontStyle2Bold,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: etnohp,
                                      cursorColor: mainColor1,
                                      //validator: waValidator,
                                      decoration: new InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          // focusedBorder: InputBorder.none,
                                          // enabledBorder: InputBorder.none,
                                          // errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 10,
                                              bottom: 5,
                                              top: 5,
                                              right: 10),
                                          hintText: "812345XXX"),
                                      validator: (value) {
                                        String fchar =
                                            value != null || value != ""
                                                ? value.substring(0, 1)
                                                : "0";
                                        if (value.length < 10) {
                                          return "Nomor salah, gunakan lebih dari 10 angka";
                                        } else if (fchar != '8') {
                                          return "Masukan nomor dengan benar";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "No Whatsapp Penanggung Jawab ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(bottom: 8, right: 15),
                                  child: Text(
                                    "+62",
                                    style: blueFontStyle2Bold,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: etnowa,
                                      cursorColor: mainColor1,
                                      //validator: waValidator,
                                      decoration: new InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          // focusedBorder: InputBorder.none,
                                          // enabledBorder: InputBorder.none,
                                          // errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: const EdgeInsets.only(
                                              left: 14.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          hintText: "812345XXX"),
                                      validator: (value) {
                                        String fchar =
                                            value != null || value != ""
                                                ? value.substring(0, 1)
                                                : "0";
                                        if (value.length < 10) {
                                          return "Nomor salah, gunakan lebih dari 10 angka";
                                        } else if (fchar != '8') {
                                          return "Masukan nomor dengan benar";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "Jabatan Penanggung Jawab ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              cursorColor: mainColor1,
                              controller: etjabatanpenanggungjawab,
                              validator: nameValidator,
                              //enabled: false,
                              decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  hintText: "Jabatan"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "Nama Kampus ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: etnamakampus,
                              cursorColor: mainColor1,
                              validator: nameValidator,
                              //validator: waValidator,
                              decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  hintText: "Nama Kampus"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "Email Resmi ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              cursorColor: mainColor1,
                              controller: etemailpenanggungjawab,
                              validator: emailValidator,
                              //enabled: false,
                              decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  hintText: "kampus@email.ac.id"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "No Telepon Kampus ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              cursorColor: mainColor1,
                              controller: ettlpnkampus,
                              // validator: waValidator,
                              //enabled: false,
                              decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  hintText: "081345678xxx"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text: "Pilih Wilayah Kampus ",
                                style: blueFontStyleBold,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              onTap: () {
                                modalBottomkota(context);
                              },
                              leading: Text(
                                datakota != null
                                    ? hintkota == null
                                        ? 'Pilih Wilayah '
                                        : hintkota
                                    : 'Mohon tunggu..',
                                // "Pilih Wilayah",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: mainColor1,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "Silahkan proses verifikasi CAPTCHA ini dengan memasukan jawaban yang benar di dalam kotak",
                                style: blueFontStyleBold.copyWith(fontSize: 11),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                _captchaNums[0].toString() +
                                    " + " +
                                    _captchaNums[1].toString() +
                                    " = ",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              controller: _captchaNumsRes,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                filled: false,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: "",
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.all(24),
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            child: InSignIn
                                ? SpinKitFadingCircle(color: orenColor)
                                : EduButton(
                                    onPressed: () {
                                      check();
                                    },
                                    buttonText: "Join As Patner",
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }

  var valkota;
  var hintkota;
  void modalBottomkota(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: datakota,
            cat: "kota",
          );
        });
    setState(() {
      valkota = result[0].toString();
      hintkota = result[1].toString();
    });
  }

  var _captchaNums = [0, 0];
  void _captchaGenerator() {
    Random random = new Random();
    setState(() {
      _captchaNums[0] = random.nextInt(20);
      _captchaNums[1] = random.nextInt(20);
    });
  }
}

class ContentModal extends StatefulWidget {
  var datalist;
  String cat;
  ContentModal({Key key, @required this.datalist, this.cat}) : super(key: key);

  @override
  ContentModalState createState() => new ContentModalState();
}

class ContentModalState extends State<ContentModal> {
  // TextEditingController etsearchprovinsi = new TextEditingController();
  TextEditingController etsearchkabupaten = new TextEditingController();
  // TextEditingController etsearchkecamatan = new TextEditingController();
  // TextEditingController etsearchdesa = new TextEditingController();

  List<MasterDaerahModel> fdataListwilayah = [];
  List<MasterDaerahModel> dataListwilayah = [];
  List<String> result = ["", ""];

  int lenght = 0;

  @override
  initState() {
    super.initState();
    fdataListwilayah = widget.datalist;
    dataListwilayah = widget.datalist;
    lenght = fdataListwilayah.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: Column(
          children: [
            Container(
              height: 48,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  height: 4,
                  width: 32,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: mainColor1, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                cursorColor: mainColor1,
                controller: etsearchkabupaten,
                // widget.cat=="provinsi"
                //     ? etsearchprovinsi
                //     : widget.cat=="kabupaten"
                //     ? etsearchkabupaten
                //     : widget.cat=="kecamatan"
                //     ? etsearchkecamatan
                //     : etsearchdesa,
                keyboardType: TextInputType.text,
                //enabled: false,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 10),
                    hintText: "Cari " + widget.cat),
                onChanged: (string) {
                  setState(() {
                    fdataListwilayah = dataListwilayah
                        .where((u) => (u.nama
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                        .toList();
                    lenght = fdataListwilayah.length;
                  });
                },
              ),
            ),
            Container(
              child: Expanded(
                child: lenght == 0
                    ? Column(
                        children: [
                          Text("Tidak ditemukan",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: whiteFontStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.white38,
                            thickness: 1,
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: lenght,
                        itemBuilder: (BuildContext context, int index) {
                          final fdata = fdataListwilayah[index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                //print("valpos: "+lastDataSipema.id.toString()+"&&"+lastDataSipema.nama);
                                //valposisi = lastDataSipema.id;
                                //hintposisi = lastDataSipema.nama;
                                result[0] = fdata.kode.toString();
                                result[1] = fdata.nama.toString();
                                Navigator.pop(context, result);
                              });
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 24, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(fdata.nama,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: whiteFontStyle.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.white38,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
