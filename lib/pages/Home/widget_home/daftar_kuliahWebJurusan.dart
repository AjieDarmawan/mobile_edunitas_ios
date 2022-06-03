part of 'widget_home.dart';

class Daftar_kuliahWebJurusan extends StatefulWidget {
  final Photo campus;
  final String kodejurusan,
      namaJurusan,
  //  namalulusan,
  //namajaket,

  //  kodeprogram,
  // namaKelompok,
      jenjang,
      status_agent;
  //final int namaspb, namaspp, namakonversi, perpus, kmhsmaba, krs, dpm;
  Daftar_kuliahWebJurusan({
    this.campus,
    // this.angkatan,
    // this.wilayah,
    // // this.namakonversi,
    // this.tahunangkatan,
    this.kodejurusan,
    this.namaJurusan,
    //this.namajaket,
    // this.namalulusan,
    // this.kodeprogram,
    // this.namaKelompok,
    this.jenjang,
    this.status_agent,
    // this.namaspp,
    // this.namaspb,
    // this.namaformulir,

    // this.kmhsmaba,
    // this.perpus,
    // this.krs,
    // this.dpm,
  });
  @override
  _Daftar_kuliahWebJurusanState createState() =>
      _Daftar_kuliahWebJurusanState();
}

class _Daftar_kuliahWebJurusanState extends State<Daftar_kuliahWebJurusan> {
  var kodejurusan = '',
      namaKelompok = '',
      kodeprogram = '',
      namaJurusan = '',
      namalulusan = '';

  var _loading = false;

  int namaspb, namaspp, namakonversi, perpus, kmhsmaba, krs, dpm;

  var program,
      angkatan,
      tahun,
      wilayah,
      jurusan,
      namajaket,
  // namaspp,
  // namaspb,
      namaformulir,
      bulanan,
  // namakonversi,
      tahunangkatan,
  // kmhsmaba,
  // perpus,
  // krs,
  // dpm,
      first_kodeprogram,
      first_kelompok,
      first_lulusan,
      lulusan,
      programstudi2;

