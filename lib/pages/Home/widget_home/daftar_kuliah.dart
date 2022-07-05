part of 'widget_home.dart';

class Daftar_kuliah extends StatefulWidget {
  final Photo campus;
  final String kodejurusan,
      kodeprogram,
      angkatan,
      wilayah,
      tahunangkatan,
      namaJurusan,
      namalulusan,
      namajaket,
      namaformulir,
      namakelompok;
  final int namaspb, namaspp, namakonversi, perpus, kmhsmaba, krs, dpm;
  Daftar_kuliah({
    this.campus,
    this.angkatan,
    this.wilayah,
    this.namakonversi,
    this.tahunangkatan,
    this.kodejurusan,
    this.kodeprogram,
    this.namaJurusan,
    this.namajaket,
    this.namalulusan,
    this.namaspp,
    this.namaspb,
    this.namaformulir,
    this.namakelompok,
    this.kmhsmaba,
    this.perpus,
    this.krs,
    this.dpm,
  });
  @override
  _Daftar_kuliahState createState() => _Daftar_kuliahState();
}

class _Daftar_kuliahState extends State<Daftar_kuliah> {

  List kelasapi = [];
  var programperkuliahan;
  String defaultkelas, namakelaswaktu, namakelassingkatan;
  void datacampuskelas() async {
    Kampusview_model()
        .campuskelas(widget.campus.kode.toString(),
        widget.kodejurusan.toString(), widget.kodeprogram.toString())
        .then((value) {//handled
      setState(() {
        CampuskelasModel datacampuskelas = value;
        kelasapi = datacampuskelas.kelas;
        programperkuliahan = datacampuskelas.kodeprg;
        defaultkelas = datacampuskelas.kelas[0].title.toString() +
            "X" +
            datacampuskelas.kelas[0].singkatan.toString();

        namakelaswaktu = datacampuskelas.kelas[0].title.toString();
        namakelassingkatan = datacampuskelas.kelas[0].singkatan.toString();
      });
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
        widget.kodejurusan.toString(),
        widget.kodeprogram.toString(),
        widget.namakelompok.toString())
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
        .daftarangsuranspp(widget.campus.kode.toString(),
        widget.kodejurusan.toString(), widget.kodeprogram.toString(),"")
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
    getBiayaSipemaAngsur();
    getBiayaSipemaAngsurSPP();
    datacampuskelas();
    datausers(globalEmail);
    setState(() {
      print("valangsuranspb${valangsuranspb}");
      angsuranpertama = int.parse(widget.namajaket);

      // totalbiaya = int.parse(angsuranpertama) + int.parse(widget.namaformulir);
    });
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
    print("valangsuranspp${valangsuranspp}");
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
        body: isConn == false
            ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SpinKitThreeBounce(
                color: mainColor1,
              ),
            ))
            : Container(
          child: ListView(
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
                      child: Text("Program Perkuliahan Terpilih:",
                          style: blueFontStyle),
                    ),
                    Container(
                      child: programperkuliahan == null
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
                                  buttonLables: [
                                    programperkuliahan,
                                    //'Perkuliahan Karyawan',
                                  ],
                                  buttonValues: [
                                    programperkuliahan,
                                    // "PARENT",
                                  ],
                                  defaultSelected:
                                  programperkuliahan,
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
                                    print(value);
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: Text("Pilih Waktu Kuliah",
                          style: blueFontStyle),
                    ),
                    Container(
                      child: programperkuliahan == null
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
                                  defaultSelected:
                                  defaultkelas.toString() ==
                                      null
                                      ? ''
                                      : defaultkelas.toString(),
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
                    Container(
                      child : valangsuranspb == 0 ? Container() :  Divider(
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
                      child: valangsuranspb == 0 ? Container() :
                      Text(valangsuranspp == 0 ? "Pola Angsuran Biaya Kuliah" : "Pola Angsuran SPb", style: blueFontStyle),
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
                      child : valangsuranspp == 0 ? Container() :  Divider(
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
                      child:  valangsuranspp == 0 ? Container() :
                      Text(valangsuranspb == 0 ? "Pola Angsuran Biaya Kuliah" : "Pola Angsuran SPP", style: blueFontStyle),
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
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
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
                                  "Total Angsuran Petama",
                                  style: blueFontStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(angsuranpertama +
                                      valangsuranspb +
                                      valangsuranspp +
                                      widget.perpus +
                                      widget.kmhsmaba +
                                      widget.krs +
                                      widget.dpm),
                                  style: blueFontStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                          child:  valangsuranspb == 0 ? Container() :  Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(valangsuranspp == 0 ? "Biaya Kuliah" : "SPB", style: blueFontStyle),
                              Text(
                                NumberFormat.currency(
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                    locale: 'id-ID')
                                    .format(valangsuranspb == 0
                                    ? 0
                                    : valangsuranspb),
                                style: blueFontStyle,
                              )
                            ],
                          ),
                        ),
                        Container(
                          child:  valangsuranspb == 0 ? Container() :  Divider(
                            thickness: 1,
                            color: CupertinoColors.systemGrey3,
                            height: 16,
                          ),
                        ),
                        Container(
                          child:  valangsuranspp == 0 ? Container() :  Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(valangsuranspb == 0 ? "Biaya Kuliah" : "SPP", style: blueFontStyle),
                              Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(valangsuranspp == 0
                                      ? 0
                                      : valangsuranspp),
                                  style: blueFontStyle)
                            ],
                          ),
                        ),
                        Container(
                          child:  valangsuranspp == 0 ? Container() :  Divider(
                            thickness: 1,
                            color: CupertinoColors.systemGrey3,
                            height: 16,
                          ),
                        ),
                        Container(
                          child:  widget.namajaket == "0" ? Container() : Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Jaket", style: blueFontStyle),
                              Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(int.parse(widget.namajaket)),
                                  style: blueFontStyle)
                            ],
                          ),
                        ),



                        Container(
                          child : widget.namajaket == "0" ? Container() : Divider(
                            thickness: 1,
                            color: CupertinoColors.systemGrey3,
                            height: 16,
                          ),
                        ),
                        Container(
                          child: widget.kmhsmaba == 0
                              ? Container()
                              : Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Kmhs ", style: blueFontStyle),
                              Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(widget.kmhsmaba),
                                  style: blueFontStyle)
                            ],
                          ),
                        ),
                        Container(
                          child: widget.kmhsmaba == 0
                              ? Container()
                              : Divider(
                            thickness: 1,
                            color: CupertinoColors.systemGrey3,
                            height: 16,
                          ),
                        ),
                        Container(
                          child: widget.perpus == 0
                              ? Container()
                              : Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Perpustakaan ",
                                  style: blueFontStyle),
                              Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(widget.perpus),
                                  style: blueFontStyle)
                            ],
                          ),
                        ),
                        Container(
                          child: widget.perpus == 0
                              ? Container()
                              : Divider(
                            thickness: 1,
                            color: CupertinoColors.systemGrey3,
                            height: 16,
                          ),
                        ),

                        Container(
                          child: widget.krs == 0
                              ? Container()
                              : Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("KRS ", style: blueFontStyle),
                              Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(widget.krs),
                                  style: blueFontStyle)
                            ],
                          ),
                        ),
                        Container(
                          child: widget.krs == 0
                              ? Container()
                              : Divider(
                            thickness: 1,
                            color: CupertinoColors.systemGrey3,
                            height: 16,
                          ),
                        ),

                        Container(
                          child: widget.dpm == 0
                              ? Container()
                              : Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("DPM ", style: blueFontStyle),
                              Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(widget.dpm),
                                  style: blueFontStyle)
                            ],
                          ),
                        ),
                        Container(
                          child: widget.dpm == 0
                              ? Container()
                              : Divider(
                            thickness: 1,
                            color: CupertinoColors.systemGrey3,
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
                                Text(
                                  NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                      .format(angsuranpertama +
                                      valangsuranspb +
                                      valangsuranspp +
                                      int.parse(widget.namaformulir) +
                                      widget.perpus +
                                      widget.kmhsmaba +
                                      widget.krs +
                                      widget.dpm),
                                  style: whiteFontStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                            Text(
                              NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                                  .format(int.parse(widget.namaformulir)),
                              style: blueFontStyle,
                            )
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
                            Text(
                              NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                                  .format(angsuranpertama +
                                  valangsuranspb +
                                  valangsuranspp +
                                  widget.perpus +
                                  widget.kmhsmaba +
                                  widget.krs +
                                  widget.dpm),
                              style: blueFontStyle,
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
                child: programperkuliahan == null ||
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
                                      varpendidikan: varpendidikan == null
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
                                      angkatan: widget.angkatan,
                                      tahunangkatan:
                                      widget.tahunangkatan,
                                      wilayah: widget.wilayah,
                                      namakonversi: widget.namakonversi == null
                                          ? ""
                                          : widget.namakonversi,
                                      kodejurusan:
                                      widget.kodejurusan,
                                      kodeprogram:
                                      widget.kodeprogram,
                                      namaJurusan:
                                      widget.namaJurusan,
                                      namalulusan:
                                      widget.namalulusan,
                                      namajaket:
                                      widget.namajaket,
                                      namaspb: widget.namaspb,
                                      namaspp: widget.namaspp,
                                      namaformulir:
                                      widget.namaformulir,
                                      programperkuliahan:
                                      programperkuliahan,
                                      namakelompok:
                                      widget.namakelompok,
                                      namakelaswaktu:
                                      namakelaswaktu,
                                      namakelassingkatan:
                                      namakelassingkatan,
                                      waktuspb: valwaktuspb.toString() == null
                                          ? ''
                                          : valwaktuspb
                                          .toString(),
                                      angsuranspb: valangsuranspb.toString() == null
                                          ? ''
                                          : valangsuranspb
                                          .toString(),
                                      waktuspp: valwaktuspp.toString() == null
                                          ? ''
                                          : valwaktuspb
                                          .toString(),
                                      angsuranspp: valangsuranspp.toString() == null
                                          ? ''
                                          : valangsuranspp
                                          .toString(),
                                      perpus: widget.perpus,
                                      kmhsmaba: widget.kmhsmaba,
                                      krs: widget.krs,
                                      dpm: widget.dpm,
                                      totalbiaya: angsuranpertama +
                                          valangsuranspb +
                                          valangsuranspp +
                                          int.parse(widget.namaformulir) +
                                          widget.perpus +
                                          widget.kmhsmaba))))
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
                                      angkatan: widget.angkatan,
                                      tahunangkatan: widget.tahunangkatan,
                                      wilayah: widget.wilayah,
                                      namakonversi: widget.namakonversi == null ? "" : widget.namakonversi,
                                      kodejurusan: widget.kodejurusan,
                                      kodeprogram: widget.kodeprogram,
                                      namaJurusan: widget.namaJurusan,
                                      namalulusan: widget.namalulusan,
                                      namajaket: widget.namajaket,
                                      namaspb: widget.namaspb,
                                      namaspp: widget.namaspp,
                                      namaformulir: widget.namaformulir,
                                      programperkuliahan: programperkuliahan,
                                      namakelompok: widget.namakelompok,
                                      namakelaswaktu: namakelaswaktu,
                                      namakelassingkatan: namakelassingkatan,
                                      waktuspb: valwaktuspb.toString() == null ? '' : valwaktuspb.toString(),
                                      angsuranspb: valangsuranspb.toString() == null ? '' : valangsuranspb.toString(),
                                      waktuspp: valwaktuspp.toString() == null ? '' : valwaktuspb.toString(),
                                      angsuranspp: valangsuranspp.toString() == null ? '' : valangsuranspp.toString(),
                                      perpus: widget.perpus,
                                      kmhsmaba: widget.kmhsmaba,
                                      krs: widget.krs,
                                      dpm: widget.dpm,
                                      totalbiaya: angsuranpertama + valangsuranspb + valangsuranspp + int.parse(widget.namaformulir) + widget.perpus + widget.kmhsmaba))));
                        },
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
