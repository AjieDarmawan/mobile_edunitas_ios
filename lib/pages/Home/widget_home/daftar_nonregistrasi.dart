part of 'widget_home.dart';

class DaftarNonLogin extends StatefulWidget {
  final Photo campus;
  final String kodejurusan,
      angkatan,
      tahunangkatan,
      wilayah,
      kodeprogram,
      namaJurusan,
      namalulusan,
      namajaket,
      namaformulir,
      programperkuliahan,
      namakelompok,
      namakelaswaktu,
      namakelassingkatan,
      waktuspb,
      angsuranspb,
      waktuspp,
      angsuranspp,
      varnama,
      varnohp,
      varnowa,
      varpendidikan,
      bayar_tiap_tgl;
  final int namaspb,
      namaspp,
      totalbiaya,
      namakonversi,
      perpus,
      kmhsmaba,
      krs,
      dpm;
  DaftarNonLogin({
    this.campus,
    this.kodejurusan,
    this.angkatan,
    this.wilayah,
    this.namakonversi,
    this.tahunangkatan,
    this.kodeprogram,
    this.namaJurusan,
    this.namajaket,
    this.namalulusan,
    this.namaspp,
    this.namaspb,
    this.namaformulir,
    this.programperkuliahan,
    this.namakelompok,
    this.namakelaswaktu,
    this.namakelassingkatan,
    this.waktuspb,
    this.angsuranspb,
    this.waktuspp,
    this.angsuranspp,
    this.totalbiaya,
    this.varnama,
    this.varnohp,
    this.varnowa,
    this.varpendidikan,
    this.kmhsmaba,
    this.perpus,
    this.krs,
    this.dpm,
    this.bayar_tiap_tgl,
  });
  @override
  _DaftarNonLoginState createState() => _DaftarNonLoginState();
}

class _DaftarNonLoginState extends State<DaftarNonLogin> {
  String email,
      kodepromo,
      poin_redeem = "0",
      diskon_redeem = "1",
      key_redeem = "3";
  String valSumber, no_virtual, keycode2;
  List<SmbModel> dataSumber = new List();
  void sumber() async {
    Masterview_model().sumber_smb().then((value1) {//handled
      setState(() {
        dataSumber = value1;
      });
    });
  }

  int block = 0;
  String namaformulir2;

  var datapromosi = new List();
  var valtglhingga;
  void getpromositerbaru() {
    Eduinfoview_model().getPromositerbarudaftar().then((value1) {//handled
      setState(() {
        datapromosi = value1;
        valtglhingga =
            datapromosi[0].hingga == null ? "" : datapromosi[0].hingga;
        print("datapromosi: ${datapromosi.length}");
        print("valtglhingga: " + valtglhingga);
      });
    });
  }