  //kelompok where
  List<ListDetailJurusanPengelompok> datasipemaKelompok = new List();
  void getSipemaWhereKelompok(kode_kampus, kode_jurusan, kodeprogram) {
    KarirViewModel()
        .biayasipema_baru_kelompok(kode_kampus.toString(),
        kode_jurusan.toString(), kodeprogram.toString())
        .then((value) { //handled
      setState(() {
        //datasipemaKelompok = value;
        datasipemaKelompok = value == null ? [] : value;

        program = datasipemaKelompok[0].program;
        angkatan = datasipemaKelompok[0].angkatan;
        tahun = datasipemaKelompok[0].tahun;
        wilayah = datasipemaKelompok[0].wilayah;
        jurusan = datasipemaKelompok[0].jurusan;
        lulusan = datasipemaKelompok[0].lulusan;
        bulanan = datasipemaKelompok[0].bulanan;
        namajaket = datasipemaKelompok[0].jaket;
        namaspp = datasipemaKelompok[0].spp;
        namaspb = datasipemaKelompok[0].spb;
        namaformulir = datasipemaKelompok[0].formulir;
        angkatan = datasipemaKelompok[0].angkatan;
        wilayah = datasipemaKelompok[0].wilayah;
        namakonversi = 0;
        tahunangkatan = datasipemaKelompok[0].tahun;
        kmhsmaba = datasipemaKelompok[0].kmhsmaba;
        perpus = datasipemaKelompok[0].perpus;
        krs = datasipemaKelompok[0].krs;
        dpm = datasipemaKelompok[0].dpm;

        angsuranpertama = int.parse(namajaket);

        programstudi2 = lulusan.toString();

        first_kodeprogram = datasipemaKelompok[0].kodeprg;
        first_kelompok = datasipemaKelompok[0].kelompok;
        first_lulusan = datasipemaKelompok[0].lulusan;

        // this.namaspp,
        // this.namaspb,
        // this.namaformulir,
        // this.angkatan,
        // this.wilayah,
        // // this.namakonversi,
        // this.tahunangkatan,

        // this.kmhsmaba,
        // this.perpus,
        // this.krs,
        // this.dpm,

        //   biayajaket = first_namajaket.toString();
        // programstudilulusan = first_lulusan.toString();
        // namaspp = first_namaspp;
        // namaspb = first_namaspb;
        // namaformulir = first_formulir.toString();

        getBiayaSipemaAngsur();
        getBiayaSipemaAngsurSPP();
        datacampuskelas();
        datausers(globalEmail);
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  // kelompok program
  List<MasterJurusanModel> datasipemaprogram = new List();

  var sipema_program_nama, sipema_program_kode;
  void getSipemaWhereprogram(kode_kampus, kode_jurusan) {
    KarirViewModel()
        .biayasipema_baru_program(
        kode_kampus.toString(), kode_jurusan.toString())
        .then((value) { //handled
      setState(() {
        datasipemaprogram = value == null ? [] : value;

        // datasipemaprogram = value;

        sipema_program_nama = datasipemaprogram[0].nama;
        sipema_program_kode = datasipemaprogram[0].kode;

        getSipemaWhereKelompok(widget.campus.kode.toString(),
            widget.kodejurusan.toString(), sipema_program_kode.toString());
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List kelasapi = [];
  //var programperkuliahan;
  String defaultkelas, namakelaswaktu, namakelassingkatan;
  void datacampuskelas() async {
    Kampusview_model()
        .campuskelas(
      widget.campus.kode.toString(),
      // widget.kodejurusan.toString(),
      // first_kodeprogram.toString(),
      kodejurusan.length == 0
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      // kodejurusan.length == 0 ? "D3UP" : "D3UP",
      kodeprogram.length == 0
          ? first_kodeprogram.toString()
          : kodeprogram.toString(),
    )
        .then((value) {//handled
      setState(() {
        CampuskelasModel datacampuskelas = value;
        kelasapi = datacampuskelas.kelas;
        //  programperkuliahan = datacampuskelas.kodeprg;
        defaultkelas = datacampuskelas.kelas[0].title.toString() +
            "X" +
            datacampuskelas.kelas[0].singkatan.toString();

        namakelaswaktu = datacampuskelas.kelas[0].title.toString();
        namakelassingkatan = datacampuskelas.kelas[0].singkatan.toString();
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var labelnamaweb = '', kodeweb = '', jenjangweb;
  var dataWebJurusan = new List();
  void getWebJurusan() {
    sipemaview_model().getBiayaSipema_web(widget.campus.kode,widget.campus.webacid).then((value) {//handled
      setState(() {
        dataWebJurusan = value;
        labelnamaweb = dataWebJurusan[0].label;
        kodeweb = dataWebJurusan[0].kode;
        jenjangweb = dataWebJurusan[0].jenjang;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  //master spb
  List<AngsuranModel> dataAngsurSpb = new List();
  int valangsuranspb = 0;
  var valwaktuspb;
  void getBiayaSipemaAngsur() {
    sipemaview_model()
        .daftarangsuranspb(
      widget.campus.kode.toString(),
      // widget.kodejurusan.toString(),
      // first_kodeprogram.toString(),
      // first_kelompok.toString(),
      kodejurusan.length == 0
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      // kodejurusan.length == 0 ? "D3UP" : "D3UP",
      kodeprogram.length == 0
          ? first_kodeprogram.toString()
          : kodeprogram.toString(),
      // kodeprogram.length == 0 ? "P2K" : "P2K",
      namaKelompok.length == 0
          ? first_kelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value) {//handled
      setState(() {
        dataAngsurSpb = value;
        valangsuranspb = dataAngsurSpb[0].biayaAngsuran;
        valwaktuspb = dataAngsurSpb[0].waktuAngsuran;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  //master spp
  List<AngsuranModel> dataAngsurSpp = new List();
  int valangsuranspp = 0;
  var valwaktuspp;
  void getBiayaSipemaAngsurSPP() {
    sipemaview_model()
        .daftarangsuranspp(
      widget.campus.kode.toString(),
      // widget.kodejurusan.toString(),
      // first_kodeprogram.toString(),

      kodejurusan.length == 0
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      // kodejurusan.length == 0 ? "D3UP" : "D3UP",
      kodeprogram.length == 0
          ? first_kodeprogram.toString()
          : kodeprogram.toString(),
      // kodeprogram.length == 0 ? "P2K" : "P2K",
      // namaKelompok.length == 0
      //     ? first_kelompok.toString()
      //     : namaKelompok.toString(),
    )
        .then((value) {//handled
      setState(() {
        dataAngsurSpp = value;
        valangsuranspp = dataAngsurSpp[0].biayaAngsuran;
        valwaktuspp = dataAngsurSpp[0].waktuAngsuran;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  int angsuranpertama = 0;
  int totalbiaya = 0;

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

  String varnama,
      varemail,
      vargenre,
      varalamat,
      vartgl_lahir,
      vartempat_lahir,
      varpendidikan,
      varnohp,
      varnowa;

  void datausers(globalemail2) {
    UserViewModel().users_detail(globalemail2).then((value) {//handled
      UsersDetailModel data = value;

      if (data.status == 200) {
        setState(() {
          varnama = data.nama;
          varemail = data.email;
          varalamat = data.alamat;
          varpendidikan = data.pendidikan;
          varnohp = data.noHp;
          varnowa = data.noWa;
        });
      }
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
    getWebJurusan();
    getSipemaWhereKelompok(widget.campus.kode.toString(),
        widget.kodejurusan.toString(), sipema_program_kode.toString());

    getSipemaWhereprogram(
        widget.campus.kode.toString(), widget.kodejurusan.toString());

    // getBiayaSipemaAngsur();
    // getBiayaSipemaAngsurSPP();
    // datacampuskelas();
    // datausers(globalEmail);
    // setState(() {
    //   print("valangsuranspb${valangsuranspb}");
    //   angsuranpertama = int.parse(widget.namajaket);

    //   // totalbiaya = int.parse(angsuranpertama) + int.parse(widget.namaformulir);
    // });
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
    conn();
  }

  @override
  Widget build(BuildContext context) {
    datausers(globalEmail);

    //print("valkode${widget.status_agent.toString()}");
    // print("valkodejurusan${widget.kodejurusan.toString()}");
    // print("val_spp_kode${first_kodeprogram.toString()}");
    // // print("valkelompok${first_kelompok.toString()}");

    // // print("val_spb_spb${dataAngsurSpb}");
    // // print("val_spb_spp${dataAngsurSpp}");
    // //  print("val_spb_programperkuliahan${programperkuliahan}");

    // print(
    //     "val_spp${kodeprogram.length == 0 ? first_kodeprogram.toString() : kodeprogram.toString()}");

    // print("val_spp${programperkuliahan}");

    return Scaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: mainColor1,
          title: Text(
            "Daftar Kuliah",
            style: whiteFontStyle,
          ),
        ),
        body: isConn == false || _loading == true
            ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SpinKitThreeBounce(
                color: mainColor1,
              ),
            ))
            : Container(
          child:
          // dialog_loading()
          // programperkuliahan == null ||
          //     dataAngsurSpb.length == 0 ||
          //     dataAngsurSpp.length == 0 ||
          ListView(
            children: [
              Container(
                color: CupertinoColors.systemGrey5,
                padding: EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: mainColor1,
                          )),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  widget.campus.logo,
                                  fit: BoxFit.cover,
                                  // height: MediaQuery.of(context).size.height / 9,
                                  // width: MediaQuery.of(context).size.width / 3,
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width /
                                      1.5,
                                  child: Text(
                                    widget.namaJurusan,
                                    style: whiteFontStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  width:
                                  MediaQuery.of(context).size.width /
                                      1.5,
                                  child: Text(
                                    widget.campus.nama,
                                    style: whiteFontStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: Text("Pilih Kelompok Lulusan:",
                          style: blueFontStyle),
                    ),
                    Container(
                      child: datasipemaKelompok.length == 0
                          ? Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                              ),
                              Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Center(
                        child: GestureDetector(
                          onTap: () {
                            bottomModal2(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.fromLTRB(
                                24, 8, 24, 8),
                            width:
                            MediaQuery.of(context).size.width,
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Colors.blueGrey)),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    programstudi2,
                                    style: blackFontStyle3.copyWith(
                                        fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                Icon(
                                  Icons.navigate_next,
                                  color: mainColor1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      endIndent: 0,
                      indent: 16,
                      height: 32,
                      color: CupertinoColors.systemGrey4,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: Text("Program Perkuliahan Terpilih:",
                          style: blueFontStyle),
                    ),
                    Container(
                      child: datasipemaprogram.length == 0
                          ? Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                              ),
                              Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16),
                                child: CustomRadioButton(
                                  width: 220,
                                  enableShape: true,
                                  elevation: 1,
                                  padding: 0,
                                  spacing: 5.0,
                                  autoWidth: false,
                                  enableButtonWrap: true,
                                  wrapAlignment:
                                  WrapAlignment.start,
                                  horizontal: false,
                                  absoluteZeroSpacing: false,
                                  unSelectedColor: whiteColor,
                                  buttonLables:
                                  datasipemaprogram.map((item) {
                                    return item.nama.toString();
                                  }).toList(),
                                  buttonValues:
                                  datasipemaprogram.map((item) {
                                    return item.nama.toString() +
                                        "X" +
                                        item.kode.toString();
                                  }).toList(),
                                  defaultSelected:
                                  datasipemaprogram[0].nama +
                                      "X" +
                                      datasipemaprogram[0]
                                          .kode
                                          .toString(),
                                  buttonTextStyle: ButtonTextStyle(
                                    selectedColor: Colors.white,
                                    unSelectedColor: mainColor1,
                                    textStyle:
                                    blackFontStyle3.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  radioButtonValue: (value) {
                                    setState(() {
                                      var arr = value.split('X');
                                      sipema_program_nama = arr[0];
                                      sipema_program_kode = arr[1];

                                      // sipema_program_nama = value;
                                      getSipemaWhereKelompok(
                                          widget.campus.kode
                                              .toString(),
                                          kodeweb.toString(),
                                          sipema_program_kode
                                              .toString());

                                      // _loading = true;

                                      // _loadingProcess();
                                    });
                                  },
                                  selectedColor: mainColor1,
                                ),
                              );
                            }),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      endIndent: 0,
                      indent: 16,
                      height: 32,
                      color: CupertinoColors.systemGrey4,
                    ),
                    kelasapi.length == 0
                        ? Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[350],
                        highlightColor: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Colors.grey[350]),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Colors.grey[350]),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Colors.grey[350]),
                            ),
                          ],
                        ),
                      ),
                    )
                        : Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Text("Pilih Waktu Kuliah",
                            style: blueFontStyle),
                      ),
                      Container(
                        child: Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CustomRadioButton(
                                    width: 100,
                                    enableShape: true,
                                    elevation: 1,
                                    padding: 0,
                                    spacing: 5.0,
                                    autoWidth: false,
                                    enableButtonWrap: true,
                                    wrapAlignment:
                                    WrapAlignment.start,
                                    horizontal: false,
                                    absoluteZeroSpacing: false,
                                    unSelectedColor: whiteColor,
                                    buttonLables:
                                    kelasapi.map((item) {
                                      return item.title.toString();
                                    }).toList(),
                                    buttonValues:
                                    kelasapi.map((item) {
                                      return item.title.toString() +
                                          "X" +
                                          item.singkatan.toString();
                                    }).toList(),
                                    defaultSelected: defaultkelas
                                        .toString() ==
                                        null
                                        ? ''
                                        : defaultkelas.toString(),
                                    buttonTextStyle:
                                    ButtonTextStyle(
                                      selectedColor: Colors.white,
                                      unSelectedColor: mainColor1,
                                      textStyle:
                                      blackFontStyle3.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    radioButtonValue: (value) {
                                      setState(() {
                                        var arr = value.split('X');
                                        namakelaswaktu = arr[0];
                                        namakelassingkatan = arr[1];
                                        // print("defaultkelas${arr}");
                                        // print("defaultkelas${arr[0]}");
                                        // print("defaultkelas${arr[1]}");
                                      });
                                    },
                                    selectedColor: mainColor1,
                                  ),
                                );
                              }),
                        ),
                      ),
                    ]),
                    Container(
                      child: valangsuranspb == 0
                          ? Container()
                          : Divider(
                        thickness: 1,
                        endIndent: 0,
                        indent: 16,
                        height: 32,
                        color: CupertinoColors.systemGrey4,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: valangsuranspb == 0
                          ? Container()
                          : Text(
                          valangsuranspp == 0
                              ? "Pola Angsuran Biaya Kuliah"
                              : "Pola Angsuran SPb",
                          style: blueFontStyle),
                    ),
                    Container(
                      child: dataAngsurSpb.length == 0
                          ? Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(
                          child: dataAngsurSpb[0].waktuAngsuran == "0"
                              ? Center(child: Container())
                          //  Center(
                          //     child: Container(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 8),
                          //     child: Text("Tidak Ada Biaya SPb",
                          //         style: blackFontStyle2),
                          //   ))
                              : Container(
                            height: 48,
                            width: MediaQuery.of(context)
                                .size
                                .width,
                            child: ListView.builder(
                                itemCount: 1,
                                scrollDirection:
                                Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding:
                                    EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: CustomRadioButton(
                                      width: 120,
                                      enableShape: true,
                                      elevation: 1,
                                      padding: 0,
                                      spacing: 5.0,
                                      autoWidth: false,
                                      enableButtonWrap: true,
                                      wrapAlignment:
                                      WrapAlignment.start,
                                      horizontal: false,
                                      absoluteZeroSpacing:
                                      false,
                                      unSelectedColor:
                                      whiteColor,
                                      // buttonLables: [
                                      //   '36 x ',
                                      //   '12 x ',
                                      //   '7 x ',
                                      //   '4 x ',
                                      //   '1 x ',
                                      // ],
                                      //  buttonValues: [
                                      //   '36 x ',
                                      //   '12 x ',
                                      //   '7 x ',
                                      //   '4 x ',
                                      //   '1 x ',
                                      // ],
                                      buttonLables:
                                      dataAngsurSpb
                                          .map((item) {
                                        return item
                                            .waktuAngsuran +
                                            "X " +
                                            // item.biayaAngsuran.toString();

                                            NumberFormat.currency(
                                                symbol: '',
                                                decimalDigits:
                                                0,
                                                locale:
                                                'id-ID')
                                                .format(double
                                                .parse(item
                                                .biayaAngsuran
                                                .toString()));
                                      }).toList(),
                                      buttonValues:
                                      dataAngsurSpb
                                          .map((item) {
                                        return item
                                            .waktuAngsuran +
                                            "X" +
                                            item.biayaAngsuran
                                                .toString();
                                      }).toList(),
                                      defaultSelected:
                                      dataAngsurSpb[0]
                                          .waktuAngsuran +
                                          "X" +
                                          dataAngsurSpb[0]
                                              .biayaAngsuran
                                              .toString(),
                                      radioButtonValue:
                                          (value) {
                                        setState(() {
                                          print(
                                              "valuespb${value}");
                                          var arr =
                                          value.split('X');
                                          valwaktuspb = arr[0];
                                          valangsuranspb =
                                              int.parse(arr[1]);
                                          print(
                                              "valuespb${arr}");
                                          print(
                                              "valuespb${arr[0]}");
                                          print(
                                              "valuespb${arr[1]}");
                                        });
                                      },
                                      buttonTextStyle:
                                      ButtonTextStyle(
                                        selectedColor:
                                        Colors.white,
                                        unSelectedColor:
                                        mainColor1,
                                        textStyle:
                                        blackFontStyle3
                                            .copyWith(
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),

                                      selectedColor: mainColor1,
                                    ),
                                  );
                                }),
                          )),
                    ),
                    Container(
                      child: valangsuranspp == 0
                          ? Container()
                          : Divider(
                        thickness: 1,
                        endIndent: 0,
                        indent: 16,
                        height: 32,
                        color: CupertinoColors.systemGrey4,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: valangsuranspp == 0
                          ? Container()
                          : Text(
                          valangsuranspb == 0
                              ? "Pola Angsuran Biaya Kuliah"
                              : "Pola Angsuran SPP",
                          style: blueFontStyle),
                    ),
                    Container(
                      child: dataAngsurSpp.length == 0
                          ? Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey[350]),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(
                          child: dataAngsurSpp[0].waktuAngsuran == "0"
                              ? Center(child: Container())

                          // Center(
                          //     child: Container(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 8),
                          //     child: Text("Tidak Ada Biaya SPP",
                          //         style: blackFontStyle2),
                          //   ))

                              : Container(
                            height: 48,
                            width: MediaQuery.of(context)
                                .size
                                .width,
                            child: ListView.builder(
                                itemCount: 1,
                                scrollDirection:
                                Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding:
                                    EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: CustomRadioButton(
                                      width: 130,
                                      enableShape: true,
                                      elevation: 0,
                                      padding: 0,
                                      spacing: 5.0,
                                      autoWidth: false,
                                      enableButtonWrap: true,
                                      wrapAlignment:
                                      WrapAlignment.start,
                                      horizontal: false,
                                      absoluteZeroSpacing:
                                      false,
                                      unSelectedColor:
                                      whiteColor,
                                      // buttonLables: [
                                      //   '36 x ',
                                      //   '12 x ',
                                      //   '7 x ',
                                      //   '4 x ',
                                      //   '1 x ',
                                      // ],
                                      //  buttonValues: [
                                      //   '36 x ',
                                      //   '12 x ',
                                      //   '7 x ',
                                      //   '4 x ',
                                      //   '1 x ',
                                      // ],
                                      buttonLables:
                                      dataAngsurSpp
                                          .map((item) {
                                        return item
                                            .waktuAngsuran +
                                            "X " +
                                            //  item.biayaAngsuran.toString();

                                            NumberFormat.currency(
                                                symbol: '',
                                                decimalDigits:
                                                0,
                                                locale:
                                                'id-ID')
                                                .format(double
                                                .parse(item
                                                .biayaAngsuran
                                                .toString()));
                                      }).toList(),
                                      buttonValues:
                                      dataAngsurSpp
                                          .map((item) {
                                        return item
                                            .waktuAngsuran +
                                            "X" +
                                            item.biayaAngsuran
                                                .toString();
                                      }).toList(),
                                      defaultSelected:
                                      dataAngsurSpp[0]
                                          .waktuAngsuran +
                                          "X" +
                                          dataAngsurSpp[0]
                                              .biayaAngsuran
                                              .toString(),
                                      radioButtonValue:
                                          (value) {
                                        setState(() {
                                          print(
                                              "valuespp${value}");
                                          var arr =
                                          value.split('X');
                                          valwaktuspp = arr[0];
                                          valangsuranspp =
                                              int.parse(arr[1]);
                                          print(
                                              "valuespp${arr}");
                                          print(
                                              "valuespp${arr[0]}");
                                          print(
                                              "valuespp${arr[1]}");
                                        });
                                        //print("SPP nilai ${valwaktuspp}");
                                      },
                                      buttonTextStyle:
                                      ButtonTextStyle(
                                        selectedColor:
                                        Colors.white,
                                        unSelectedColor:
                                        mainColor1,
                                        textStyle:
                                        blackFontStyle3
                                            .copyWith(
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),

                                      selectedColor: mainColor1,
                                    ),
                                  );
                                }),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: datasipemaprogram.length == 0 ||
                    dataAngsurSpb.length == 0 ||
                    dataAngsurSpp.length == 0
                    ? Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[350],
                      highlightColor: Colors.white,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration:
                        BoxDecoration(color: Colors.grey[350]),
                      ),
                    ),
                  ),
                )
                    : ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment:
                    ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Container(
                    height: 48,
                    color: yellowColor.withOpacity(1),
                    child: Container(
                      child: Row(
                        children: [
                          ExpandableIcon(
                            theme: const ExpandableThemeData(
                              expandIcon: Icons.arrow_right,
                              collapseIcon: Icons.arrow_drop_down,
                              iconColor: Colors.white,
                              iconSize: 24.0,
                              //iconRotationAngle: math.pi / 2,
                              iconPadding:
                              EdgeInsets.only(right: 8),
                              hasIcon: false,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 16),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Angsuran Petama",
                                    style: blueFontStyle.copyWith(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(angsuranpertama +
                                        valangsuranspb +
                                        valangsuranspp +
                                        perpus +
                                        kmhsmaba +
                                        krs +
                                        dpm),
                                    style: blueFontStyle.copyWith(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: Container(
                    color: CupertinoColors.systemGrey6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          Container(
                            child: valangsuranspb == 0
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                    valangsuranspp == 0
                                        ? "Biaya Kuliah"
                                        : "SPB",
                                    style: blueFontStyle),
                                Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(valangsuranspb ==
                                      0
                                      ? 0
                                      : valangsuranspb),
                                  style: blueFontStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: valangsuranspb == 0
                                ? Container()
                                : Divider(
                              thickness: 1,
                              color:
                              CupertinoColors.systemGrey3,
                              height: 16,
                            ),
                          ),
                          Container(
                            child: valangsuranspp == 0
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                    valangsuranspb == 0
                                        ? "Biaya Kuliah"
                                        : "SPP",
                                    style: blueFontStyle),
                                Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(valangsuranspp ==
                                        0
                                        ? 0
                                        : valangsuranspp),
                                    style: blueFontStyle)
                              ],
                            ),
                          ),
                          Container(
                            child: valangsuranspp == 0
                                ? Container()
                                : Divider(
                              thickness: 1,
                              color:
                              CupertinoColors.systemGrey3,
                              height: 16,
                            ),
                          ),
                          Container(
                            child: namajaket == "0"
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text("Jaket",
                                    style: blueFontStyle),
                                Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(int.parse(
                                        namajaket)),
                                    style: blueFontStyle)
                              ],
                            ),
                          ),

                          Container(
                            child: namajaket == "0"
                                ? Container()
                                : Divider(
                              thickness: 1,
                              color:
                              CupertinoColors.systemGrey3,
                              height: 16,
                            ),
                          ),
                          Container(
                            child: kmhsmaba == 0
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text("Kmhs ",
                                    style: blueFontStyle),
                                Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(kmhsmaba),
                                    style: blueFontStyle)
                              ],
                            ),
                          ),
                          Container(
                            child: kmhsmaba == 0
                                ? Container()
                                : Divider(
                              thickness: 1,
                              color:
                              CupertinoColors.systemGrey3,
                              height: 16,
                            ),
                          ),
                          Container(
                            child: perpus == 0
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text("Perpustakaan ",
                                    style: blueFontStyle),
                                Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(perpus),
                                    style: blueFontStyle)
                              ],
                            ),
                          ),
                          Container(
                            child: perpus == 0
                                ? Container()
                                : Divider(
                              thickness: 1,
                              color:
                              CupertinoColors.systemGrey3,
                              height: 16,
                            ),
                          ),

                          Container(
                            child: krs == 0
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text("KRS ",
                                    style: blueFontStyle),
                                Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(krs),
                                    style: blueFontStyle)
                              ],
                            ),
                          ),
                          Container(
                            child: krs == 0
                                ? Container()
                                : Divider(
                              thickness: 1,
                              color:
                              CupertinoColors.systemGrey3,
                              height: 16,
                            ),
                          ),

                          Container(
                            child: dpm == 0
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text("DPM ",
                                    style: blueFontStyle),
                                Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(dpm),
                                    style: blueFontStyle)
                              ],
                            ),
                          ),
                          Container(
                            child: dpm == 0
                                ? Container()
                                : Divider(
                              thickness: 1,
                              color:
                              CupertinoColors.systemGrey3,
                              height: 16,
                            ),
                          ),

                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text("Lainnya", style: blueFontStyle),
                          //     Text(
                          //         NumberFormat.currency(
                          //                 symbol: 'IDR ',
                          //                 decimalDigits: 0,
                          //                 locale: 'id-ID')
                          //             .format(0),
                          //         style: blueFontStyle)
                          //   ],
                          // ),
                        ],
                        //softWrap: true,
                      ),
                    ),
                  ),
                ),
              ),
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  height: 48,
                  color: mainColor1,
                  child: Container(
                    child: Row(
                      children: [
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.arrow_right,
                            collapseIcon: Icons.arrow_drop_down,
                            iconColor: Colors.white,
                            iconSize: 24.0,
                            iconPadding: EdgeInsets.only(right: 8),
                            hasIcon: false,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 16),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Biaya",
                                  style: whiteFontStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: datasipemaprogram.length == 0 ||
                                      dataAngsurSpb.length == 0 ||
                                      dataAngsurSpp.length == 0
                                      ? Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[350],
                                        highlightColor:
                                        Colors.white,
                                        child: Container(
                                          width:
                                          MediaQuery.of(context)
                                              .size
                                              .width /
                                              4,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(20),
                                              color:
                                              Colors.grey[350]),
                                        ),
                                      ),
                                    ),
                                  )
                                      : Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(angsuranpertama +
                                        valangsuranspb +
                                        valangsuranspp +
                                        int.parse(
                                            namaformulir) +
                                        perpus +
                                        kmhsmaba +
                                        krs +
                                        dpm),
                                    style: whiteFontStyle.copyWith(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expanded: Container(
                  color: CupertinoColors.systemGrey6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pendaftaran",
                              style: blueFontStyle,
                            ),
                            Container(
                              child: datasipemaprogram.length == 0 ||
                                  dataAngsurSpb.length == 0 ||
                                  dataAngsurSpp.length == 0
                                  ? Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[350],
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          4,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          color: Colors.grey[350]),
                                    ),
                                  ),
                                ),
                              )
                                  : Text(
                                NumberFormat.currency(
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                    locale: 'id-ID')
                                    .format(
                                    int.parse(namaformulir)),
                                style: blueFontStyle,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: CupertinoColors.systemGrey3,
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Angsuran Pertama",
                              style: blueFontStyle,
                            ),
                            Container(
                              child: datasipemaprogram.length == 0 ||
                                  dataAngsurSpb.length == 0 ||
                                  dataAngsurSpp.length == 0
                                  ? Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[350],
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          4,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          color: Colors.grey[350]),
                                    ),
                                  ),
                                ),
                              )
                                  : Text(
                                NumberFormat.currency(
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                    locale: 'id-ID')
                                    .format(angsuranpertama +
                                    valangsuranspb +
                                    valangsuranspp +
                                    perpus +
                                    kmhsmaba +
                                    krs +
                                    dpm),
                                style: blueFontStyle,
                              ),
                            )
                          ],
                        ),
                      ],
                      //softWrap: true,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 3.0)
                  ],
                ),
                height: 64,
                child: datasipemaprogram.length == 0 ||
                    dataAngsurSpb.length == 0 ||
                    dataAngsurSpp.length == 0
                    ? Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[350],
                      highlightColor: Colors.white,
                      child: Container(
                        width:
                        MediaQuery.of(context).size.width / 1.5,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350]),
                      ),
                    ),
                  ),
                )
                    : Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 40,
                      child: EduButton(
                        buttonText: "Lanjut Daftar",
                        onPressed: () {
                          globalkey == null
                              ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  (DaftarNonLogin(

                                    //session
                                      varpendidikan:
                                      varpendidikan == null
                                          ? ""
                                          : varpendidikan
                                          .toString(),
                                      varnama: varnama == null
                                          ? ""
                                          : varnama.toString(),
                                      varnohp: varnohp == null
                                          ? ""
                                          : varnohp.toString(),
                                      varnowa: varnowa == null
                                          ? ""
                                          : varnowa.toString(),
                                      campus: widget.campus,
                                      angkatan: angkatan,
                                      tahunangkatan:
                                      tahunangkatan,
                                      wilayah: wilayah,
                                      namakonversi:
                                      namakonversi == null
                                          ? ""
                                          : namakonversi,
                                      kodejurusan: kodejurusan.length ==
                                          0
                                          ? widget.kodejurusan
                                          .toString()
                                          : kodejurusan.toString() ==
                                          null
                                          ? ""
                                          : kodejurusan.length ==
                                          0
                                          ? widget
                                          .kodejurusan
                                          .toString()
                                          : kodejurusan
                                          .toString(),
                                      kodeprogram: kodeprogram
                                          .length ==
                                          0
                                          ? first_kodeprogram
                                          .toString()
                                          : kodeprogram.toString() ==
                                          null
                                          ? ""
                                          : kodeprogram.length ==
                                          0
                                          ? first_kodeprogram
                                          .toString()
                                          : kodeprogram
                                          .toString(),
                                      namaJurusan: namaJurusan
                                          .length ==
                                          0
                                          ? widget.namaJurusan.toString()
                                          : namaJurusan.toString() == null
                                          ? ""
                                          : namaJurusan.length == 0
                                          ? widget.namaJurusan.toString()
                                          : namaJurusan.toString(),
                                      namalulusan: namalulusan.length == 0
                                          ? first_lulusan.toString()
                                          : namalulusan.toString() == null
                                          ? ""
                                          : namalulusan.length == 0
                                          ? first_lulusan.toString()
                                          : namalulusan.toString(),
                                      namajaket: namajaket,
                                      namaspb: namaspb,
                                      namaspp: namaspp,
                                      namaformulir: namaformulir,
                                      programperkuliahan: sipema_program_nama,
                                      namakelompok: namaKelompok.length == 0
                                          ? first_kelompok.toString()
                                          : namaKelompok.toString() == null
                                          ? ""
                                          : namaKelompok.length == 0
                                          ? first_kelompok.toString()
                                          : namaKelompok.toString(),
                                      namakelaswaktu: namakelaswaktu,
                                      namakelassingkatan: namakelassingkatan,
                                      waktuspb: valwaktuspb.toString() == null ? '' : valwaktuspb.toString(),
                                      angsuranspb: valangsuranspb.toString() == null ? '' : valangsuranspb.toString(),
                                      waktuspp: valwaktuspp.toString() == null ? '' : valwaktuspb.toString(),
                                      angsuranspp: valangsuranspp.toString() == null ? '' : valangsuranspp.toString(),
                                      perpus: perpus,
                                      kmhsmaba: kmhsmaba,
                                      krs: krs,
                                      dpm: dpm,
                                      totalbiaya: angsuranpertama + valangsuranspb + valangsuranspp + int.parse(namaformulir) + perpus + kmhsmaba))))
                              : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (Daftar(

                                    //session
                                      varpendidikan: varpendidikan == null ? "" : varpendidikan.toString(),
                                      varnama: varnama == null ? "" : varnama.toString(),
                                      varnohp: varnohp == null ? "" : varnohp.toString(),
                                      varnowa: varnowa == null ? "" : varnowa.toString(),
                                      campus: widget.campus,
                                      angkatan: angkatan,
                                      tahunangkatan: tahunangkatan,
                                      wilayah: wilayah,
                                      namakonversi: namakonversi == null ? "" : namakonversi,
                                      kodejurusan: kodejurusan.length == 0
                                          ? widget.kodejurusan.toString()
                                          : kodejurusan.toString() == null
                                          ? ""
                                          : kodejurusan.length == 0
                                          ? widget.kodejurusan.toString()
                                          : kodejurusan.toString(),
                                      kodeprogram: kodeprogram.length == 0
                                          ? first_kodeprogram.toString()
                                          : kodeprogram.toString() == null
                                          ? ""
                                          : kodeprogram.length == 0
                                          ? first_kodeprogram.toString()
                                          : kodeprogram.toString(),
                                      namaJurusan: namaJurusan.length == 0
                                          ? widget.namaJurusan.toString()
                                          : namaJurusan.toString() == null
                                          ? ""
                                          : namaJurusan.length == 0
                                          ? widget.namaJurusan.toString()
                                          : namaJurusan.toString(),
                                      namalulusan: namalulusan.length == 0
                                          ? first_lulusan.toString()
                                          : namalulusan.toString() == null
                                          ? ""
                                          : namalulusan.length == 0
                                          ? first_lulusan.toString()
                                          : namalulusan.toString(),
                                      namajaket: namajaket,
                                      namaspb: namaspb,
                                      namaspp: namaspp,
                                      namaformulir: namaformulir,
                                      programperkuliahan: sipema_program_nama,
                                      namakelompok: namaKelompok.length == 0
                                          ? first_kelompok.toString()
                                          : namaKelompok.toString() == null
                                          ? ""
                                          : namaKelompok.length == 0
                                          ? first_kelompok.toString()
                                          : namaKelompok.toString(),
                                      namakelaswaktu: namakelaswaktu,
                                      namakelassingkatan: namakelassingkatan,
                                      waktuspb: valwaktuspb.toString() == null ? '' : valwaktuspb.toString(),
                                      angsuranspb: valangsuranspb.toString() == null ? '' : valangsuranspb.toString(),
                                      waktuspp: valwaktuspp.toString() == null ? '' : valwaktuspb.toString(),
                                      angsuranspp: valangsuranspp.toString() == null ? '' : valangsuranspp.toString(),
                                      perpus: perpus,
                                      kmhsmaba: kmhsmaba,
                                      krs: krs,
                                      dpm: dpm,
                                      keycode : globalkey == null ? "" : globalkey.toString(),
                                      status_agent: widget.status_agent == null ? "" : widget.status_agent.toString(),
                                      totalbiaya: angsuranpertama + valangsuranspb + valangsuranspp + int.parse(namaformulir) + perpus + kmhsmaba))));
                        },
                      ),
                    )),
              ),
            ],
          ),
        ));
  }

  Future bottomModal2(BuildContext context) {
    return showModalBottomSheet(
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
                    child: datasipemaKelompok.length == 0
                        ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                        ))
                        : ListView.builder(
                      itemCount: datasipemaKelompok.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              kodejurusan =
                                  datasipemaKelompok[index].kodejrs;
                              kodeprogram =
                                  datasipemaKelompok[index].kodeprg;

                              namaKelompok =
                                  datasipemaKelompok[index].kelompok;
                              namalulusan =
                                  datasipemaKelompok[index].lulusan;

                              // // dataAngsur = datSipemaByIndex.angsur;
                              program = datasipemaKelompok[index].program;
                              angkatan =
                                  datasipemaKelompok[index].angkatan;
                              tahun = datasipemaKelompok[index].tahun;
                              wilayah = datasipemaKelompok[index].wilayah;
                              jurusan = datasipemaKelompok[index].jurusan;
                              lulusan = datasipemaKelompok[index].lulusan;

                              bulanan = datasipemaKelompok[index].bulanan;
                              namajaket = datasipemaKelompok[index].jaket;
                              namaspp = datasipemaKelompok[index].spp;
                              namaspb = datasipemaKelompok[index].spb;
                              namaformulir =
                                  datasipemaKelompok[index].formulir;
                              angkatan =
                                  datasipemaKelompok[index].angkatan;
                              wilayah = datasipemaKelompok[index].wilayah;
                              namakonversi = 0;
                              tahunangkatan =
                                  datasipemaKelompok[index].tahun;
                              kmhsmaba =
                                  datasipemaKelompok[index].kmhsmaba;
                              perpus = datasipemaKelompok[index].perpus;
                              krs = datasipemaKelompok[index].krs;
                              dpm = datasipemaKelompok[index].dpm;

                              angsuranpertama = int.parse(namajaket);

                              programstudi2 = lulusan.toString();

                              getBiayaSipemaAngsur();
                              getBiayaSipemaAngsurSPP();
                              datacampuskelas();

                              Navigator.pop(context);

                              //bikin loading fullscreen disini

                              _loading = true;

                              _loadingProcess();

                              ///
                              ///
                              ///.
                              ///
                              ///
                              ///
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 24, top: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          datasipemaKelompok[index]
                                              .lulusan,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: whiteFontStyle.copyWith(
                                              fontWeight:
                                              FontWeight.bold)),
                                      SizedBox(height: 4),
                                      Text(
                                          datasipemaKelompok[index]
                                              .jurusan,
                                          overflow: TextOverflow.clip,
                                          style: whiteFontStyle.copyWith(
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                // Text(
                                //     NumberFormat.currency(
                                //             symbol: 'Rp. ',
                                //             decimalDigits: 0,
                                //             locale: 'id-ID')
                                //         .format(double.parse(
                                //             datSipemaByIndex
                                //                 .detail.bulanan)),
                                //     textAlign: TextAlign.left,
                                //     overflow: TextOverflow.clip,
                                //     style: orenFontStyle.copyWith(
                                //         fontSize: 14,
                                //         fontWeight: FontWeight.bold,
                                //         color: Color(0xFFFFCE00))),
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

  void _loadingProcess() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }
}
