part of 'widget_agensi.dart';

class MainAgensi extends StatefulWidget {
  final bool onSyarat;

  MainAgensi({
    this.onSyarat,
  });
  @override
  _MainAgensiState createState() => _MainAgensiState();
}

class _MainAgensiState extends State<MainAgensi> {
  var globalkey = "", globalEmail = "";
  //SessionManager sessionManager = SessionManager();
  var status = false;
  var mystatus = false;
  var _pilihkampus;
  bool _onSyarat = false;

  // void getPreferences() async {
  //   await sessionManager.getPreference().then((value) {
  //     //handled
  //     setState(() {
  //       mystatus = sessionManager.status;
  //       globalkey = sessionManager.key;
  //       globalEmail = sessionManager.email;
  //       print("email${globalEmail}");
  //       print("globalkey${globalkey}");
  //       print("mystatus${mystatus}");
  //       datausers();
  //       getInfoRekening();
  //     });
  //   });
  // }

  UsersDetailModel userInfo;
  void datausers() {
    UserViewModel().users_detail(globalEmail.toString()).then((value) {
      //handled
      UsersDetailModel data = value;
      if (data.status == 200) {
        setState(() {
          userInfo = data;
        });
      }
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  CheckRekeningAgentModel rekInfo;
  bool _loading;
  void getInfoRekening() {
    Agentview_model().getRekening(globalkey.toString()).then((value) {
      //handled
      CheckRekeningAgentModel data = value;
      String che = data.namarekening == null ? null : data.namarekening;
      setState(() {
        if (che != null) {
          _loading = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => (AgensiMe(
                        keycode: globalkey.toString(),
                        nameRek: che,
                      ))));
        } else {
          _loading = false;
        }
      });
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
                datausers();
                getInfoRekening();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  int currentStep = 0;

  void initState() {
    super.initState();
    _loading = true;
    //getPreferences();
    _pilihkampus = "Pilih Kampus";
    _onSyarat = widget.onSyarat == null ? false : true;
  }

  next() {
    if (currentStep < 7) {
      goTo(currentStep + 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  TextStyle forstep() {
    return blackFontStyle2.copyWith(fontWeight: FontWeight.bold, fontSize: 14);
  }

  TextStyle forstepdesc() {
    return blueFontStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  }

  List<String> _listCampus = [
    "Polnas",
    "Unkris",
    "STIE GICI",
    "STIE IGI",
    "Kampus Demo",
    "UTI",
    "UTN",
  ];

  // Future<void> _launched;
  // Future<void> _launchInBrowser(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: false,
  //       headers: <String, String>{'my_header_key': 'my_header_value'},
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (!_onSyarat) {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Navigation_bottom()),
          );
        } else {
          return Navigator.of(context).maybePop();
        }
      },
      child: Scaffold(
          //backgroundColor: globalkey == null?Colors.white:Color(0xFF8DBEE6),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: mainColor1,
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: mainColor1,
            title: Text(
              "Agensi",
              style: whiteFontStyle,
            ),
          ),
          body: _loading
              ? Center(
                  child: SpinKitThreeBounce(color: mainColor1),
                )
              : _hasNotLogin() //untuk sementara diarahkan ke no login semua
          /*
      globalkey == null || !_onSyarat
          ? _hasNotLogin()
          : _hasLogin()
        */
          ),
    );
  }

  Widget _hasNotLogin() {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Image.asset('assets/agensifix.png'),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingin Mempunyai Penghasilan Tambahan ?",
                      style: blueFontStyle2Bold.copyWith(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                          text: 'Ayo gabung bersama kami di ',
                          style: blackFontStyle2.copyWith(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' \"Mitra eduAgent\"',
                              style: blackFontStyle2.copyWith(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        "Dengan menjadi Mitra eduAgent, kamu bisa menambah penghasilan kamu. Ikuti langkah – langkah berikut untuk dapat menjadi Mitra eduAgent kami.",
                        style: blackFontStyle1.copyWith(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    color: Colors.grey,
                    child: Image.network(
                      "https://img.youtube.com/vi/R1bS18bR0IQ/0.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.red,
                  size: 72,
                ),
              ],
            ),
          ),
          onTap: () => setState(() {
            // _launched =
            //     _launchInBrowser('https://www.youtube.com/watch?v=R1bS18bR0IQ');
          }),
        )),
        Stepper(
          physics: ClampingScrollPhysics(),
          currentStep: currentStep,
          onStepContinue: next,
          onStepTapped: (step) => goTo(step),
          onStepCancel: cancel,
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width / 2.8,
                    child: currentStep == 0 || currentStep == 7
                        ? Container()
                        : EduButtonSecond(
                            onPressed: onStepCancel,
                            buttonText: 'Sebelumnya',
                          ),
                  ),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width / 2.8,
                    child: currentStep == 7
                        ? EduButtonSecond(
                            onPressed: onStepCancel,
                            buttonText: 'Sebelumnya',
                          )
                        : EduButton(
                            onPressed: () {
                              next();
                            },
                            buttonText: "Lanjut",
                          ),
                  ),
                ],
              ),
            );
          },
          steps: [
            Step(
                isActive: currentStep == 0 ? true : false,
                title: Text(
                  "Isi Form Online",
                  style: forstep(),
                ),
                content: Text(
                    "Perekomendasi melakukan Pengisian Form GSF -> Dilakukan secara Online di aplikasi Edunitas pada menu “EduAgent” atau di website www.edunitas.com dan melengkapi form secara lengkap",
                    style: forstepdesc())),
            Step(
                isActive: currentStep == 1 ? true : false,
                title: Text("Saran Pengisian Form", style: forstep()),
                content: Text(
                    "Perekomendasi disarankan mengisi Form GSF H-1 agar tidak terjadi Calon Mahasiswa tersebut mendaftar kampus lebih dulu sebelum direkomendasikan. ( Mahasiswa harus daftar menggunakan email yang sudah didaftarkan Perekomendasi )",
                    style: forstepdesc())),
            Step(
                isActive: currentStep == 2 ? true : false,
                title: Text("Pembayaran Melalui Virtual Account",
                    style: forstep()),
                content: Text(
                    "Mahasiswa yang direkomendasikan membayar biaya pendaftaran dan daftar ulang (Herregistrasi) melalui transaksi online, seperti : Transfer Bank dan lain – lain (Harus menggunakan Virtual Account, tidak berlaku bagi mahasiswa yang melakukan pembayaran secara tunai di sekretariat)",
                    style: forstepdesc())),
            Step(
                isActive: currentStep == 3 ? true : false,
                title: Text("Syarat Mendapatkan GSF", style: forstep()),
                content: Text(
                    "Perekomendasi mendapatkan GSF, bila mahasiswa yang direkomendasikan melakukan pembayaran uang pendaftaran dan uang daftar ulang (herregistrasi).",
                    style: forstepdesc())),
            Step(
                isActive: currentStep == 4 ? true : false,
                title: Text("Masa Berlaku", style: forstep()),
                content: Text(
                    "Masa berlaku mahasiswa yang direkomendasikan yaitu selama 60 hari. Jika mahasiswa yg direkomendasikan tidak melakukan pembayaran uang Herregistrasi dalam waktu 60 hari, maka Perekomendasi tidak mendapatkan GSF (hak GSF nya Hangus).",
                    style: forstepdesc())),
            Step(
                isActive: currentStep == 5 ? true : false,
                title:
                    Text("Siapa Saja Yang Dapat Mengikuti?", style: forstep()),
                content: Text(
                    "Mahasiswa, Dosen (kecuali security) dan masyarakat umum dapat mengikuti Program GSF ini.",
                    style: forstepdesc())),
            Step(
                isActive: currentStep == 6 ? true : false,
                title: Text("Nominal GSF", style: forstep()),
                content: Text(
                    "Nominal GSF utk kampus yang berada di wilayah Jabodetabek adalah sebesar (Rp 240.000,- untuk Program Perkuliahan Karyawan) dan (Rp 200.000,- untuk Program Perkuliahan Reguler) Nominal GSF utk kampus yang berada di luar wilayah Jabodetabek sebesar (Rp 200.000,- untuk Perkuliahan Karyawan maupun Reguler)",
                    style: forstepdesc())),
            Step(
                isActive: currentStep == 7 ? true : false,
                title: Text("Penarikan Dana", style: forstep()),
                content: Text(
                    "GSF akan ditransfer ke rekening perekomendasi paling cepat 1 bulan setelah mahasiswa yg direkomendasikan membayar uang daftar ulang/ herregistrasi. Harap pengisian Nomer Rekening jangan sampai salah.",
                    style: forstepdesc())),
          ],
        ),
        Container(
          height: 48,
          width: 250,
          margin: EdgeInsets.all(24),
          child: _onSyarat
              ? Container()
              : EduButton(
                  onPressed: () => setState(() {
                    // _launched =
                    //     _launchInBrowser('https://edunitas.com/eduagent/partner');
                    globalEmail == null
                        ? _showcontent()
                        : userInfo == null
                            // ignore: unnecessary_statements
                            ? () {}
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (FormulirMitraAgensi(
                                          keycode: globalkey,
                                          edit: false,
                                          userInfo: userInfo,
                                        ))));
                  }),
                  buttonText: "Gabung Mitra eduAgent",
                ),
        ),
        SizedBox(
          height: 24,
        )
      ],
    ));
  }

  void _showcontent() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          height: 300,
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
                    "assets/dialog/dialogask2xhd.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 32,
                      child: Text(
                        'Hai Partner !',
                        style: blueFontStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Silahkan login terlebih dahulu untuk melanjutkan',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
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
                          // onPressed: () => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => (AgensiLogin()))),
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
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (Login()))),
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

  // Widget _hasLogin() {
  //   return SingleChildScrollView(
  //       child: Container(
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //           child: Column(
  //             children: [
  //               //card identity
  //               Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 height: 100,
  //                 child: Card(
  //                     elevation: 10,
  //                     borderOnForeground: true,
  //                     color: Colors.white,
  //                     child: Container(
  //                       padding: EdgeInsets.all(10),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                             width: 70,
  //                             height: 70,
  //                             child: ClipRRect(
  //                               borderRadius: BorderRadius.circular(70),
  //                               child: Image.network(
  //                                 "https://file.edunitas.com/assets/kampus/img/1576764260/medium-cover.png",
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Text(
  //                                 "John Doe",
  //                                 style: TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                               SizedBox(
  //                                 height: 5,
  //                               ),
  //                               Text("Bank Rakyat Indonesia",
  //                                   style: TextStyle(fontSize: 14)),
  //                               Text("9823472347",
  //                                   style: TextStyle(fontSize: 14)),
  //                             ],
  //                           ),
  //                           SizedBox(
  //                             width: 30,
  //                           ),
  //                           Icon(
  //                             Icons.edit,
  //                             size: 30,
  //                           )
  //                         ],
  //                       ),
  //                     )),
  //               ),
  //               //info & syarat
  //               FlatButton(
  //                   onPressed: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => (InformasiPerolehan(keycode: globalkey,))));
  //                   },
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Icon(
  //                         Icons.account_balance_wallet,
  //                         color: Color(0xFF02588E),
  //                       ),
  //                       Text(
  //                         "Informasi Perolehan",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             color: Color(0xFF02588E)),
  //                       ),
  //                       SizedBox(
  //                         width: 90,
  //                       ),
  //                       Icon(
  //                         Icons.arrow_forward_ios,
  //                         color: Color(0xFF02588E),
  //                       ),
  //                     ],
  //                   )),
  //               FlatButton(
  //                   onPressed: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => (MainAgensi(
  //                                   onSyarat: true,
  //                                 ))));
  //                   },
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Icon(
  //                         Icons.assignment,
  //                         color: Color(0xFF02588E),
  //                       ),
  //                       Text(
  //                         "Syarat & ketentuan",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             color: Color(0xFF02588E)),
  //                       ),
  //                       SizedBox(
  //                         width: 90,
  //                       ),
  //                       Icon(
  //                         Icons.arrow_forward_ios,
  //                         color: Color(0xFF02588E),
  //                       ),
  //                     ],
  //                   )),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           color: Color(0xFF8DBEE6),
  //           width: MediaQuery.of(context).size.width,
  //           child: Stack(
  //             children: [
  //               Container(
  //                 color: Colors.white,
  //                 margin: EdgeInsets.only(top: 30),
  //                 width: MediaQuery.of(context).size.width,
  //                 height: MediaQuery.of(context).size.height - 100,
  //               ),
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 15),
  //                 child: Card(
  //                   color: Colors.white,
  //                   elevation: 10,
  //                   borderOnForeground: true,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(
  //                         height: 20,
  //                       ),
  //                       Center(
  //                         child: Text(
  //                           "Prifile Mahasiswa yang direkomendasikan",
  //                           style: TextStyle(
  //                               fontSize: 15,
  //                               fontWeight: FontWeight.bold,
  //                               color: Color(0xFF02588E)),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text("            Nama",
  //                           style: TextStyle(
  //                               fontSize: 15, color: Color(0xFF02588E))),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Center(
  //                         child: Container(
  //                             padding: const EdgeInsets.all(3.0),
  //                             margin:
  //                                 const EdgeInsets.only(left: 20, right: 20),
  //                             width: MediaQuery.of(context).size.width,
  //                             height: MediaQuery.of(context).size.height / 13,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(7.0),
  //                                 border: Border.all(color: Colors.blueGrey)),
  //                             child: Container(
  //                               padding: EdgeInsets.symmetric(horizontal: 20),
  //                               child: TextField(
  //                                 //controller: etnohp,
  //                                 keyboardType: TextInputType.name,
  //                                 decoration: InputDecoration(
  //                                     labelText: 'Nama Calon Mahasiswa',
  //                                     enabledBorder: UnderlineInputBorder(
  //                                         borderSide:
  //                                             BorderSide(color: Colors.white))),
  //                               ),
  //                             )),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text("            Email",
  //                           style: TextStyle(
  //                               fontSize: 15, color: Color(0xFF02588E))),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Center(
  //                         child: Container(
  //                           padding: const EdgeInsets.all(3.0),
  //                           margin: const EdgeInsets.only(left: 20, right: 20),
  //                           width: MediaQuery.of(context).size.width,
  //                           height: MediaQuery.of(context).size.height / 13,
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(7.0),
  //                               border: Border.all(color: Colors.blueGrey)),
  //                           child: Container(
  //                             padding: EdgeInsets.symmetric(horizontal: 20),
  //                             child: TextField(
  //                               //controller: etnohp,
  //                               keyboardType: TextInputType.emailAddress,
  //                               decoration: InputDecoration(
  //                                   labelText: 'Email',
  //                                   enabledBorder: UnderlineInputBorder(
  //                                       borderSide:
  //                                           BorderSide(color: Colors.white))),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text("            No HP",
  //                           style: TextStyle(
  //                               fontSize: 15, color: Color(0xFF02588E))),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Center(
  //                         child: Container(
  //                             padding: const EdgeInsets.all(3.0),
  //                             margin:
  //                                 const EdgeInsets.only(left: 20, right: 20),
  //                             width: MediaQuery.of(context).size.width,
  //                             height: MediaQuery.of(context).size.height / 13,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(7.0),
  //                                 border: Border.all(color: Colors.blueGrey)),
  //                             child: Container(
  //                               padding: EdgeInsets.symmetric(horizontal: 20),
  //                               child: TextField(
  //                                 //controller: etnohp,
  //                                 keyboardType: TextInputType.phone,
  //                                 decoration: InputDecoration(
  //                                     labelText: 'Nomer Handphone ',
  //                                     enabledBorder: UnderlineInputBorder(
  //                                         borderSide:
  //                                             BorderSide(color: Colors.white))),
  //                               ),
  //                             )),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text("            Kampus yang Diminati",
  //                           style: TextStyle(
  //                               fontSize: 15, color: Color(0xFF02588E))),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Center(
  //                         child: Container(
  //                             padding: const EdgeInsets.all(3.0),
  //                             margin:
  //                                 const EdgeInsets.only(left: 20, right: 20),
  //                             width: MediaQuery.of(context).size.width,
  //                             height: MediaQuery.of(context).size.height / 13,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(7.0),
  //                                 border: Border.all(color: Colors.blueGrey)),
  //                             child: Container(
  //                               padding: EdgeInsets.symmetric(horizontal: 20),
  //                               child: FlatButton(
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Text(_pilihkampus),
  //                                     Icon(Icons.arrow_forward_ios)
  //                                   ],
  //                                 ),
  //                                 onPressed: () {
  //                                   displayBottomSheet(context);
  //                                 },
  //                               ),
  //                             )),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text("            Foto Bersama Calon Mahasiswa",
  //                           style: TextStyle(
  //                               fontSize: 15, color: Color(0xFF02588E))),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Container(
  //                         padding: EdgeInsets.only(right: 20),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Center(
  //                               child: Container(
  //                                   padding: const EdgeInsets.all(3.0),
  //                                   margin: const EdgeInsets.only(
  //                                       left: 20, right: 20),
  //                                   width:
  //                                       MediaQuery.of(context).size.width / 1.8,
  //                                   height:
  //                                       MediaQuery.of(context).size.height / 13,
  //                                   decoration: BoxDecoration(
  //                                       borderRadius:
  //                                           BorderRadius.circular(7.0),
  //                                       border:
  //                                           Border.all(color: Colors.blueGrey)),
  //                                   child: Container(
  //                                     padding:
  //                                         EdgeInsets.symmetric(horizontal: 20),
  //                                     child: TextField(
  //                                       //controller: etnohp,
  //                                       keyboardType: TextInputType.phone,
  //                                       decoration: InputDecoration(
  //                                           labelText: 'Image',
  //                                           enabledBorder: UnderlineInputBorder(
  //                                               borderSide: BorderSide(
  //                                                   color: Colors.white))),
  //                                     ),
  //                                   )),
  //                             ),
  //                             Center(
  //                                 child: Container(
  //                               width: MediaQuery.of(context).size.height / 13,
  //                               height: MediaQuery.of(context).size.height / 13,
  //                               child: RaisedButton(
  //                                 child: Icon(
  //                                   Icons.upload_sharp,
  //                                   color: Colors.white,
  //                                 ),
  //                                 color: Color(0xFF1661D5),
  //                                 onPressed: () {},
  //                                 shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(10),
  //                                 ),
  //                               ),
  //                             ))
  //                           ],
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 40,
  //                       ),
  //                       Container(
  //                         padding: EdgeInsets.symmetric(horizontal: 20),
  //                         width: MediaQuery.of(context).size.width,
  //                         height: 40,
  //                         child: RaisedButton(
  //                           child: Text(
  //                             "Dapatkan Fee",
  //                             style: TextStyle(
  //                                 color: mainColor1,
  //                                 fontWeight: FontWeight.bold),
  //                           ),
  //                           color: Color(0xFFFFCE00),
  //                           onPressed: () {},
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(16),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 40,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ));
  // }

  /*_displayListKampus(BuildContext context) async {
    final result = await displayBottomSheet(context);

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result "+_pilihkampus)));
  }*/

  displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
              child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: BoxDecoration(
                        color: mainColor1,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: const Radius.circular(18.0),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: mainColor1,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Divider(
                                thickness: 4,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 360,
                              child: Container(
                                child: _listCampus.length == 0
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.builder(
                                        itemCount: _listCampus.length,
                                        itemBuilder:
                                            (BuildContext context, int indx) {
                                          return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: InkWell(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          _listCampus[indx],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Divider(
                                                          thickness: 2,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _pilihkampus =
                                                            _listCampus[indx];
                                                        print("list kampus: " +
                                                            _listCampus[indx]);
                                                        print("pilih kampus: " +
                                                            _pilihkampus);
                                                      });
                                                      Navigator.pop(context,
                                                          _listCampus[indx]);
                                                    },
                                                  )));
                                        },
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })));
        });
  }
}

class _pilihKampusBotomSheet extends StatelessWidget {
  final List listCampus;

  _pilihKampusBotomSheet({
    this.listCampus,
  });

  displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return SingleChildScrollView(
              child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: BoxDecoration(
                        color: mainColor1,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: const Radius.circular(18.0),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: mainColor1,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Divider(
                                thickness: 4,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 360,
                              child: Container(
                                child: listCampus.length == 0
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.builder(
                                        itemCount: listCampus.length,
                                        itemBuilder:
                                            (BuildContext context, int indx) {
                                          return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: InkWell(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          listCampus[indx],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Divider(
                                                          thickness: 2,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      Navigator.pop(context,
                                                          listCampus[indx]);
                                                      setState(() {
                                                        //_pilihkampus = listCampus[indx];
                                                        print("list kampus: " +
                                                            listCampus[indx]);
                                                        //print("pilih kampus: "+pilihkampus);
                                                      });
                                                    },
                                                  )));
                                        },
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: displayBottomSheet(context),
    );
  }
}
