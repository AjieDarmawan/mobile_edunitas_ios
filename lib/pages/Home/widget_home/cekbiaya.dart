part of 'widget_home.dart';

class Cekbiaya extends StatefulWidget {
  final Photo campus;
  final String kodejurusan,
      angkatan,
      wilayah,
      tahunangkatan,
      kodeprogram,
      namaJurusan,
      namaKelompok,
      namalulusan,
      namajaket,
      namaformulir,
      bulanan;
  final int namaspb, namaspp, namakonversi, perpus, kmhsmaba, krs, dpm;

  Cekbiaya({
    this.campus,
    this.kodejurusan,
    this.angkatan,
    this.wilayah,
    this.namakonversi,
    this.tahunangkatan,
    this.kodeprogram,
    this.namaJurusan,
    this.namaKelompok,
    this.namajaket,
    this.namalulusan,
    this.namaspp,
    this.namaspb,
    this.namaformulir,
    this.bulanan,
    this.kmhsmaba,
    this.perpus,
    this.krs,
    this.dpm,
  });

  @override
  _CekbiayaState createState() => _CekbiayaState();
}

class _CekbiayaState extends State<Cekbiaya> {
  Angsur dataAngsur;
  var namaJurusan = '', namaKelompok = '', kodeprogram = '';

  var kodejurusan = '';

  int defaultvaktuspb = 0;

  // var listSPB = new List();
  // AngsuranSpbModel listSPB ;
  // List<string> listSpb2 =  listSPB.angsuranSpb;

