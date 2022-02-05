part of 'widget_home.dart';

class Daftar extends StatefulWidget {
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
      status_agent,
      keycode;
  final int namaspb,
      namaspp,
      totalbiaya,
      namakonversi,
      perpus,
      kmhsmaba,
      krs,
      dpm;
  Daftar({
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
    this.krs,
    this.dpm,
    this.perpus,
    this.status_agent,
    this.keycode,
  });
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  String email,
      kodepromo,
      poin_redeem = "0",
      diskon_redeem = "1",
      key_redeem = "3";
  String valSumber, no_virtual;
  List<SmbModel> dataSumber = new List();
  void sumber() async {
    Masterview_model().sumber_smb().then((value1) {//handled
      setState(() {
        // dataSumber = value1;
        dataSumber = value1 == null ? [] : value1;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  int block = 0;

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

  var nama_agent, keycode_agent, gambar_selfi;
  void check_agent() {
    Agentview_model().check_agent(widget.keycode.toString()).then((value) {//handled
      StatusModel data = value;
      nama_agent = data.message;
      keycode_agent = data.etc;
      gambar_selfi = data.etc2;
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
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Navigation_bottom(),
                                ));
                                //Navigator.pop(context);
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

  String namaformulir2;

  List<PendidikanModel> datapendidikan = new List();
  void getpendidikan() async {
    Masterview_model()
        .pendidikan_registrasi_daftar(widget.varpendidikan.toString())
        .then((value2) {//handled
      setState(() {
        //datapendidikan = value2;
        datapendidikan = value2 == null ? [] : value2;
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

  var etemail, etnamalengkap, etnowa, etnohp;
  bool isConn = false;
  bool onChecking = false;

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


  String setPhoneNumber(String num){
    var pnumber;
    if(num!=null){
      if(num.length>3){
        if(num.substring(0,1)=='0'){
          pnumber = num.substring(1,num.length);
        }else if(num.substring(0,1)=='+'){
          pnumber = num.substring(3,num.length);
        }
      }
    }
    return pnumber;
  }

  void getData() {
    getpendidikan();
    sumber();
    block_pendidikan();
    check_agent();
    etemail = TextEditingController(text: globalEmail.toString());
    etnamalengkap = TextEditingController(text: widget.varnama.toString());
    etnowa = TextEditingController(text: setPhoneNumber(widget.varnowa.toString()));
    etnohp = TextEditingController(text: setPhoneNumber(widget.varnohp.toString()));
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
    conn();
  }

  // TextEditingController etnamalengkap = TextEditingController();
  TextEditingController etnamapanggilan = TextEditingController();
  TextEditingController etnoktp = TextEditingController();
  //TextEditingController etnohp = TextEditingController();
  //TextEditingController etnowa = TextEditingController();
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

  TextEditingController etkodepromo = TextEditingController();
  TextEditingController etkodepromo2 = TextEditingController();

  int currentStep = 0;
  bool complete = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    print("nama_agent${nama_agent.toString()}");
//   print("kodejurusan" + widget.kodejurusan);
// print("angkatan" + widget.angkatan);
// print("tahunangkatan" + widget.tahunangkatan);
// print("wilayah" + widget.wilayah);
// print("kodeprogram" + widget.kodeprogram);
// print("namaJurusan" + widget.namaJurusan);
// print("namalulusan" + widget.namalulusan);
// print("namajaket" + widget.namajaket);
// print("namaformulir" + widget.namaformulir);
// print("programperkuliahan" + widget.programperkuliahan);
// print("namakelompok" + widget.namakelompok);
// print("namakelaswaktu" + widget.namakelaswaktu);
// print("namakelassingkatan" + widget.namakelassingkatan);
// print("waktuspb" + widget.waktuspb);
// print("angsuranspb" + widget.angsuranspb);
// print("waktuspp" + widget.waktuspp);
// print("angsuranspp" + widget.angsuranspp);
// print("namaspb" + widget.namaspb.toString());
// print("namaspp" + widget.namaspp.toString());
// print("totalbiaya" + widget.totalbiaya.toString());
// print("namakonversi" + widget.namakonversi.toString());
// print("perpus" + widget.perpus.toString());
// print("kmhsmaba" + widget.kmhsmaba.toString());
// print("krs" + widget.krs.toString());
// print("dpm" + widget.dpm.toString());

    print("namakonversi${widget.namakonversi}");
    print("currentStep${currentStep}");

    String resultText = widget.kodejurusan.substring(0, 2);
    print("kodejuruan_block${block}");
    print("kodejuruan${resultText}");
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

    var pilihandirekomen = 'ya';

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
          body:
              // globalkey == null
              // ? DaftarNonLogin(

              // )
              // :

              isConn == false
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SpinKitThreeBounce(color: mainColor1),
                    ))
                  : ListView(
                      children: [
                        Container(
                            color:
                                block == 2 ? Colors.red[100] : Colors.blue[100],
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: block == 2
                                  ? Text(
                                      "ANDA BELUM BOLEH MENDAFTAR DI PRODI INI KARENA PENDIKAN BELUM MENCUKUPI")
                                  : Text(
                                      "Satu langkah lagi untuk berhasil mendaftarkan diri, pastikan melengkapi data dengan benar",
                                      style: blueFontStyle,
                                    ), //todo disable selesai button
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
                                    Text("*",
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                                content: Container(
                                    child: Form(
                                  key: _formKeys[0],
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // TextFormField(
                                      //   controller: etemail,
                                      //   decoration:
                                      //       InputDecoration(labelText: 'Email'),
                                      //   validator: (value) {
                                      //     if (value.isEmpty) {
                                      //       return 'Mohon isi Email';
                                      //     }
                                      //     return null;
                                      //   },
                                      // ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Email",
                                            style: blackFontStyle3,
                                          ),
                                          Text(
                                            globalEmail,
                                            style: blackFontStyle2,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
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
                                        decoration: InputDecoration(
                                            labelText: 'Nomor KTP'),
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
                                                keyboardType:
                                                    TextInputType.phone,
                                                decoration: InputDecoration(
                                                    labelText: 'Nomor Telepon'),
                                                validator: (value) {
                                                  String fchar = value !=
                                                              null ||
                                                          value != ""
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
                                                keyboardType:
                                                    TextInputType.phone,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Nomor Whatsapp'),
                                                validator: (value) {
                                                  String fchar = value !=
                                                              null ||
                                                          value != ""
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
                                                  style: TextStyle(
                                                      color: Colors.red),
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
                                        // TextFormField(
                                        //   decoration: InputDecoration(
                                        //       labelText: 'Tingkat Pendidikan'),
                                        //   validator: (value) {
                                        //     if (value.isEmpty) {
                                        //       return 'Mohon isi Tingkat Pendidikan';
                                        //     }
                                        //     return null;
                                        //   },
                                        // ),
                                        Center(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                11,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: DropdownButton(
                                                isExpanded: true,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                value: valpendidikan,
                                                //value: valPendidikan == null ? valPendidikan : buildingTypes.where( (i) => i.name == valPendidikan.name).first as BuildingType,
                                                hint: Text("Pilih Pendidikan"),
                                                items:
                                                    datapendidikan.map((item) {
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
                                          decoration: InputDecoration(
                                              labelText: 'Jurusan'),
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
                                          decoration: InputDecoration(
                                              labelText: 'Dari'),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Sudah Pernah Bekerja ?",
                                            style: blackFontStyle2.copyWith(
                                                color: Colors.black87)),
                                        Center(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                11,
                                            // decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(7.0),
                                            //     border: Border.all(color: Colors.blueGrey)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                      labelText:
                                                          'Nama Perusahaan'),
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
                                                    style: TextStyle(
                                                        color: Colors.red),
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
                                                        selectDueDateDari(
                                                            context);
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
                                                    style: TextStyle(
                                                        color: Colors.red),
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
                                                        selectDueDateHingga(
                                                            context);
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
                                                      labelText:
                                                          'Spesialisasi'),
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
                                                      labelText:
                                                          'Bidang Bekerjaan'),
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
                              content: widget.status_agent == '1'
                                  ? Container(
                                      child: Column(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text:
                                                  "Anda telah direkomendasikan oleh ",
                                              style: blueFontStyle.copyWith(
                                                  fontSize: 14),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: nama_agent.toString() ==
                                                          null
                                                      ? ""
                                                      : nama_agent.toString(),
                                                  // varnama.toString() == null
                                                  // ? ""
                                                  // : varnama.toString(),
                                                  style: blackFontStyle1Bold
                                                      .copyWith(fontSize: 14),
                                                ),
                                                TextSpan(
                                                  text: ' untuk mendaftar di ',
                                                  style: blueFontStyle.copyWith(
                                                      fontSize: 14),
                                                ),
                                                TextSpan(
                                                  text: widget.campus.nama
                                                              .toString() ==
                                                          null
                                                      ? ""
                                                      : widget.campus.nama
                                                          .toString(),
                                                  style: blackFontStyle1Bold
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Container(
                                            height: 160,
                                            width: 250,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                gambar_selfi == null
                                                    ? ""
                                                    : gambar_selfi,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
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
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )
                                                  ],
                                                ),
                                                items: dataSumber.map((item) {
                                                  return DropdownMenuItem(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                            //   padding:
                                            //       EdgeInsets.symmetric(vertical: 8),
                                            //   width:
                                            //       MediaQuery.of(context).size.width,
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
                                                title: Text(
                                                    "Punya kode promo ?",
                                                    style: blackFontStyle2
                                                        .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
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
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                          color: yellowColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Center(
                                                        child: Text(
                                                            "Promo berhasil digunakan",
                                                            style: blueFontStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                      ),
                                                    )
                                                  : Text(""),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 32,
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    child: EduButtonSecond(
                                      onPressed: currentStep == 0
                                          ? _onWillPop
                                          : onStepCancel,
                                      buttonText: 'Batal',
                                    ),
                                  ),
                                  Container(
                                    height: 32,
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    child: loading == true
                                        ? Center(
                                            child: SpinKitFadingCircle(
                                              color: orenColor,
                                            ),
                                          )
                                        : EduButton(
                                            onPressed: () {
                                              currentStep == 3
                                                  ? block == 2
                                                      ? doNothing()
                                                      : isConn == false
                                                          ? noConnCheck()
                                                          : check()
                                                  : next();
                                            },
                                            buttonColor: block == 2
                                                ? Colors.grey
                                                : yellowColor,
                                            textColor: block == 2
                                                ? Colors.white
                                                : mainColor1,
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
                        /*Container(
                                                                  height: 48,
                                                                  padding: EdgeInsets.symmetric(horizontal: 48),
                                                                  child: loading == true
                                                                      ? SpinKitFadingCircle(
                                                                          color: orenColor,
                                                                        )
                                                                      : block == 2 ? Center(child: Text("Anda Tidak Bisa Mendaftar Pendidikan Belum cukup")): EduButton(
                                                                          onPressed: () {
                                                                            isConn == false ? noConnCheck() : check();
                                                                          },
                                                                          buttonText: "Selesai",
                                                                        )),*/
                        //SizedBox(height: 24),
                      ],
                    )),
    );
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

  doNothing() {
    print("daftar: tdk berhasil");
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
    var etkodepromo1 = etkodepromo.text.toString();
      

      if(widget.status_agent=='1'){
        setState(() {
          valSumber = "eduAgent";
          
        });
      }


    if (etnamalengkap1.isNotEmpty &&
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
      print("succ=1");

      double frmlir = key_redeem == "1"
          ? double.parse(widget.namaformulir) * double.parse(diskon_redeem)
          : double.parse(widget.namaformulir);
      var arr = frmlir.toString().split('.');
      var namaformulir1 = arr[0].toString();
      setState(() {
        namaformulir2 = namaformulir1;
      });

      print("succsess${namaformulir2}");
      pendaftaran(etnamalengkap1, etnoktp1, etnohp1, etnowa1, etttl1, dateText,
          valpendidikan1);
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

  void pendaftaran(etnamalengkap1, etnoktp1, etnohp1, etnowa1, etttl1, dateText,
      valpendidikan1) {
    String _etnohp1S = etnohp1.substring(0, 1);
    String _etnowa1S = etnohp1.substring(0, 1);
    String _etnohp1 = etnohp1.toString();
    String _etnowa1 = etnowa1.toString();
    if (_etnohp1S == "0") _etnohp1 = etnohp1.substring(1, etnohp1.length());
    if (_etnowa1S == "0") _etnowa1 = etnowa1.substring(1, etnowa1.length());

    Kampusview_model()
        .pendaftaran(
      //keycode
      globalkey.toString(),
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
      globalEmail.toString(), //20
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
      widget.status_agent.toString(),
      keycode_agent.toString() == null ? "" : keycode_agent.toString(),
    )
        .then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        setState(() {
          no_virtual = data.message;
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
                      keycode: globalkey == null ? "" : globalkey,
                      namaJurusan:
                          widget.namaJurusan == null ? "" : widget.namaJurusan,
                      kodekampus:
                          widget.campus.kode == null ? "" : widget.campus.kode,
                      id_invoice: no_virtual == null ? "" : no_virtual,
                  status_agent: widget.status_agent,
                    ))));
      } else if (data.status == 400) {
        Flushbar(
          title: "Mohon Maaf",
          message: "Anda Pernah Terdaftar Sebelumnya",
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
    });
  }

  // void _navigateAndDisplaySelection(BuildContext context) async {
  //   // Navigator.push returns a Future that completes after calling
  //   // Navigator.pop on the Selection Screen.
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => ListPromo(
  //               kodekampus:
  //                   widget.campus.kode == null ? "" : widget.campus.kode,
  //             )),
  //   );

  //   // After the Selection Screen returns a result, hide any previous snackbars
  //   // and show the new result.

  //   var promo_redeem2 = result.split('#');

  //   // ScaffoldMessenger.of(context)
  //   //   ..removeCurrentSnackBar()
  //   //   // ..showSnackBar(SnackBar(content: Text('$result')));
  //   //    ..showSnackBar(SnackBar(content: Text('Berhasil Digunakan')));

  //   print("result${result}");
  //   setState(() {
  //     if (promo_redeem2[2] == "1" || promo_redeem2[2] == 1) {
  //       etkodepromo = TextEditingController(
  //           text: promo_redeem2[0] == "null" ? "" : promo_redeem2[0]);
  //     } else {
  //       etkodepromo = TextEditingController(text: "");
  //     }

  //     poin_redeem = promo_redeem2[0] == "null" ? "" : promo_redeem2[0];
  //     diskon_redeem = promo_redeem2[1] == "null" ? "" : promo_redeem2[1];
  //     key_redeem = promo_redeem2[2] == "null" ? "" : promo_redeem2[2];
  //   });
  // }
}