  //var ambiljurusan = widget.kodejurusan.substring(0, 2);
  void block_pendidikan() {
    Masterview_model()
        .pendidikan_registrasi_daftar_mapping(
            widget.varpendidikan, widget.kodejurusan.substring(0, 2))
        .then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        setState(() {
          block = 1;
        });
      } else {
        setState(() {
          block = 2;
        });
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

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
                            'Simpan Perubahan ?',
                            style: blueFontStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Simpan perubahan ke dalam wishlist',
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
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(new MaterialPageRoute(
                                //   builder: (BuildContext context) =>
                                //       Navigation_bottom(),
                                // ));
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              buttonText: "Tidak",
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: EduButton(
                              onPressed: () {
                                simpan();
                              },
                              buttonText: "Simpan",
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
        ) ??
        false;
  }

  void simpan() {
    Whitlistview_model()
        .simpanwhitlist(
            globalkey.toString(),
            widget.namalulusan.toString(),
            "wishlist",
            widget.campus.singkatan.toString(),
            widget.campus.nama.toString(),
            widget.campus.website.toString(),
            widget.kodejurusan,
            widget.kodeprogram,
            "origin")
        .then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            //  timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pop(true);
        // // Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => (RegistarDatadiri(
        //       email2 : etEmail.text.toString(),
        //     ))));
      } else {
        Fluttertoast.showToast(
            msg: "Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            //  timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  bool setpengalaman = false;
  bool loading = false;
  bool onChecking = false;
  String valpengalaman;
  var valpendidikan;
  List pengalaman = [
    {"inisial": "0", "isi": "Freshgraduate"},
    {"inisial": "1", "isi": "Pengalaman"},
  ];

  //session
  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  SessionManager sessionManager = SessionManager();
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {//handled
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

  //1//
  DateTime _dueDate = DateTime.now();
  String dateText = "";
  selectDueDate(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDate = picked;
        dateText = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  //dari
  //2//
  DateTime _dueDatedari = DateTime.now();
  String dateTextdari = "";
  selectDueDateDari(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatedari = picked;
        dateTextdari = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  //daripendidikan
  //2//
  DateTime _dueDatedaripendidikan = DateTime.now();
  String dateTextdaripendidikan = "";
  selectDueDateDaripendidikan(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatedaripendidikan = picked;
        dateTextdaripendidikan = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  //hingga
  //3//
  DateTime _dueDatehingga = DateTime.now();
  String dateTexthingga = "";
  selectDueDateHingga(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatehingga = picked;
        dateTexthingga = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  List<PendidikanModel> datapendidikan = new List();
  void getpendidikan() async {
    Masterview_model()
        .pendidikan_registrasi_daftar(widget.kodejurusan.substring(0, 2))
        .then((value2) {//handled
      setState(() {
        datapendidikan = value2;
      });
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
                getData();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  // var etnamalengkap, etnowa, etnohp;
  bool isConn = false;

  //conn has been updated 22 August 2021
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          isConn = true;
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
          getData();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          isConn = true;
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
          getData();
        } else {
          isConn = false;
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  void getData() {
    getpendidikan();
    sumber();
    block_pendidikan();
    getpromositerbaru();
    //  etnamalengkap = TextEditingController(text: widget.varnama.toString());
    // etnowa = TextEditingController(text: widget.varnowa.toString());
    // etnohp = TextEditingController(text: widget.varnohp.toString());
  }

  // var etkodepromo;
  @override
  void initState() {
    super.initState();
    getPreferences();
    conn();
    //redeem
  }

  TextEditingController etemail = TextEditingController();
  TextEditingController etnamalengkap = TextEditingController();
  TextEditingController etnamapanggilan = TextEditingController();
  TextEditingController etnoktp = TextEditingController();
  TextEditingController etnohp = TextEditingController();
  TextEditingController etnowa = TextEditingController();
  TextEditingController etttl = TextEditingController();
  TextEditingController ettgllahir = TextEditingController();

  //2//

  TextEditingController ettingkatpendidikan = TextEditingController();
  TextEditingController etjurusan = TextEditingController();
  TextEditingController ettahunkelulusan = TextEditingController();
  TextEditingController ettahuninstitusi = TextEditingController();
  TextEditingController etnilaiakhir = TextEditingController();
  TextEditingController etdari = TextEditingController();

  //3
  TextEditingController etsudahbekerja = TextEditingController();
  TextEditingController etnamaperusahaan = TextEditingController();
  TextEditingController etbekerjadari = TextEditingController();
  TextEditingController etbekerjasampai = TextEditingController();
  TextEditingController etposisi = TextEditingController();
  TextEditingController etspesialisasi = TextEditingController();
  TextEditingController etbidangpekerjaan = TextEditingController();
  TextEditingController etdeskripsi = TextEditingController();

  //4

  TextEditingController etmendatapkaninformasi = TextEditingController();
  //TextEditingController etkodepromo = TextEditingController();
  TextEditingController etkodepromo2 = TextEditingController();

  int currentStep = 0;
  bool complete = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey_promo = GlobalKey<FormState>();

  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  void _showcontent() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 270,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      //color: Colors.red,
                      height: 32,
                      child: Text("Masukan Kode Promo",
                          style: blueFontStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: TextFormField(
                        controller: etkodepromo2,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Masukan kode disini",
                        ),
                      ),
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
                            Navigator.pop(context);
                          },
                          buttonText: "Batal",
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 32,
                        child: EduButton(
                          onPressed: () {
                            //50RegEdu
                            //print("promo${etkodepromo2.toString}");
                            print("promo${etkodepromo2.text.toString()}");
                            Eduinfoview_model()
                                .check_promo(etkodepromo2.text.toString(),
                                    widget.campus.kode.toString())
                                .then((value) {//handled
                              StatusModel data = value;

                              if (data.status == 200) {
                                Fluttertoast.showToast(
                                    msg: "Kode Promo berhasil digunakan",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);

                                setState(() {
                                  diskon_redeem = data.etc;

                                  key_redeem = "1";
                                  poin_redeem = "50RegEdu";
                                });
                              } else if (data.status == 404) {
                                Fluttertoast.showToast(
                                    msg: "Kode Promo Tidak ditemukan",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);

                                setState(() {
                                  diskon_redeem = "1";
                                  key_redeem = "2";
                                  poin_redeem = "0";
                                });
                              } else if (data.status == 400) {
                                Fluttertoast.showToast(
                                    msg: "Kode Promo Tidak Bisa gunakan ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);

                                setState(() {
                                  diskon_redeem = "1";
                                  key_redeem = "3";
                                  poin_redeem = "0";
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Kode Promo Tidak Bisa gunakann ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);

                                setState(() {
                                  diskon_redeem = "1";
                                  key_redeem = "3";
                                  poin_redeem = "0";
                                });
                              }
                            }).catchError((erro){
                              onErrHandling(erro);
                            });

                            Navigator.pop(context);
                          },
                          buttonText: "Pakai",
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

  @override
  Widget build(BuildContext context) {
    print("tesredeem${poin_redeem}");
    print("tesredeem${diskon_redeem}");
    print("tesredeem${key_redeem}");
    // print("kodepromo${kodepromo}");
    // print("namakonversi${widget.namakonversi}");
    // print("currentStep${currentStep}");

    String resultText = widget.kodejurusan.substring(0, 2);
    //   print("kodejuruan_block${block}");
    // print("kodejuruan_1${resultText}");
    // print("waktuspp${widget.waktuspp}");
    // print("waktukelaswaktu${widget.namakelaswaktu}");
    // print("waktukelssingkatan${ widget.namakelassingkatan.toString()}");
    // print("totalbiaya${widget.totalbiaya}");
    // print("tanggal ${dateText.toString()}");

    if (valpengalaman == 1 || valpengalaman == "1") {
      setState(() {
        setpengalaman = true;
      });
    } else {
      setState(() {
        setpengalaman = false;
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            "Formulir Pendaftaran",
            style: whiteFontStyle,
          ),
          backgroundColor: mainColor1,
        ),
        body: isConn == false
            ? Center(
                child: Padding(
                padding: const EdgeInsets.all(8),
                child: SpinKitThreeBounce(color: mainColor1),
              ))
            : ListView(
                children: [
                  Container(
                      color: Colors.blue[100],
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Satu langkah lagi untuk berhasil Mendaftarkan diri, pastikan melengkapi data dengan benar",
                          style: blueFontStyle,
                        ),
                      )),
                  Stepper(
                    physics: ClampingScrollPhysics(),
                    steps: [
                      Step(
                          isActive: currentStep == 0 ? true : false,
                          title: Row(
                            children: [
                              Text("Data diri",
                                  style: blackFontStyle2.copyWith(
                                      fontWeight: FontWeight.bold)),
                              Text("*", style: TextStyle(color: Colors.red)),
                            ],
                          ),
                          content: Container(
                              child: Form(
                            key: _formKeys[0],
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: etemail,
                                  decoration:
                                      InputDecoration(labelText: 'Email'),
                                  // validator: (value) {
                                  //   if (value.isEmpty) {
                                  //     return 'Mohon isi Email';
                                  //   }
                                  //   return null;
                                  // },
                                  validator: emailValidator,

                                  // validator: (value) => value.length < 6 ? 'Password too short.' : null,

                                  onSaved: (value) {
                                    email = value;
                                  },
                                ),
                                TextFormField(
                                  controller: etnamalengkap,
                                  decoration: InputDecoration(
                                      labelText: 'Nama Lengkap'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Mohon isi Nama Lengkap';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: etnamapanggilan,
                                  decoration: InputDecoration(
                                      labelText: 'Nama Panggilan'),
                                ),
                                TextFormField(
                                  controller: etnoktp,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(labelText: 'Nomor KTP'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Mohon isi nomor KTP';
                                    }
                                    return null;
                                  },
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: 8, right: 15),
                                        child: Text(
                                          "+62",
                                          style: blackFontStyle2,
                                        ),
                                      ),
                                      Flexible(
                                        child: TextFormField(
                                          controller: etnohp,
                                          maxLength: 15,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              labelText: 'Nomor Telepon'),
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
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: 8, right: 15),
                                        child: Text(
                                          "+62",
                                          style: blackFontStyle2,
                                        ),
                                      ),
                                      Flexible(
                                        child: TextFormField(
                                          controller: etnowa,
                                          maxLength: 15,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              labelText: 'Nomor Whatsapp'),
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
                                      )
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: etttl,
                                  decoration: InputDecoration(
                                      labelText: 'Tempat Lahir'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Mohon isi Tempat Lahir';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range_rounded,
                                      color: Colors.blue,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        selectDueDate(context);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            dateText == ""
                                                ? "Pilih Tanggal Lahir"
                                                : dateText,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            "*",
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ))),
                      Step(
                          isActive: currentStep == 1 ? true : false,
                          title: Text("Pendidikan Terakhir",
                              style: blackFontStyle2.copyWith(
                                  fontWeight: FontWeight.bold)),
                          content: Container(
                            child: Form(
                              key: _formKeys[1],
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black),
                                          value: valpendidikan,
                                          //value: valPendidikan == null ? valPendidikan : buildingTypes.where( (i) => i.name == valPendidikan.name).first as BuildingType,
                                          hint: Text("Pilih Pendidikan"),
                                          items: datapendidikan.map((item) {
                                            return DropdownMenuItem(
                                              child: Text(item.nama),
                                              value: item.kode.toString(),
                                            );
                                          }).toList(),
                                          onChanged: (value) async {
                                            // dataCity = await network.getCity(value);
                                            setState(() {
                                              valpendidikan = value;
                                              // valCity = null;
                                            });
                                            //print(dataCity);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Jurusan'),
                                    /*validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Mohon isi Jurusan';
                                            }
                                            return null;
                                          },*/
                                  ),
                                  TextFormField(
                                    controller: ettahunkelulusan,
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    decoration: InputDecoration(
                                        labelText: 'Tahun Kelulusan'),
                                    /*validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Mohon isi Tahun Kelulusan';
                                            }
                                            return null;
                                          },*/
                                  ),
                                  TextFormField(
                                    //controller: ettahuninstitusi,
                                    //maxLength: 4,
                                    //keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'Nama Institusi'),
                                  ),
                                  TextFormField(
                                    controller: etnilaiakhir,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    decoration: InputDecoration(
                                        labelText: 'Nilai Akhir'),
                                    /*validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Mohon isi Nilai Akhir';
                                            }
                                            return null;
                                          },*/
                                  ),
                                  TextFormField(
                                    controller: etdari,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    decoration:
                                        InputDecoration(labelText: 'Dari'),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Step(
                          isActive: currentStep == 2 ? true : false,
                          title: Text("Riwayat Pekerjaan",
                              style: blackFontStyle2.copyWith(
                                  fontWeight: FontWeight.bold)),
                          content: Container(
                            child: Form(
                              key: _formKeys[2],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Sudah Pernah Bekerja ?",
                                      style: blackFontStyle2.copyWith(
                                          color: Colors.black87)),
                                  Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11,
                                      // decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(7.0),
                                      //     border: Border.all(color: Colors.blueGrey)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: DropdownButton(
                                          isExpanded: true,
                                          value: valpengalaman,
                                          hint: Text("Pilih "),
                                          items: pengalaman.map((item) {
                                            return DropdownMenuItem(
                                              child: Text(item['isi']),
                                              value: item['inisial'],
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              valpengalaman = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: setpengalaman,
                                      child: Column(
                                        children: [
                                          // TextFormField(
                                          //   controller: etsudahbekerja,
                                          //   decoration: InputDecoration(
                                          //       labelText: 'Sudah Bekerja ?'),
                                          //   // validator: ,
                                          // ),
                                          TextFormField(
                                            controller: etnamaperusahaan,
                                            decoration: InputDecoration(
                                                labelText: 'Nama Perusahaan'),
                                            // validator: (value) {
                                            //   if (value.isEmpty || value.length < 1) {
                                            //     return 'Please enter postc';
                                            //   }
                                            //   return '';
                                            // },
                                          ),
                                          // TextFormField(
                                          //   controller: etbekerjadari,
                                          //   decoration: InputDecoration(
                                          //       labelText: 'Bekerja Dari'),
                                          //   // validator: (value) {
                                          //   //   if (value.isEmpty || value.length < 1) {
                                          //   //     return 'Please Bekerja';
                                          //   //   }
                                          //   //   return '';
                                          //   // },
                                          // ),
                                          SizedBox(height: 16),
                                          Row(children: <Widget>[
                                            Text("Bekerja Dari"),
                                            Text(
                                              "*",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ]),
                                          SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.date_range,
                                                color: Colors.blue,
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  selectDueDateDari(context);
                                                },
                                                child: Text(
                                                  dateTextdari == ""
                                                      ? "Bekerja Dari"
                                                      : dateTextdari,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue),
                                                ),
                                              )
                                            ],
                                          ),
                                          // TextFormField(
                                          //   controller: etbekerjasampai,
                                          //   decoration: InputDecoration(
                                          //       labelText: 'Bekerja Samapi'),
                                          //   // validator: (value) {
                                          //   //   if (value.isEmpty || value.length < 1) {
                                          //   //     return 'Please Bekerja';
                                          //   //   }
                                          //   //   return '';
                                          //   // },
                                          // ),
                                          SizedBox(height: 16),
                                          Row(children: <Widget>[
                                            Text("Bekerja Sampai"),
                                            Text(
                                              "*",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ]),
                                          SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.date_range,
                                                color: Colors.blue,
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  selectDueDateHingga(context);
                                                },
                                                child: Text(
                                                  dateTexthingga == ""
                                                      ? "Bekerja Sampai"
                                                      : dateTexthingga,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue),
                                                ),
                                              )
                                            ],
                                          ),
                                          TextFormField(
                                            controller: etposisi,
                                            decoration: InputDecoration(
                                                labelText: 'Posisi'),
                                            // validator: (value) {
                                            //   if (value.isEmpty || value.length < 1) {
                                            //     return 'Please Posisi';
                                            //   }
                                            //   return '';
                                            // },
                                          ),
                                          TextFormField(
                                            controller: etspesialisasi,
                                            decoration: InputDecoration(
                                                labelText: 'Spesialisasi'),
                                            // validator: (value) {
                                            //   if (value.isEmpty || value.length < 1) {
                                            //     return 'Please Spesialisasi';
                                            //   }
                                            //   return '';
                                            // },
                                          ),
                                          TextFormField(
                                            controller: etbidangpekerjaan,
                                            decoration: InputDecoration(
                                                labelText: 'Bidang Bekerjaan'),
                                            // validator: (value) {
                                            //   if (value.isEmpty || value.length < 1) {
                                            //     return 'Bidang Bekerjaan';
                                            //   }
                                            //   return '';
                                            // },
                                          ),
                                          TextFormField(
                                            controller: etdeskripsi,
                                            decoration: InputDecoration(
                                                labelText: 'Deskripsi'),
                                            // validator: (value) {
                                            //   if (value.isEmpty || value.length < 1) {
                                            //     return 'Deskripsi';
                                            //   }
                                            //   return '';
                                            // },
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )),
                      Step(
                          isActive: currentStep == 3 ? true : false,
                          title: Text("Sumber Informasi",
                              style: blackFontStyle2.copyWith(
                                  fontWeight: FontWeight.bold)),
                          content: Container(
                              child: Form(
                            key: _formKeys[3],
                            child: Column(
                              children: [
                                // TextFormField(
                                //   controller: etmendatapkaninformasi,
                                //   decoration: InputDecoration(
                                //       labelText:
                                //           'Saya Mendapatkan Informasi Dari'),
                                //   validator: (value) {
                                //     if (value.isEmpty) {
                                //       return 'Mohon isi ';
                                //     }
                                //     return null;
                                //   },
                                // ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  width: MediaQuery.of(context).size.width,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: valSumber,
                                    hint: Row(
                                      children: [
                                        Text(
                                          "Pilih Sumber Informasi",
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                    items: dataSumber.map((item) {
                                      return DropdownMenuItem(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name,
                                            ),
                                          ],
                                        ),
                                        value: item.name.toString(),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        valSumber = value;
                                      });
                                    },
                                  ),
                                ),

                                // Container(
                                //   padding: EdgeInsets.symmetric(vertical: 8),
                                //   width: MediaQuery.of(context).size.width,
                                //   child: TextFormField(
                                //     enabled: false,
                                //     controller: etkodepromo,
                                //     decoration: InputDecoration(
                                //         labelText: 'Masukan Kode Promo'),
                                //   ),
                                // ),
                                SizedBox(height: 24),

                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                      color: Colors.grey,
                                    )),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      _showcontent();
                                    },
                                    title: Text("Punya kode promo ?",
                                        style: blackFontStyle2.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    trailing: Icon(
                                      Icons.navigate_next,
                                      color: mainColor1,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: key_redeem == "1"
                                      ? Container(
                                          height: 24,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: yellowColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: Text(
                                                "Promo berhasil digunakan",
                                                style: blueFontStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        )
                                      : Text(""),
                                ),
                              ],
                            ),
                          ))),
                    ],
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepTapped: (step) => goTo(step),
                    onStepCancel: cancel,
                    controlsBuilder: (BuildContext context, {VoidCallback onStepContinue,
                      VoidCallback onStepCancel}) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 32,
                              width: MediaQuery.of(context).size.width / 2.8,
                              child: EduButtonSecond(
                                onPressed: currentStep == 0
                                    ? _onWillPop
                                    : onStepCancel,
                                buttonText: 'Batal',
                              ),
                            ),
                            Container(
                              height: 32,
                              width: MediaQuery.of(context).size.width / 2.8,
                              child: loading == true
                                  ? Center(
                                      child: SpinKitFadingCircle(
                                        color: orenColor,
                                      ),
                                    )
                                  : EduButton(
                                      onPressed: () {
                                        currentStep == 3
                                            ? isConn == false
                                                ? noConnCheck()
                                                : check()
                                            : next();
                                      },
                                      buttonText: currentStep == 3
                                          ? "Selesai"
                                          : "Lanjut",
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ));
  }

  next() {
    print("currentstep: $currentStep");
    if (_formKeys[currentStep].currentState.validate()) {
      if (currentStep == 3) {
        isConn == false ? noConnCheck() : check();
      } else {
        validation();
      }
    }
  }

  void validation() {
    debugPrint("validate =b");
    currentStep + 1 != 4
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  void noConnCheck() {
    setState(() {
      loading = true;
    });

    Flushbar(
      title: "Gagal Menyambung",
      message: "Mohon periksa koneksi anda",
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.fastOutSlowIn,
      boxShadows: [
        BoxShadow(
            color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
      ],
      backgroundColor: Colors.red,
    )..show(context);
    setState(() {
      loading = false;
    });
  }

  void check() {
    setState(() {
      onChecking = true;
      loading = true;
    });

    var emailregis = etemail.text.toString();
    var etnamalengkap1 = etnamalengkap.text.toString();
    var etnamapanggilan1 = etnamapanggilan.text.toString();
    var etnoktp1 = etnoktp.text.toString();
    var etnohp1 = etnohp.text.toString();
    var etnowa1 = etnowa.text.toString();
    var etttl1 = etttl.text.toString();
    var ettgllahir1 = ettgllahir.text.toString();
    dateText.toString();

    //2//

    //var ettingkatpendidikan1 = ettingkatpendidikan.text.toString();
    var valpendidikan1 = valpendidikan.toString();
    var etjurusan1 = etjurusan.text.toString();
    var ettahunkelulusan1 = ettahunkelulusan.text.toString();
    var ettahuninstitusi1 = ettahuninstitusi.text.toString();
    var etnilaiakhir1 = etnilaiakhir.text.toString();
    var etdari1 = etdari.text.toString();

    //3
    var etsudahbekerja1 = etsudahbekerja.text.toString();
    var etnamaperusahaan1 = etnamaperusahaan.text.toString();
    var etbekerjadari1 = etbekerjadari.text.toString();
    var etbekerjasampai1 = etbekerjasampai.text.toString();
    var etposisi1 = etposisi.text.toString();
    var etspesialisasi1 = etspesialisasi.text.toString();
    var etbidangpekerjaan1 = etbidangpekerjaan.text.toString();
    var etdeskripsi1 = etdeskripsi.text.toString();

    //4

    var etmendatapkaninformasi1 = etmendatapkaninformasi.text.toString();
    //var etkodepromo1 = etkodepromo.text.toString();

    if (emailregis.isNotEmpty &&
            etnamalengkap1.isNotEmpty &&
            etnamapanggilan1.isNotEmpty &&
            etnoktp1.isNotEmpty &&
            etnohp1.isNotEmpty &&
            etnowa1.isNotEmpty &&
            etttl1.isNotEmpty &&
            //valpendidikan1.isNotEmpty &&
            valSumber.toString() != null &&
            dateText.toString() != ''
        //|| valpendidikan1.toString != null
        ) {
      //print("succsessformulir${widget.namaformulir}");
      // print("succsess${key_redeem}");

      double frmlir = key_redeem == "1"
          ? double.parse(widget.namaformulir) * double.parse(diskon_redeem)
          : double.parse(widget.namaformulir);
      var arr = frmlir.toString().split('.');
      var namaformulir1 = arr[0].toString();
      setState(() {
        namaformulir2 = namaformulir1;
      });
      print("succsess${namaformulir2}");
      pendaftaran(emailregis, etnamalengkap1, etnoktp1, etnohp1, etnowa1,
          etttl1, dateText, valpendidikan1);
    } else {
      print("succ=0");
      setState(() {
        loading = true;
      });

      Flushbar(
        title: "Mohon Maaf",
        message: "Harus Di isi Semua dulu ya !",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.fastOutSlowIn,
        boxShadows: [
          BoxShadow(
              color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
        ],
        backgroundColor: Colors.red,
      )..show(context);
      setState(() {
        loading = false;
      });
    }
  }

  void pendaftaran(emailregis, etnamalengkap1, etnoktp1, etnohp1, etnowa1,
      etttl1, dateText, valpendidikan1) {
    String _etnohp1S = etnohp1.substring(0, 1);
    String _etnowa1S = etnohp1.substring(0, 1);
    String _etnohp1 = etnohp1.toString();
    String _etnowa1 = etnowa1.toString();
    if (_etnohp1S == "0") _etnohp1 = etnohp1.substring(1, etnohp1.length());
    if (_etnowa1S == "0") _etnowa1 = etnowa1.substring(1, etnowa1.length());

    Kampusview_model()
        .pendaftaran_nonregistrasi(
      //keycode
      "",
      //kodecampus,
      widget.campus.kode.toString(),
      //prodi,
      widget.kodejurusan.toString(),
      //kelas,
      widget.kodeprogram.toString(),
      //pendidikan,
      valpendidikan1.toString(),
      //kelompok,
      widget.namakelompok.toString(),
      //item,
      "formulir#1#${namaformulir2},jaket#1#${widget.namajaket},spb#${widget.waktuspb}#${widget.angsuranspb},spp#${widget.waktuspp}#${widget.angsuranspp},konversi#1#${widget.namakonversi},kmhs#1#${widget.kmhsmaba},perpus#1#${widget.perpus},krs#1#${widget.krs},dpm#1#${widget.dpm}", //5
      //total,
      widget.totalbiaya.toString(),
      //tahun,
      widget.tahunangkatan.toString(),
      //angkatan,
      widget.angkatan,
      //waktu,
      widget.namakelassingkatan.toString(),
      //smb,
      valSumber.toString(), //10
      //label_kampus,
      widget.campus.nama,
      //label_kelas,
      widget.programperkuliahan,
      //label_waktu,
      widget.namakelaswaktu.toString(),
      //label_prodi,
      widget.namaJurusan.toString(),
      //label_wilayah,
      widget.wilayah,
      //15
      //nama,
      etnamalengkap1,
      //tem_lahir,
      etttl1,
      //tgl_lahir,
      dateText.toString(),
      //gender,
      "L",
      //email,
      emailregis.toString(), //20
      //no_hp,
      "0" + _etnohp1,
      //no_wa,
      "0" + _etnowa1,
      //nikktp,
      etnoktp1,
      //ayahkandung,
      "",
      //ibukandung,
      "", //25
      //alamat1,
      "",
      //kodepos,
      "",
      //kota,
      "",
      //kecamatan,
      "",
      //kelurahan,
      "", //30
      //kodejrs,
      widget.kodejurusan.toString(),
      //wkt_kul,
      widget.namakelassingkatan.toString(),
      //smb_informasi,
      valSumber.toString(),
      //kode_gsf,
      "",
      //konversi,
      "1:${widget.namakonversi}", //35
      //formulir,
      "1:${namaformulir2.toString()}",
      //jaket,
      "1:${widget.namajaket.toString()}",
      //spb,
      "${widget.waktuspb.toString()}:${widget.angsuranspb.toString()}",
      //spp
      "${widget.waktuspp.toString()}:${widget.angsuranspp.toString()}",
      valpengalaman.toString(),
      dateTextdari.toString(),
      dateTexthingga.toString(),
      etnamaperusahaan.toString(),
      etposisi.toString(),
      etjurusan.toString(),
      ettahunkelulusan.toString(),
      etnilaiakhir.toString(),
      etdari.toString(),
      poin_redeem.toString(),
      diskon_redeem.toString(),
      key_redeem.toString(),
      //bayar tiap tanggal
      widget.bayar_tiap_tgl,
    )
        .then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        setState(() {
          no_virtual = data.message;
          keycode2 = data.etc;
        });

        Flushbar(
          title: "Selamat",
          message: "Anda Success",
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
          backgroundColor: Colors.green,
        )..show(context);
        setState(() {
          loading = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (Invoice(
                      logo:
                          widget.campus.logo == null ? "" : widget.campus.logo,
                      nama:
                          widget.campus.nama == null ? "" : widget.campus.nama,
                      singktan: widget.campus.singkatan == null
                          ? ""
                          : widget.campus.singkatan,
                      formulir: namaformulir2 == null ? "" : namaformulir2,
                      keycode: keycode2 == null ? "" : keycode2,
                      namaJurusan:
                          widget.namaJurusan == null ? "" : widget.namaJurusan,
                      kodekampus:
                          widget.campus.kode == null ? "" : widget.campus.kode,
                      id_invoice: no_virtual == null ? "" : no_virtual,
                    bayar_tiap_tanggal: widget.bayar_tiap_tgl,
                    ))));
      } else if (data.status == 400) {
        Flushbar(
          title: "Mohon Maaf",
          message: "Anda Pernah Daftar Sebelumnya",
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
          backgroundColor: Colors.red,
        )..show(context);

        setState(() {
          loading = false;
        });
      } else if (data.status == 405) {
        Flushbar(
          title: "Mohon Maaf",
          message: "Email Anda Sudah Terdaftar",
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
          backgroundColor: Colors.red,
        )..show(context);

        setState(() {
          loading = false;
        });
      } else if (data.status == 500) {
        Flushbar(
          title: "Mohon Maaf",
          message: "Email Anda Sudah Terdaftar dan Belum Aktif",
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
          backgroundColor: Colors.red,
        )..show(context);

        setState(() {
          loading = false;
        });
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }
}