  var dataSipema = new List();
  void getBiayaSipema2() {
    sipemaview_model()
        .getBiayaSipema(widget.campus.kode.toString())
        .then((value) {//handled
      setState(() {
        Map<String, Map<String, Sipema>> data = value;
        Sipema tempData1 = Sipema.fromJson(data.values.first);
        List<Map<String, Sipema>> list =
        data.entries.map((e) => e.value).toList();
        List<Iterable<Sipema>> finalList = list.map((e) => e.values).toList();
        final lastList =
        finalList.map((e) => e.map((e) => e).toList()).toList();
        List<List<Sipema>> dataSipema2 = lastList.map((e) => e).toList();
        dataSipema = dataSipema2;
        //List<Sipema> lastDataSipema = dataSipema[0];
        // Sipema datSipemaByIndex = lastDataSipema[0];

        //datSipemaByIndex.detail.kampus;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  //master spb
  List<AngsuranMasterModel> dataAngsurSpb = new List();
  void getBiayaSipemaAngsur() {
    sipemaview_model()
        .getBiayaSipemaAngsuranSPBMaster(
      widget.campus.kode.toString(),
      kodejurusan.length == 0
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      kodeprogram.length == 0
          ? widget.kodeprogram.toString()
          : kodeprogram.toString(),
      namaKelompok.length == 0
          ? widget.namaKelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value) {//handled
      setState(() {
        dataAngsurSpb = value;
        defaultvaktuspb = int.parse(dataAngsurSpb[0].angsuranSpb);
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  //angsuran spb
  List<AngsuranModel> dataAngsurSpbAngsur = new List();
  var valwaktuspb = '';
  void getBiayaSipemaAngsurSpb() {
    sipemaview_model()
        .getBiayaSipemaAngsuranSpb(
      widget.campus.kode.toString(),
      kodejurusan.length == 0
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      kodeprogram.length == 0
          ? widget.kodeprogram.toString()
          : kodeprogram.toString(),
      valwaktuspb.toString(),
      namaKelompok.length == 0
          ? widget.namaKelompok.toString()
          : namaKelompok.toString(),

    )
        .then((value1) {//handled
      setState(() {
        dataAngsurSpbAngsur = value1;
        biayaSpb = dataAngsurSpbAngsur[0].biayaAngsuran == 0
            ? 0
            : dataAngsurSpbAngsur[0].biayaAngsuran;
        angsuranpertama = biayaSpp +
            biayaSpb +
            //int.parse(biayapendaftaran) +
            int.parse(biayajaket);

        //print("wkwkwkwkk${valwaktuspb}");
        // print("wkwkwkwkk${valwaktuspb.toString() == "1"  ? 0 : dataAngsurSpbAngsur[1].biayaAngsuran }");

        var angsuranselanjutnyaspb = biayaSpb != 0
            ? valwaktuspb.toString() == "1"
            ? 0
            : dataAngsurSpbAngsur[1].biayaAngsuran
            : 0;

        var angsuranselanjutnyaspp = biayaSpp != 0
            ? valwaktuspp.toString() == "1"
            ? 0
            : dataAngsurSppAngsur[1].biayaAngsuran
            : 0;

        angsuranselanjutnya = angsuranselanjutnyaspb + angsuranselanjutnyaspp;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  //master spp
  List<AngsuranMasterModel> dataAngsurSpp = new List();
  void getBiayaSipemaAngsurSPP() {
    sipemaview_model()
        .getBiayaSipemaAngsuranSPPMaster(
      widget.campus.kode.toString(),
      kodejurusan.length == 0
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      kodeprogram.length == 0
          ? widget.kodeprogram.toString()
          : kodeprogram.toString(),
      namaKelompok.length == 0
          ? widget.namaKelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value) {//handled
      setState(() {
        dataAngsurSpp = value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  //ansuran spp
  List<AngsuranModel> dataAngsurSppAngsur = new List();
  var valwaktuspp = '';
  void angsurgetBiayaSipemaAngsurSpp() {
    sipemaview_model()
        .angsurangetBiayaSipemaSpp(
      widget.campus.kode.toString(),
      kodejurusan.length == 0
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      kodeprogram.length == 0
          ? widget.kodeprogram.toString()
          : kodeprogram.toString(),
      valwaktuspp.toString(),
      namaKelompok.length == 0
          ? widget.namaKelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value1) {//handled
      setState(() {
        dataAngsurSppAngsur = value1;
        biayaSpp = dataAngsurSppAngsur[0].biayaAngsuran == 0
            ? 0
            : dataAngsurSppAngsur[0].biayaAngsuran;
        angsuranpertama = biayaSpp +
            biayaSpb +
            int.parse(biayajaket);
        var angsuranselanjutnyaspb = biayaSpb != 0
            ? valwaktuspb.toString() == "1"
            ? 0
            : dataAngsurSpbAngsur[1].biayaAngsuran
            : 0;

        var angsuranselanjutnyaspp = biayaSpp != 0
            ? valwaktuspp.toString() == "1"
            ? 0
            : dataAngsurSppAngsur[1].biayaAngsuran
            : 0;

        angsuranselanjutnya = angsuranselanjutnyaspb + angsuranselanjutnyaspp;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var programstudi = "--Pilih Program Studi--";
  var programstudilulusan = '';
  String biayapendaftaran = '', biayajaket = '';
  int biayaSpp = 0, biayaSpb = 0, spb_spp = 1;
  int angsuranpertama = 0;
  int angsuranselanjutnya = 0;
  //Color _lightBlue = Color(0xFFBAE3FF);
  bool _loadingfSpp, _loadingfSpb;
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

  void getData() {
    getBiayaSipema2();

    //master
    getBiayaSipemaAngsur();
    getBiayaSipemaAngsurSPP();
    //ansguran
    getBiayaSipemaAngsurSpb();
    angsurgetBiayaSipemaAngsurSpp();

    setState(() {
      programstudi = widget.namaJurusan.toString();
      biayajaket = widget.namajaket.toString();
      programstudilulusan = widget.namalulusan.toString();
      biayaSpp = widget.namaspp;
      biayaSpb = widget.namaspb;
      biayapendaftaran = widget.namaformulir.toString();
      angsuranselanjutnya = int.parse(widget.bulanan);
      angsuranpertama = biayaSpp +
          biayaSpb +
          //int.parse(biayapendaftaran) +
          int.parse(biayajaket);
      _loadingfSpp = false;
      _loadingfSpb = false;
      if (biayaSpp == 0 || biayaSpb == 0) {
        spb_spp = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    conn();
  }

  @override
  Widget build(BuildContext context) {
    //  print("wwkwkwkwkwt${defaultvaktuspb}");
    //  print("wwkwkwkwkwt${valwaktuspb}");
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        // title: Text("jurusan${widget.kodejurusan}" +
        //     "program ${widget.kodeprogram}" +
        //     "kode ${widget.campus.kode} "),
        title: Text(
          "Cek Biaya",
          style: whiteFontStyle,
        ),
        backgroundColor: mainColor1,
      ),
      body: isConn == false
          ? Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SpinKitThreeBounce(
              color: mainColor1,
            ),
          ))
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10.0),
                color: CupertinoColors.systemGrey5,
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
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
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
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  width:
                                  MediaQuery.of(context).size.width /
                                      2,
                                  child: Text(
                                    programstudi,
                                    style: whiteFontStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // Text(programstudi),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Rincian Biaya Kuliah",
                style: blueFontStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: mainColor1,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Text(
                "Pilih Program Studi / Jurusan",
                style: blackFontStyle3.copyWith(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  bottomModal(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.blueGrey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          programstudi,
                          style: blackFontStyle3.copyWith(fontSize: 14),
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

            //biru
            SizedBox(
              height: 16,
            ),

            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.blue[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Rincian Pembayaran Pertama",
                      style: blueFontStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor1, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Biaya Kuliah Untuk Lulusan",
                            style: blackFontStyle3.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            programstudilulusan,
                            style: blackFontStyle3.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Program Studi :",
                            style: blackFontStyle3.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            programstudi,
                            style: blackFontStyle3.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor1, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pendaftaran",
                          style: blackFontStyle3.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          NumberFormat.currency(
                              symbol: 'IDR ',
                              decimalDigits: 0,
                              locale: 'id-ID')
                              .format(int.parse(biayapendaftaran)),
                          style: blackFontStyle3.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor1, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nama Biaya",
                            style: blueFontStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Jumlah",
                            style: blueFontStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Divider(
                        height: 20,
                        thickness: 2,
                        color: mainColor1,
                      ),
                      Container(
                        child: Column(
                          children: [
                            biayajaket != '0'
                                ? Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text("Jaket",
                                          style: blackFontStyle3),
                                      Text(
                                          NumberFormat.currency(
                                              symbol: 'IDR ',
                                              decimalDigits: 0,
                                              locale: 'id-ID')
                                              .format(double.parse(
                                              biayajaket)),
                                          style: blackFontStyle3),
                                    ]),
                                Divider(
                                  color:
                                  CupertinoColors.systemGrey3,
                                  thickness: 1,
                                ),
                              ],
                            )
                                : Container(),
                            biayaSpb != 0
                                ? Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text("SPb ke-1",
                                        style: blackFontStyle3),
                                    Text(
                                        NumberFormat.currency(
                                            symbol: 'IDR ',
                                            decimalDigits: 0,
                                            locale: 'id-ID')
                                            .format(biayaSpb),
                                        style: blackFontStyle3),
                                  ],
                                ),
                                Text(
                                  "Sumbangan Pengembangan",
                                  style: blueFontStyle.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  color:
                                  CupertinoColors.systemGrey3,
                                  thickness: 1,
                                ),
                              ],
                            )
                                : Container(),
                            biayaSpp != 0
                                ? Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "SPP ke-1",
                                      style: blackFontStyle3,
                                    ),
                                    Text(
                                        NumberFormat.currency(
                                            symbol: 'IDR ',
                                            decimalDigits: 0,
                                            locale: 'id-ID')
                                            .format(biayaSpp),
                                        style: blackFontStyle3)
                                  ],
                                ),
                                Text(
                                  "Sumbangan Pendidikan Persemester",
                                  style: blueFontStyle.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  color:
                                  CupertinoColors.systemGrey3,
                                  thickness: 1,
                                ),
                              ],
                            )
                                : Container(),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Angsuran Pertama",
                                    style: blackFontStyle3.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                        .format(angsuranpertama),
                                    style: blackFontStyle3.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor1, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Angsuran Selanjutnya",
                          style: blackFontStyle3.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          NumberFormat.currency(
                              symbol: 'IDR ',
                              decimalDigits: 0,
                              locale: 'id-ID')
                              .format(double.parse(
                              angsuranselanjutnya.toString())),
                          style: blackFontStyle3.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(7.0),
                  //   ),
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Angsuran Selanjutnya"),
                  //       Text("Rp.100.000")
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),

            // Container(
            //   alignment: Alignment.centerLeft,
            //   color: Color(0xFFFFCE00),
            //   height: 50,
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: Text(
            //     programstudi,
            //     style: _styleText(2),
            //   ),
            // ),

            //Tabel Spb
            biayaSpb != 0
                ? Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: mainColor1, width: 0.5),
                  bottom: BorderSide(color: mainColor1, width: 0.5),
                ),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spb_spp != 0
                          ? "Tabel Angsuran SPb"
                          : "Tabel Angsuran Biaya Kuliah",
                      textAlign: TextAlign.start,
                      style: blueFontStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Biaya SPb bisa diangsur ${valwaktuspb=='' ?  defaultvaktuspb : valwaktuspb }x atau bulanan",
                      style: blackFontStyle3.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                children: [
                  Container(
                    color: CupertinoColors.systemGrey6,
                    child: Column(
                      children: [
                        Container(
                          //child: _loadingSpp("spb",dataAngsurSpb.length)
                          child: dataAngsurSpb.length == 0
                              ? Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    mainColor1),
                              ))
                              : Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8),
                            child:
                            dataAngsurSpb[0]
                                .angsuranSpb ==
                                "0"
                                ? Center(
                                child: Container(
                                  padding: EdgeInsets
                                      .symmetric(
                                      vertical: 8),
                                  child: Text(
                                      "Tidak Ada Biaya SPb",
                                      style:
                                      blackFontStyle2),
                                ))
                                : Container(
                              child: SizedBox(
                                height: 56,
                                width:
                                MediaQuery.of(
                                    context)
                                    .size
                                    .width,
                                child: ListView
                                    .builder(
                                    itemCount:
                                    1,
                                    scrollDirection:
                                    Axis
                                        .horizontal,
                                    itemBuilder:
                                        (context,
                                        index) {
                                      return Container(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                        child:
                                        CustomRadioButton(
                                          width:
                                          100,
                                          enableShape:
                                          true,
                                          elevation:
                                          1,
                                          padding:
                                          0,
                                          spacing:
                                          0.0,
                                          autoWidth:
                                          false,
                                          enableButtonWrap:
                                          true,
                                          wrapAlignment:
                                          WrapAlignment.start,
                                          horizontal:
                                          false,
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
                                          dataAngsurSpb.map((item) {
                                            return item.angsuranSpb +
                                                " X";
                                          }).toList(),
                                          buttonValues:
                                          dataAngsurSpb.map((item) {
                                            return item.angsuranSpb;
                                          }).toList(),
                                          defaultSelected:
                                          dataAngsurSpb[0].angsuranSpb,
                                          radioButtonValue:
                                              (value) {
                                            setState(() {
                                              _loadingfSpb = true;
                                              //valwaktuspb = value;
                                              //getBiayaSipemaAngsurSpb();
                                              _loadingProcess("spb", value);
                                            });
                                            // print(
                                            //     "SPB nilai ${valwaktuspb}");
                                          },
                                          buttonTextStyle:
                                          ButtonTextStyle(
                                            selectedColor:
                                            Colors.white,
                                            unSelectedColor:
                                            mainColor1,
                                            textStyle:
                                            blackFontStyle3.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          selectedColor:
                                          mainColor1,
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: mainColor1, width: 2),
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Cicilan",
                                          style: blueFontStyle
                                              .copyWith(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        Text(
                                          "Biaya",
                                          style: blueFontStyle
                                              .copyWith(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 2,
                                      color: mainColor1,
                                    ),
                                    Container(
                                      child: dataAngsurSpbAngsur
                                          .length ==
                                          0
                                          ? Center(
                                          child:
                                          CircularProgressIndicator(
                                            valueColor:
                                            AlwaysStoppedAnimation<
                                                Color>(
                                                mainColor1),
                                          ))
                                          :
                                      /*Container(
                                    child: dataAngsurSpbAngsur[0].waktuAngsuran ==
                                            "1000"
                                        ? Text("")
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          //physics: NeverScrollableScrollPhysics(),
                                          itemCount: dataAngsurSpbAngsur.length == 0
                                              ? 0
                                              : dataAngsurSpbAngsur.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return InkWell(
                                              onTap: () {},
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // decoration: BoxDecoration(
                                                      //   color: Colors.white,
                                                      //   borderRadius: BorderRadius.circular(7.0),
                                                      // ),
                                                        color: Colors.white,
                                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                        child: Column(
                                                          children: [
                                                            // Row(
                                                            //   mainAxisAlignment:
                                                            //       MainAxisAlignment.spaceBetween,
                                                            //   children: [
                                                            //     Text("Cicilan"),
                                                            //     Text("IDR")
                                                            //   ],
                                                            // ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                Text("${dataAngsurSpbAngsur[index].waktuAngsuran.toString()} x", style: _styleText(3),),
                                                                Text(NumberFormat.currency(
                                                                    symbol: 'IDR ',
                                                                    decimalDigits: 1,
                                                                    locale: 'id-ID')
                                                                    .format(double.parse(dataAngsurSpbAngsur[index].biayaAngsuran.toString())), style: _styleText(3)),
                                                              ],
                                                            ),
                                                            Divider(thickness: 1, color: CupertinoColors.systemGrey5, height: 5,)
                                                          ],
                                                        )
                                                    ),
                                                    //Divider(color: Colors.white10,),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    )
                                  ),*/
                                      _loadingSpb("spb",
                                          dataAngsurSpb.length),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                : Container(),

            //Tabel Spp
            biayaSpp != 0
                ? Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: mainColor1, width: 0.5),
                ),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spb_spp != 0
                          ? "Tabel Angsuran SPP"
                          : "Tabel Angsuran Biaya Kuliah",
                      textAlign: TextAlign.start,
                      style: blueFontStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Biaya SPP bisa diangsur  ${valwaktuspp=='' ?  6 : valwaktuspp}x atau bulanan",
                      style: blackFontStyle3.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                children: [
                  Container(
                    color: CupertinoColors.systemGrey6,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: dataAngsurSpp.length == 0
                              ? Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    mainColor1),
                              ))
                              : Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8),
                            child:
                            dataAngsurSpp[0]
                                .angsuranSpb ==
                                "0"
                                ? Center(
                                child: Container(
                                  padding: EdgeInsets
                                      .symmetric(
                                      vertical: 8),
                                  child: Text(
                                      "Tidak Ada Biaya SPP",
                                      style:
                                      blackFontStyle2),
                                ))
                                : SizedBox(
                              height: 56,
                              width: MediaQuery.of(
                                  context)
                                  .size
                                  .width,
                              child:
                              ListView.builder(
                                  itemCount: 1,
                                  scrollDirection:
                                  Axis
                                      .horizontal,
                                  itemBuilder:
                                      (context,
                                      index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                          16),
                                      child:
                                      CustomRadioButton(
                                        width:
                                        100,
                                        enableShape:
                                        true,
                                        elevation:
                                        1,
                                        padding:
                                        0,
                                        spacing:
                                        0.0,
                                        autoWidth:
                                        false,
                                        enableButtonWrap:
                                        true,
                                        wrapAlignment:
                                        WrapAlignment.start,
                                        horizontal:
                                        false,
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
                                        dataAngsurSpp.map((item) {
                                          return item.angsuranSpb +
                                              " X";
                                        }).toList(),
                                        buttonValues:
                                        dataAngsurSpp.map((item) {
                                          return item
                                              .angsuranSpb;
                                        }).toList(),
                                        defaultSelected:
                                        dataAngsurSpp[0].angsuranSpb,
                                        radioButtonValue:
                                            (value) {
                                          setState(
                                                  () {
                                                _loadingfSpp =
                                                true;
                                                /*valwaktuspp = value;
                                    angsurgetBiayaSipemaAngsurSpp();*/
                                                _loadingProcess("spp",
                                                    value);
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
                                          blackFontStyle3.copyWith(
                                            fontSize:
                                            12,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                        selectedColor:
                                        mainColor1,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: mainColor1, width: 2),
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Cicilan",
                                      style: blueFontStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    Text(
                                      "Biaya",
                                      style: blueFontStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 2,
                                  color: mainColor1,
                                ),
                                Container(
                                  //child: Text("asa")
                                  child: dataAngsurSppAngsur
                                      .length ==
                                      0
                                      ? Center(
                                      child:
                                      CircularProgressIndicator(
                                        valueColor:
                                        AlwaysStoppedAnimation<
                                            Color>(
                                            mainColor1),
                                      ))
                                      : _loadingSpp(
                                      "spp",
                                      dataAngsurSppAngsur
                                          .length),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                : Container(),

            SizedBox(height: 64)
          ],
        ),
      ),
      bottomSheet: Container(
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
        child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 40,
              child: EduButton(
                buttonText: "Daftar",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Daftar_kuliah(
                            campus: widget.campus,
                            kodejurusan: widget.kodejurusan,
                            kodeprogram: widget.kodeprogram,
                            namaJurusan: widget.namaJurusan,
                            namalulusan: widget.namalulusan,
                            namakelompok: namaKelompok.length == 0
                                ? widget.namaKelompok.toString()
                                : namaKelompok.toString(),
                            namajaket: widget.namajaket,
                            namaspb: widget.namaspb,
                            namaspp: widget.namaspp,
                            namaformulir: widget.namaformulir,
                            angkatan:
                            widget.angkatan == null ? "" : widget.angkatan,
                            tahunangkatan: widget.tahunangkatan == null
                                ? ""
                                : widget.tahunangkatan,
                            wilayah:
                            widget.wilayah == null ? "" : widget.wilayah,
                            namakonversi: widget.namakonversi == null
                                ? ""
                                : widget.namakonversi,
                            kmhsmaba:
                            widget.kmhsmaba == null ? "" : widget.kmhsmaba,
                            perpus:
                            widget.perpus == null ? "" : widget.perpus,
                            krs: widget.krs == null ? "" : widget.krs,
                            dpm: widget.dpm == null ? "" : widget.dpm,
                          ))));
                },
              ),
            )),
      ),
    );
  }

  Widget _loadingSpp(var cat, var dataLength) {
    return cat == 0 || _loadingfSpp
    //return _loadingfSpp
        ? Container(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[350],
        highlightColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350]),
            ),
          ],
        ),
      ),
    )
        : Container(
      child: dataAngsurSppAngsur[0].waktuAngsuran == "0"
          ? Center(child: Text(""))
          : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataAngsurSppAngsur.length == 0
            ? 0
            : dataAngsurSppAngsur.length,
        itemBuilder: (BuildContext context, int index) {
          print('spp itu sebenarnya apa? ${dataAngsurSppAngsur[index]
              .biayaAngsuran
              .toString()}');
          return Container(
            //padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(7.0),
                  // ),
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "${dataAngsurSppAngsur[index].waktuAngsuran.toString()} x",
                                style: blackFontStyle3.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                                  .format(double.parse(
                                  dataAngsurSppAngsur[index]
                                      .biayaAngsuran
                                      .toString())),
                              style: blackFontStyle3.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: CupertinoColors.systemGrey5,
                        ),
                      ],
                    )),
                //Divider(color: Colors.white10,),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _loadingSpb(var cat, var dataLength) {
    return cat == 0 || _loadingfSpb
    //return _loadingfSpp
        ? Container(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[350],
        highlightColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350]),
            ),
          ],
        ),
      ),
    )
        : Container(
      child: dataAngsurSpbAngsur[0].waktuAngsuran == "0"
          ? Text("")
          : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataAngsurSpbAngsur.length == 0
            ? 0
            : dataAngsurSpbAngsur.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(7.0),
                  // ),
                    color: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text("Cicilan"),
                        //     Text("IDR")
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "${dataAngsurSpbAngsur[index].waktuAngsuran.toString()}",
                                style: blackFontStyle3.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                                  .format(dataAngsurSpbAngsur[index]
                                  .biayaAngsuran),
                              style: blackFontStyle3.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(
                          color: CupertinoColors.systemGrey3,
                          thickness: 1,
                        ),
                      ],
                    )),
                //Divider(color: Colors.white10,),
              ],
            ),
          );
        },
      ),
    );
  }

  void _loadingProcess(var cat, var value) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        print("ehini: $cat");
        if (cat == "spp") {
          valwaktuspp = value;
          print("waktu ${valwaktuspp}");
          angsurgetBiayaSipemaAngsurSpp();
          _loadingfSpp = false;
        } else if (cat == "spb") {
          valwaktuspb = value;
          print("waktu ${valwaktuspb}");
          getBiayaSipemaAngsurSpb();
          _loadingfSpb = false;
        }
      });
    });
  }

  Future bottomModal(BuildContext context) {
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
                    child: dataSipema.length == 0
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                      itemCount: dataSipema.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<Sipema> lastDataSipema = dataSipema[index];
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: lastDataSipema.length,
                          itemBuilder: (BuildContext context, int index) {
                            Sipema datSipemaByIndex =
                            lastDataSipema[index];

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  //                      widget.campus.kode.toString(),
                                  // widget.kodejurusan.toString()==null ? "a" : "a",
                                  // widget.kodeprogram.toString(),
                                  // widget.namaKelompok.toString())
                                  kodejurusan =
                                      datSipemaByIndex.detail.kodejrs;
                                  kodeprogram =
                                      datSipemaByIndex.detail.kodeprg;

                                  namaKelompok =
                                      datSipemaByIndex.detail.kelompok;

                                  dataAngsur = datSipemaByIndex.angsur;
                                  biayapendaftaran =
                                      datSipemaByIndex.itembayar.formulir;
                                  biayajaket =
                                      datSipemaByIndex.itembayar.jaket;
                                  biayaSpp =
                                      datSipemaByIndex.itembayar.spp;
                                  biayaSpb =
                                      datSipemaByIndex.itembayar.spb;
                                  programstudi =
                                      datSipemaByIndex.detail.jurusan;
                                  programstudilulusan =
                                      datSipemaByIndex.detail.lulusan;

                                  angsuranpertama = biayaSpp +
                                      biayaSpb +
                                      //int.parse(biayapendaftaran) +
                                      int.parse(biayajaket);

                                  if (biayaSpp == 0 || biayaSpb == 0) {
                                    spb_spp = 0;
                                  } else {
                                    spb_spp = 1;
                                  }
                                  // print("spb_spp1${spb_spp}");
                                  // print("spb_spp2${biayaSpp}");
                                  // print("spb_spp3${biayaSpb}");

                                  // getBiayaSipemaAngsur();

                                  //master
                                  getBiayaSipemaAngsur();
                                  getBiayaSipemaAngsurSPP();
                                  //ansguran
                                  getBiayaSipemaAngsurSpb();
                                  angsurgetBiayaSipemaAngsurSpp();

                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 24, top: 15),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                            child: Text(
                                                "${datSipemaByIndex.detail.jurusan}",
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow.clip,
                                                style: whiteFontStyle
                                                    .copyWith(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold))),
                                        Flexible(
                                          child: Text(
                                              "${datSipemaByIndex.detail.lulusan}",
                                              overflow: TextOverflow.clip,
                                              style:
                                              whiteFontStyle.copyWith(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                        NumberFormat.currency(
                                            symbol: 'Rp. ',
                                            decimalDigits: 0,
                                            locale: 'id-ID')
                                            .format(double.parse(
                                            datSipemaByIndex
                                                .detail.bulanan)),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.clip,
                                        style: orenFontStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFFCE00))),
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
}
