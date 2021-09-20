part of 'pendaftaran_online.dart';

class FormPendaftaranOnline extends StatefulWidget {
  final String email, keycode, namalengkap;
  FormPendaftaranOnline({
    this.email,
    this.keycode,
    this.namalengkap,
  });
  @override
  _FormPendaftaranOnlineState createState() => _FormPendaftaranOnlineState();
}

class _FormPendaftaranOnlineState extends State<FormPendaftaranOnline> {
  TextEditingController etemail = TextEditingController();
  TextEditingController etnamalengkap = TextEditingController();
  TextEditingController etnowa = TextEditingController();
  TextEditingController etnohp = TextEditingController();

  TextEditingController _captchaNumsResUnReg = TextEditingController();

  var _loading = true;

  List<KelasModel> datakelas = new List();
  void getkelas() async {
    Masterview_model().masterkelas().then((value2) {//handled
      setState(() {
        datakelas = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  // SessionManager sessionManager = SessionManager();
  // void getPreferences() async {
  //   await sessionManager.getPreference().then((value) {//handled
  //     setState(() {
  //       mystatus = sessionManager.status;
  //       globalkey = sessionManager.key;
  //       globalEmail = sessionManager.email;
  //       // print("email_def${globalEmail}");
  //       // print("globalkey_def${globalkey}");
  //       // print("mystatus_def${mystatus}");
  //     });
  //   });
  // }

  List<KampusMasterModel> datakampus = new List();
  void getkampus() async {
    Masterview_model().kampus_master().then((value2) {//handled
      setState(() {
        datakampus = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<MasterJurusanModel> dataJurusan = new List();
  void jurusan() async {
    Masterview_model().jurusan().then((value1) {//handled
      setState(() {
        dataJurusan = value1 == null ? [] : value1;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<PendidikanModel> datapendidikan = new List();
  void getpendidikan() async {
    Masterview_model().masterpendidikan().then((value2) {//handled
      setState(() {
        datapendidikan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<UnitAreaModel> dataunitarea = [];
  void getunitrea() async {
    Masterview_model().unitarea().then((value) {//handled
      setState(() {
        dataunitarea = value == null ? [] : value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var dataSearchKampus = new List();
  void searchgetListKampus(valunitarea2, valprodi2, valkelas2) {
    Kampusview_model()
        .SearchgetKampus(valunitarea2, valprodi2, valkelas2)
        .then((value1) {//handled
      setState(() {
        dataSearchKampus = value1;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  final Future<String> checkKampus = Future<String>.delayed(
    const Duration(seconds: 10),
    () => 'Kampus tidak ditemukan',
  );

  //conn has been updated 22 August 2021
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

  void getData(){
    _loadDataUser();
    getkelas();
    getkampus();
    jurusan();
    getpendidikan();
    _captchaGenerator();
    getunitrea();
    etemail = TextEditingController(text: widget.email);
  }

  @override
  void initState() {
    super.initState();
   // getPreferences();
    getData();
  }

  var valunitarea;
  var hintunitarea;
  void modalBottomunitarea(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: dataunitarea,
            cat: "wilayah",
          );
        });
    setState(() {
      valunitarea = result[0].toString();
      hintunitarea = result[1].toString();
    });
  }

  var valpendidikanterakhir;
  var hintpendidikanterakhir;
  void modalBottomPendidikanTerakhir(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
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
                  child: Expanded(
                    child: datapendidikan.length == 0
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: datapendidikan.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = datapendidikan[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valpendidikanterakhir = lastDataSipema.kode;
                                    hintpendidikanterakhir =
                                        lastDataSipema.nama;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(lastDataSipema.nama,
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
                SizedBox(
                  height: 24,
                )
              ],
            ),
          );
        });
  }

  var valprodi;
  var hintprodi;
  void modalBottomProdi(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: dataJurusan,
            cat: "prodi",
          );
        });
    setState(() {
      valprodi = result[0].toString();
      hintprodi = result[1].toString();
    });
  }

  var valkelas;
  var hintkelas;
  void modalBottomKel(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: 300,
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
                  child: Expanded(
                    child: datakelas.length == 0
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: datakelas.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = datakelas[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valkelas = lastDataSipema.singkatan;
                                    hintkelas = lastDataSipema.nama;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(lastDataSipema.nama,
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
              ],
            ),
          );
        });
  }

  var valkampus;
  var hintkampus;
  void modalBottomKamp(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: 480,
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
                  child: Expanded(
                    child: dataSearchKampus.length == 0
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: dataSearchKampus.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = dataSearchKampus[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valkampus = lastDataSipema.singkatan;
                                    hintkampus = lastDataSipema.nama;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          lastDataSipema.nama == "zzz"
                                              ? "Data Tidak Ditemukan"
                                              : lastDataSipema.nama,
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
              ],
            ),
          );
        });
  }

  var InSignIn = false;
  void check() {
    // print('tes');

    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      //print('cees');
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etnamalengkap.text.toString().isEmpty ||
          etemail.text.toString().isEmpty ||
          etnohp.text.toString().isEmpty ||
          etnowa.text.toString().isEmpty ||
          valpendidikanterakhir.toString().isEmpty ||
          valpendidikanterakhir.toString() == "" ||
          valpendidikanterakhir.toString() == "null" ||
          valpendidikanterakhir.toString() == null ||
          // valkelas.toString().isEmpty || valkelas.toString()=="" ||
          // valprodi.toString().isEmpty || valprodi.toString()=="" ||
          valkampus.toString().isEmpty ||
          valkampus.toString() == "" ||
          valkampus.toString() == "null" ||
          valkampus.toString() == null) {
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
        setState(() {
          InSignIn = true;
        });

        HomeViewModel()
            .pendaftaran_online(
                etnamalengkap.text.toString(),
                etemail.text.toString(),
                etnohp.text.toString(),
                etnowa.text.toString(),
                valpendidikanterakhir.toString(),
                valunitarea.toString(),
                valprodi.toString(),
                valkelas.toString(),
                valkampus.toString())
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
                          email3: etemail.text.toString() == null
                              ? ""
                              : etemail.text.toString(),
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
              title: "Maaf !!",
              message: "Email anda sudah terdaftar di eduNitas,",
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
          onErrHandling(erro);
        });
      }

      // update_profile();

    };
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // print("dataJurusan${dataJurusan}");
    // // print("valkampus${valkampus}");
    searchgetListKampus(
        valunitarea.toString(), valprodi.toString(), valkelas.toString());

    print("SearchgetKampusvalunitarea= $valunitarea");
    print("SearchgetKampus= $valprodi");
    print("SearchgetKampus= $valkelas");
    return Scaffold(
      backgroundColor: Colors.white,
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
                'Formulir Pendaftaran Online',
                style: whiteFontStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _loading != true
                ? SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(24),
                            color: Colors.white,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daftar sekarang juga sebelum Kuota penuh dan Biaya Kuliah Naik',
                                    style: blackFontStyle1Bold.copyWith(
                                        fontSize: 12),
                                  ),
                                  Container(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Biaya Kuliah Mulai ",
                                        style: blueFontStyleBold,
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text: ' 350.000/bulan',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(height: 24, color: Colors.grey),
                                  globalEmail == null
                                      ? Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                  //enabled: false,
                                                  decoration:
                                                      new InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          // errorBorder: InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 14.0,
                                                                  bottom: 8.0,
                                                                  top: 8.0),
                                                          hintText:
                                                              "Nama Lengkap"),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: "Email ",
                                                    style: blueFontStyleBold,
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' *',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: TextFormField(
                                                  cursorColor: mainColor1,
                                                  controller: etemail,
                                                  validator: emailValidator,
                                                  //enabled: false,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration:
                                                      new InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          // focusedBorder:
                                                          //     InputBorder.none,
                                                          // enabledBorder:
                                                          //     InputBorder.none,
                                                          // errorBorder:
                                                          //     InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 14.0,
                                                                  bottom: 8.0,
                                                                  top: 8.0),
                                                          hintText:
                                                              "nama@email.com"),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: "No Handphone ",
                                                    style: blueFontStyleBold,
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                      padding: EdgeInsets.only(
                                                          bottom: 8, right: 15),
                                                      child: Text(
                                                        "+62",
                                                        style:
                                                            blueFontStyle2Bold,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          controller: etnohp,
                                                          cursorColor:
                                                              mainColor1,
                                                          //validator: waValidator,
                                                          decoration:
                                                              new InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  // focusedBorder: InputBorder.none,
                                                                  // enabledBorder: InputBorder.none,
                                                                  // errorBorder: InputBorder.none,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              10,
                                                                          bottom:
                                                                              5,
                                                                          top:
                                                                              5,
                                                                          right:
                                                                              10),
                                                                  hintText:
                                                                      "812345XXX"),
                                                          validator: (value) {
                                                            String fchar = value !=
                                                                        null ||
                                                                    value != ""
                                                                ? value
                                                                    .substring(
                                                                        0, 1)
                                                                : "0";
                                                            if (value.length <
                                                                10) {
                                                              return "Nomor salah, gunakan lebih dari 10 angka";
                                                            } else if (fchar !=
                                                                '8') {
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
                                                    text: "No Whatsapp ",
                                                    style: blueFontStyleBold,
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                      padding: EdgeInsets.only(
                                                          bottom: 8, right: 15),
                                                      child: Text(
                                                        "+62",
                                                        style:
                                                            blueFontStyle2Bold,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          controller: etnowa,
                                                          cursorColor:
                                                              mainColor1,
                                                          //validator: waValidator,
                                                          decoration:
                                                              new InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  // focusedBorder: InputBorder.none,
                                                                  // enabledBorder: InputBorder.none,
                                                                  // errorBorder: InputBorder.none,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              10,
                                                                          bottom:
                                                                              5,
                                                                          top:
                                                                              5,
                                                                          right:
                                                                              10),
                                                                  hintText:
                                                                      "812345XXX"),
                                                          validator: (value) {
                                                            String fchar = value !=
                                                                        null ||
                                                                    value != ""
                                                                ? value
                                                                    .substring(
                                                                        0, 1)
                                                                : "0";
                                                            if (value.length <
                                                                10) {
                                                              return "Nomor salah, gunakan lebih dari 10 angka";
                                                            } else if (fchar !=
                                                                '8') {
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
                                                    text:
                                                        "Pilih Pendidikan Terakhir ",
                                                    style: blueFontStyleBold,
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: ListTile(
                                                  onTap: () {
                                                    if (datapendidikan !=
                                                        null) {
                                                      modalBottomPendidikanTerakhir(
                                                          context);
                                                    }
                                                  },
                                                  leading: Text(
                                                    datapendidikan != null
                                                        ? hintpendidikanterakhir ==
                                                                null
                                                            ? 'Pilih Pendidikan Terakhir '
                                                            : hintpendidikanterakhir
                                                        : 'Mohon tunggu..',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                  trailing: Icon(
                                                    Icons.navigate_next,
                                                    color: mainColor1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Pilih Wilayah ",
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
                                  dataunitarea.length != 0
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: ListTile(
                                            onTap: () {
                                              if (dataunitarea != null) {
                                                modalBottomunitarea(context);
                                              }
                                            },
                                            leading: Text(
                                              dataunitarea != null
                                                  ? hintunitarea == null
                                                      ? 'Pilih Wilayah '
                                                      : hintunitarea
                                                  : 'Mohon tunggu..',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            trailing: Icon(
                                              Icons.navigate_next,
                                              color: mainColor1,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[350],
                                            highlightColor: Colors.white,
                                            child: Container(
                                                height: 48,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey[350])),
                                          ),
                                        ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Pilih Prodi ",
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
                                  dataJurusan.length != 0
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: ListTile(
                                            onTap: () {
                                              if (dataJurusan != null) {
                                                modalBottomProdi(context);
                                              }
                                            },
                                            leading: Text(
                                              dataJurusan != null
                                                  ? hintprodi == null
                                                      ? 'Pilih Prodi '
                                                      : hintprodi
                                                  : 'Mohon tunggu..',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            trailing: Icon(
                                              Icons.navigate_next,
                                              color: mainColor1,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[350],
                                            highlightColor: Colors.white,
                                            child: Container(
                                                height: 48,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey[350])),
                                          ),
                                        ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Pilih Kelas ",
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
                                  datakelas.length != 0
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: ListTile(
                                            onTap: () {
                                              if (datakelas != null) {
                                                modalBottomKel(context);
                                              }
                                            },
                                            leading: Text(
                                              datakelas != null
                                                  ? hintkelas == null
                                                      ? 'Pilih Kelas '
                                                      : hintkelas
                                                  : 'Mohon tunggu..',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            trailing: Icon(
                                              Icons.navigate_next,
                                              color: mainColor1,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[350],
                                            highlightColor: Colors.white,
                                            child: Container(
                                                height: 48,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey[350])),
                                          ),
                                        ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 48,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Pilih Kampus ",
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
                                  globalEmail == null
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: ListTile(
                                            onTap: () {
                                              if (dataSearchKampus != null) {
                                                modalBottomKamp(context);
                                              }
                                            },
                                            leading: Text(
                                              dataSearchKampus != null
                                                  ? hintkampus == null
                                                      ? 'Pilih Kampus '
                                                      : hintkampus == "zzz"
                                                          ? "Data Tidak Ditemukan"
                                                          : hintkampus
                                                  : 'Mohon tunggu..',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            trailing: Icon(
                                              Icons.navigate_next,
                                              color: mainColor1,
                                            ),
                                          ),
                                        )
                                      : hintunitarea != null
                                          ? Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 16),
                                              height: 90,
                                              width: double.infinity,
                                              child: dataSearchKampus[0].logo !=
                                                      "https=>//file.edunitas.com/assets/kampus/img/1576764353/medium-logo.png"
                                                  ? Center(
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            dataSearchKampus
                                                                .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int i) {
                                                          final _datakampus =
                                                              dataSearchKampus[
                                                                  i];
                                                          // return Container(child: Center(child: Terpopuler(logo : xpopuler.logo)));
                                                          return GestureDetector(
                                                            onTap: () {
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => (HomeDetailPage(
                                                                            campus:
                                                                                _datakampus,
                                                                            routef:
                                                                                'DaftarOnline',
                                                                          ))));
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .only(top: 4),
                                                              width: 72,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    height: 48,
                                                                    width: 48,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      boxShadow: <
                                                                          BoxShadow>[
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset: Offset(
                                                                              0.0,
                                                                              0.0),
                                                                          blurRadius:
                                                                              2.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      child: Image
                                                                          .network(
                                                                        _datakampus
                                                                            .logo,
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                9,
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                3,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Container(
                                                                    child: Text(
                                                                      _datakampus
                                                                          .singkatan,
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .clip,
                                                                      style: blueFontStyleBold.copyWith(
                                                                          fontSize:
                                                                              10),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  : FutureBuilder<String>(
                                                      future: checkKampus,
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<String>
                                                              snapshot) {
                                                        Widget ckampus;
                                                        if (snapshot.hasData) {
                                                          ckampus = Container(
                                                            child: Text(
                                                                snapshot.data,
                                                                style: TextStyle(
                                                                    color:
                                                                        mainColor1,
                                                                    fontSize:
                                                                        16)),
                                                          );
                                                        } else {
                                                          ckampus = Container(
                                                            height: 160,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Center(
                                                              child: SpinKitFadingCircle(
                                                                  color:
                                                                      orenColor),
                                                            ),
                                                          );
                                                        }
                                                        return ckampus;
                                                      },
                                                    ),
                                            )
                                          : Center(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 24),
                                                height: 48,
                                                child: Text(
                                                    "Mohon isi form diatas",
                                                    style:
                                                        blueFontStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16)),
                                              ),
                                            ),
                                  globalEmail == null //captha
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      "Silahkan proses verifikasi CAPTCHA ini dengan memasukan jawaban yang benar di dalam kotak",
                                                  style: blueFontStyleBold
                                                      .copyWith(fontSize: 11),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: ' *',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      _captchaNums[1]
                                                          .toString() +
                                                      " = ",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                controller:
                                                    _captchaNumsResUnReg,
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 14.0,
                                                          bottom: 8.0,
                                                          top: 8.0),
                                                  filled: false,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  hintText: "",
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  globalEmail == null
                                      ? Container(
                                          margin: EdgeInsets.all(24),
                                          height: 48,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: InSignIn
                                              ? SpinKitFadingCircle(
                                                  color: orenColor)
                                              : EduButton(
                                                  onPressed: () {
                                                    check();
                                                  },
                                                  buttonText: "Daftar",
                                                ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                          //   width: MediaQuery.of(context).size.width,
                          //   color: Color(0xFFBAE3FF),
                          //   child: Text(
                          //     'Sedang mencari kampus dan ingin mendaftar kuliah ?',
                          //     style: TextStyle(color: mainColor1),
                          //   ),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   child: FlatButton(
                          //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          //     height: 60,
                          //     color: mainColor1,
                          //     child: Text(
                          //       'Daftar',
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //     onPressed: () {},
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height - 114,
                    child: Center(
                      child: SpinKitThreeBounce(color: mainColor1),
                    ),
                  )
          ]))
        ],
      ),
    );
  }

  void _loadDataUser() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _loading = false;
      });
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
  TextEditingController etsearchwilayah = new TextEditingController();
  TextEditingController etsearchprodi = new TextEditingController();

  List<UnitAreaModel> fdataListwilayah = [];
  List<UnitAreaModel> dataListwilayah = [];
  List<MasterJurusanModel> fdataListprodi = [];
  List<MasterJurusanModel> dataListprodi = [];

  List<String> result = ["", ""];

  int lenght = 0;

  @override
  initState() {
    super.initState();
    if (widget.cat == "wilayah") {
      fdataListwilayah = widget.datalist;
      dataListwilayah = widget.datalist;
      lenght = fdataListwilayah.length;
    } else {
      fdataListprodi = widget.datalist;
      dataListprodi = widget.datalist;
      lenght = fdataListprodi.length;
    }
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
                controller:
                    widget.cat == "wilayah" ? etsearchwilayah : etsearchprodi,
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
                    if (widget.cat == "wilayah") {
                      fdataListwilayah = dataListwilayah
                          .where((u) => (u.nama
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                          .toList();
                      lenght = fdataListwilayah.length;
                    } else {
                      fdataListprodi = dataListprodi
                          .where((u) => (u.nama
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                          .toList();
                      lenght = fdataListprodi.length;
                    }
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
                    : widget.cat == "wilayah"
                        ? ListView.builder(
                            itemCount: lenght,
                            itemBuilder: (BuildContext context, int index) {
                              final fdata = fdataListwilayah[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    //print("valpos: "+lastDataSipema.id.toString()+"&&"+lastDataSipema.nama);
                                    //valposisi = lastDataSipema.id;
                                    //hintposisi = lastDataSipema.nama;
                                    result[0] = fdata.id.toString();
                                    result[1] = fdata.nama.toString();
                                    Navigator.pop(context, result);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          )
                        : ListView.builder(
                            itemCount: lenght,
                            itemBuilder: (BuildContext context, int index) {
                              final fdata = fdataListprodi[index];
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
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
