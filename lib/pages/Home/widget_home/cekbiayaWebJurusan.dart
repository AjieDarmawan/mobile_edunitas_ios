part of 'widget_home.dart';

class CekbiayaWebJurusan extends StatefulWidget {
  final Photo campus;
  final String kodejurusan, namaJurusan, jenjang;
  // final int namaspb, namaspp, namakonversi, perpus, kmhsmaba, krs, dpm;

  CekbiayaWebJurusan({
    this.campus,
    //this.kodeprogram,
    this.kodejurusan,
    this.namaJurusan,
    this.jenjang,
    //this.namaKelompok,
  });

  @override
  _CekbiayaWebJurusanState createState() => _CekbiayaWebJurusanState();
}

class _CekbiayaWebJurusanState extends State<CekbiayaWebJurusan> {
  Angsur dataAngsur;
  var kodeprogram = '';
  int index2 = 0;
  var likeButtonColor = Color(0xff333030);

  var kodejurusan = '';

  var _loading = false;

  int defaultvaktuspb = 0;

  var namaJurusan = '',
      namaKelompok = '',
      namaformulir = '',
      bulanan = '',
      angkatan,
      tahunangkatan,
      wilayah;
  var hargaJurusan = '';
  var kodejrs = '';
  var kodeprg = '';
  var hereg = 0;
  var perpus = 0;
  var kmhsmaba = 0;
  var krs = 0;
  var dpm = 0;

  var namalulusan = '', namajaket = '';
  int namaspb = 0, namaspp = 0, namakonversi;

  var dataSipema = new List();
  void getBiayaSipema2() {
    sipemaview_model()
        .getBiayaSipema(widget.campus.kode.toString())
        .then((value) {
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
        List<Sipema> lastDataSipema = dataSipema[0];
        Sipema datSipemaByIndex = lastDataSipema[0];

        // namaJurusan = datSipemaByIndex.detail.jurusan;
        // //hargaJurusan = (int.parse(datSipemaByIndex.itembayar.jaket.toString())+int.parse(datSipemaByIndex.itembayar.spp.toString())+int.parse(datSipemaByIndex.itembayar.spb.toString())+int.parse(datSipemaByIndex.itembayar.formulir.toString())).toString();
        // hargaJurusan = datSipemaByIndex.detail.bulanan;
        // kodejrs = datSipemaByIndex.detail.kodejrs;
        // kodeprg = datSipemaByIndex.detail.kodeprg;
        // namalulusan = datSipemaByIndex.detail.lulusan;
        // namajaket = datSipemaByIndex.itembayar.jaket;
        // namaformulir = datSipemaByIndex.itembayar.formulir;
        // namaspb = datSipemaByIndex.itembayar.spb;
        // namaspp = datSipemaByIndex.itembayar.spp;
        // namaKelompok = datSipemaByIndex.detail.kelompok;
        // bulanan = datSipemaByIndex.detail.bulanan;
        // angkatan = datSipemaByIndex.detail.angkatan;
        // tahunangkatan = datSipemaByIndex.detail.tahun;
        // wilayah = datSipemaByIndex.detail.wilayah;
        // hereg = datSipemaByIndex.detail.hereg;
        // perpus = datSipemaByIndex.itembayar.perpus;
        // kmhsmaba = datSipemaByIndex.itembayar.kmhsmaba;

        // krs = datSipemaByIndex.itembayar.krs;
        // dpm = datSipemaByIndex.itembayar.dpm;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  ///kelompok where
  List<ListDetailJurusanPengelompok> datasipemaKelompok = new List();
  var first_program, first_angkatan, first_tahun, first_wilayah,
      first_jurusan, first_namajaket, first_namaspp, first_namaspb,
      first_formulir, first_bulanan, first_kodeprogram,
      first_kelompok, first_lulusan;
  void getSipemaWhereKelompok(kode_kampus, kode_jurusan, kodeprogram) {
    KarirViewModel()
        .biayasipema_baru_kelompok(kode_kampus.toString(),
        kode_jurusan.toString(), kodeprogram.toString())
        .then((value) {
      setState(() {
        datasipemaKelompok = value;

        first_program = datasipemaKelompok[0].program;
        first_angkatan = datasipemaKelompok[0].angkatan;
        first_tahun = datasipemaKelompok[0].tahun;
        first_wilayah = datasipemaKelompok[0].wilayah;
        first_jurusan = datasipemaKelompok[0].jurusan;
        first_lulusan = datasipemaKelompok[0].lulusan;
        first_bulanan = datasipemaKelompok[0].bulanan;
        first_namajaket = datasipemaKelompok[0].jaket;
        first_namaspp = datasipemaKelompok[0].spp;
        first_namaspb = datasipemaKelompok[0].spb;
        first_formulir = datasipemaKelompok[0].formulir;
        first_kodeprogram = datasipemaKelompok[0].kodeprg;
        first_kelompok = datasipemaKelompok[0].kelompok;

        text_kelompoklulusan = first_lulusan.toString();

        biayajaket = first_namajaket.toString();
        programstudilulusan = first_lulusan.toString();
        biayaSpp = first_namaspp;
        biayaSpb = first_namaspb;
        biayapendaftaran = first_formulir.toString();

        angsuranselanjutnya = int.parse(first_bulanan);

        angsuranpertama = biayaSpp + biayaSpb +
            int.parse(biayajaket);

        _loadingfSpp = false;
        _loadingfSpb = false;
        if (biayaSpp == 0 || biayaSpb == 0) {
          spb_spp = 0;
        }

        //master
        getBiayaSipemaAngsuranSPBMaster();
        getBiayaSipemaAngsuranSPPMaster();
        //ansguran
        getBiayaSipemaAngsurSpb();
        getBiayaSipemaAngsurSpp();
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  // kelompok program
  List<MasterJurusanModel> datasipemaprogram = [];
  var sipema_program_nama, sipema_program_kode;
  void getSipemaWhereprogram(kode_kampus, kode_jurusan) {
    KarirViewModel()
        .biayasipema_baru_program(
        kode_kampus.toString(), kode_jurusan.toString())
        .then((value) {
      setState(() {
        datasipemaprogram = value;

        sipema_program_nama = datasipemaprogram[0].nama;
        sipema_program_kode = datasipemaprogram[0].kode;
        text_programperkuliahan = datasipemaprogram[0].nama;

        getSipemaWhereKelompok(widget.campus.kode.toString(),
            widget.kodejurusan.toString(), sipema_program_kode.toString());
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var labelnamaweb = '', kodeweb = '', jenjangweb;
  var dataWebJurusan = [];
  void getWebJurusan() {
    sipemaview_model().getBiayaSipema_web(widget.campus.kode,widget.campus.webacid).then((value) {
      setState(() {
        dataWebJurusan = value;
       
         labelnamaweb = widget.namaJurusan;
       // labelnamaweb = dataWebJurusan[0].label;
        // kodeweb = dataWebJurusan[0].kode;
        kodeweb = widget.kodejurusan;
        jenjangweb = dataWebJurusan[0].jenjang;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  ///master spb
  List<AngsuranMasterModel> dataAngsurSpb = [];
  void getBiayaSipemaAngsuranSPBMaster() {
    setState(() {
      dataAngsurSpb = [];
    });
    sipemaview_model()
        .getBiayaSipemaAngsuranSPBMaster(
      widget.campus.kode.toString(),
      kodejurusan == ''
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      kodeprogram == ''
          ? first_kodeprogram.toString()
          : kodeprogram.toString(),
      namaKelompok == ''
          ? first_kelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value) {
      setState(() {
        dataAngsurSpb = value;
        defaultvaktuspb = int.parse(dataAngsurSpb[0].angsuranSpb);
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  ///master spp
  List<AngsuranMasterModel> dataAngsurSpp = [];
  void getBiayaSipemaAngsuranSPPMaster() {
    setState(() {
      dataAngsurSpp = [];
    });
    sipemaview_model()
        .getBiayaSipemaAngsuranSPPMaster(
      widget.campus.kode.toString(),
      kodejurusan == ''
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      kodeprogram == ''
          ? first_kodeprogram.toString()
          : kodeprogram.toString(),
      namaKelompok == ''
          ? first_kelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value) {
      setState(() {
        dataAngsurSpp = value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  ///angsuran spb
  List<AngsuranModel> dataSpbAngsur = [];
  var valwaktuspb = '';
  void getBiayaSipemaAngsurSpb() {
    setState(() {
      dataSpbAngsur = [];
    });
    sipemaview_model()
        .getBiayaSipemaAngsuranSpb(
      widget.campus.kode.toString(),
      kodejurusan == ''
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      // kodeprogram.length == 0 ? "P2K" : "P2K",
      kodeprogram == ''
          ? first_kodeprogram.toString()
          : kodeprogram.toString(),
      valwaktuspb.toString(),
      //namaKelompok.length == 0 ? "AMD" : "AMD",
      namaKelompok == ''
          ? first_kelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value1) {
      setState(() {
        dataSpbAngsur = value1;
        biayaSpb = dataSpbAngsur[0].biayaAngsuran == 0
            ? 0
            : dataSpbAngsur[0].biayaAngsuran;
        angsuranpertama = biayaSpp +
            biayaSpb +
            //int.parse(biayapendaftaran) +
            int.parse(biayajaket);
        var angsuranselanjutnyaspb = biayaSpb != 0
            ? valwaktuspb.toString() == "1"
            ? 0
            : dataSpbAngsur[1].biayaAngsuran
            : 0;

        var angsuranselanjutnyaspp = biayaSpp != 0
            ? valwaktuspp.toString() == "1"
            ? 0
            : dataSppAngsur[1].biayaAngsuran
            : 0;

        angsuranselanjutnya = angsuranselanjutnyaspb + angsuranselanjutnyaspp;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  ///angsuran spp
  List<AngsuranModel> dataSppAngsur = [];
  var valwaktuspp = '';
  void getBiayaSipemaAngsurSpp() {
    setState(() {
      dataSppAngsur = [];
    });
    sipemaview_model()
        .angsurangetBiayaSipemaSpp(
      widget.campus.kode.toString(),
      kodejurusan == ''
          ? widget.kodejurusan.toString()
          : kodejurusan.toString(),
      kodeprogram == ''
          ? first_kodeprogram.toString()
          : kodeprogram.toString(),
      valwaktuspp.toString(),
      namaKelompok == ''
          ? first_kelompok.toString()
          : namaKelompok.toString(),
    )
        .then((value1) {
      setState(() {
        dataSppAngsur = value1;
        biayaSpp = dataSppAngsur[0].biayaAngsuran == 0
            ? 0
            : dataSppAngsur[0].biayaAngsuran;

        // angsuranpertama = 0;
        angsuranpertama = biayaSpp +
            biayaSpb +
            //int.parse(biayapendaftaran) +
            int.parse(biayajaket);
        var angsuranselanjutnyaspb = biayaSpb != 0
            ? valwaktuspb.toString() == "1"
            ? 0
            : dataSpbAngsur[1].biayaAngsuran
            : 0;

        var angsuranselanjutnyaspp = biayaSpp != 0
            ? valwaktuspp.toString() == "1"
            ? 0
            : dataSppAngsur[1].biayaAngsuran
            : 0;

        angsuranselanjutnya = angsuranselanjutnyaspb + angsuranselanjutnyaspp;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var text_programstudi = "--Pilih Program Studi--";
  var text_kelompoklulusan = "Loading...";
  var text_programperkuliahan = "Loading...";

  var programstudilulusan = '';
  String biayapendaftaran = '', biayajaket = '';
  int biayaSpp = 0, biayaSpb = 0, spb_spp = 1;
  int angsuranpertama = 0;
  int angsuranselanjutnya = 0;
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
    getWebJurusan();
    getSipemaWhereprogram(
        widget.campus.kode.toString(), widget.kodejurusan.toString());
    getSipemaWhereKelompok(widget.campus.kode.toString(),
        widget.kodejurusan.toString(), sipema_program_kode.toString());

    setState(() {
      text_programstudi = widget.namaJurusan.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    conn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text("Cek Biaya", style: whiteFontStyle,
        ),
        backgroundColor: mainColor1,
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
                          builder: (context) => (Daftar_kuliahWebJurusan(
                            campus: widget.campus == null ? "" : widget.campus,
                            kodejurusan:
                            kodeweb == null ? "" : kodeweb.toString(),
                            jenjang:
                            jenjangweb == null ? "" : jenjangweb.toString(),
                            namaJurusan: labelnamaweb == null
                                ? ""
                                : labelnamaweb.toString(),
                          ))));
                },
              ),
            )),
      ),
      body: isConn == false || _loading == true
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
                                ),
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.5,
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
                                    text_programstudi,
                                    style: whiteFontStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
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
                  bottomModalProgramStudi(context);
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
                          text_programstudi,
                          style: blackFontStyle3.copyWith(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
              padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Text(
                "Pilih Program Perkuliahan",
                style: blackFontStyle3.copyWith(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  bottomModalProgramPerkuliahan(context);
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
                          text_programperkuliahan,
                          style: blackFontStyle3.copyWith(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
              padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Text(
                "Pilih Kelompok Lulusan",
                style: blackFontStyle3.copyWith(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  bottomModalKelompokLulusan(context);
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
                          text_kelompoklulusan,
                          style: blackFontStyle3.copyWith(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
                        programstudilulusan == ""
                            ? Container(
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[350],
                            highlightColor: Colors.white,
                            child: Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  color: Colors.grey[350]),
                            ),
                          ),
                        )
                            : Container(
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
                            text_programstudi,
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
                        Container(
                          child: biayapendaftaran == ""
                              ? Container(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[350],
                              highlightColor: Colors.white,
                              child: Container(
                                height: 30,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color: Colors.grey[350]),
                              ),
                            ),
                          )
                              : Text(
                            //"biayapendaftaran",
                            NumberFormat.currency(
                                symbol: 'IDR ',
                                decimalDigits: 0,
                                locale: 'id-ID')
                                .format(
                                int.parse(biayapendaftaran)),
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
                                      Container(
                                        child: biayajaket == ""
                                            ? Container(
                                          child: Shimmer
                                              .fromColors(
                                            baseColor: Colors
                                                .grey[350],
                                            highlightColor:
                                            Colors.white,
                                            child: Container(
                                              height: 24,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  color: Colors
                                                      .grey[
                                                  350]),
                                            ),
                                          ),
                                        )
                                            : Text(
                                          //"biayajaket",
                                            NumberFormat.currency(
                                                symbol:
                                                'IDR ',
                                                decimalDigits:
                                                0,
                                                locale:
                                                'id-ID')
                                                .format(double
                                                .parse(
                                                biayajaket)),
                                            style:
                                            blackFontStyle3),
                                      ),
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
                                    Container(
                                      child: biayaSpb == 0
                                          ? Container(
                                        child: Shimmer
                                            .fromColors(
                                          baseColor: Colors
                                              .grey[350],
                                          highlightColor:
                                          Colors.white,
                                          child: Container(
                                            height: 24,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10),
                                                color: Colors
                                                    .grey[
                                                350]),
                                          ),
                                        ),
                                      )
                                          : Text(
                                        //"biayapendaftaran",
                                          NumberFormat.currency(
                                              symbol:
                                              'IDR ',
                                              decimalDigits:
                                              0,
                                              locale:
                                              'id-ID')
                                              .format(biayaSpb),
                                          style:
                                          blackFontStyle3),
                                    ),
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
                                    Container(
                                      child: biayaSpp == ""
                                          ? Container(
                                        child: Shimmer
                                            .fromColors(
                                          baseColor: Colors
                                              .grey[350],
                                          highlightColor:
                                          Colors.white,
                                          child: Container(
                                            height: 24,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10),
                                                color: Colors
                                                    .grey[
                                                350]),
                                          ),
                                        ),
                                      )
                                          : Text(
                                        //"biayapendaftaran",
                                          NumberFormat.currency(
                                              symbol:
                                              'IDR ',
                                              decimalDigits:
                                              0,
                                              locale:
                                              'id-ID')
                                              .format(biayaSpp),
                                          style:
                                          blackFontStyle3),
                                    ),
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
                                  Container(
                                    child: angsuranpertama == 0
                                        ? Container(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[350],
                                        highlightColor:
                                        Colors.white,
                                        child: Container(
                                          height: 24,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(10),
                                              color:
                                              Colors.grey[350]),
                                        ),
                                      ),
                                    )
                                        : Text(
                                      //"angsuranpertama",
                                      NumberFormat.currency(
                                          symbol: 'IDR ',
                                          decimalDigits: 0,
                                          locale: 'id-ID')
                                          .format(angsuranpertama),
                                      style:
                                      blackFontStyle3.copyWith(
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
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
                        Container(
                          child: angsuranselanjutnya == 0
                              ? Container(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[350],
                              highlightColor: Colors.white,
                              child: Container(
                                height: 30,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color: Colors.grey[350]),
                              ),
                            ),
                          )
                              : Text(
                            //"angsuranpertama",
                            NumberFormat.currency(
                                symbol: 'IDR ',
                                decimalDigits: 0,
                                locale: 'id-ID')
                                .format(double.parse(
                                angsuranselanjutnya
                                    .toString())),
                            style: blackFontStyle3.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
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
                      "Biaya SPb bisa diangsur ${valwaktuspb == '' ? defaultvaktuspb : valwaktuspb}x atau bulanan",
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
                              ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[350],
                              highlightColor: Colors.white,
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(
                                        10),
                                    color: Colors.grey[350]),
                              ),
                            ),
                          )
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
                                              _loadingProcess("spb", value);
                                            });
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
                                      child: dataSpbAngsur
                                          .length ==
                                          0
                                          ? Container(
                                        child: Shimmer
                                            .fromColors(
                                          baseColor: Colors
                                              .grey[350],
                                          highlightColor:
                                          Colors.white,
                                          child: Container(
                                            height: 30,
                                            width:
                                            MediaQuery.of(
                                                context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10),
                                                color: Colors
                                                    .grey[
                                                350]),
                                          ),
                                        ),
                                      )
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
                                      _loadingDataSpb("spb",
                                          dataAngsurSpb.length),
                                      // Text("tes"),
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
                      "Biaya SPP bisa diangsur  ${valwaktuspp == '' ? 6 : valwaktuspp}x atau bulanan",
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
                              ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[350],
                              highlightColor: Colors.white,
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(
                                        10),
                                    color: Colors.grey[350]),
                              ),
                            ),
                          )
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
                                                _loadingProcess("spp",
                                                    value);
                                              });
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
                                  child: dataSppAngsur
                                      .length ==
                                      0
                                      ? Container(
                                    child: Shimmer.fromColors(
                                      baseColor:
                                      Colors.grey[350],
                                      highlightColor:
                                      Colors.white,
                                      child: Container(
                                        height: 30,
                                        width: MediaQuery.of(
                                            context)
                                            .size
                                            .width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                10),
                                            color: Colors
                                                .grey[350]),
                                      ),
                                    ),
                                  )
                                      : _loadingDataSpp(
                                      "spp",
                                      dataSppAngsur
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
    );
  }

  Widget _loadingDataSpp(var cat, var dataLength) {
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
      child: dataSppAngsur[0].waktuAngsuran == "0"
          ? Center(child: Text(""))
          : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataSppAngsur.length == 0
            ? 0
            : dataSppAngsur.length,
        itemBuilder: (BuildContext context, int index) {
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
                                "${dataSppAngsur[index].waktuAngsuran.toString()} x",
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
                                  dataSppAngsur[index]
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

  Widget _loadingDataSpb(var cat, var dataLength) {
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
      child: dataSpbAngsur[0].waktuAngsuran == "0"
          ? Text("")
          : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataSpbAngsur.length == 0
            ? 0
            : dataSpbAngsur.length,
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
                                "${dataSpbAngsur[index].waktuAngsuran.toString()}",
                                style: blackFontStyle3.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                                  .format(dataSpbAngsur[index]
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
        if (cat == "spp") {
          valwaktuspp = value;
          getBiayaSipemaAngsurSpp();
          _loadingfSpp = false;
        } else if (cat == "spb") {
          valwaktuspb = value;
          getBiayaSipemaAngsurSpb();
          _loadingfSpb = false;
        }
      });
    });
  }

  void _loading_fullscreen() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  Future bottomModalProgramStudi(BuildContext context) {
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
                    child: dataWebJurusan.length == 0
                        ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                        ))
                        : ListView.builder(
                      itemCount: dataWebJurusan.length,
                      itemBuilder: (BuildContext context, int index) {
                        final xweb = dataWebJurusan[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            var xweb = dataWebJurusan[index];
                            likeButtonColor = Colors.white;

                            index2 = index;

                            labelnamaweb = xweb.label;
                            kodeweb = xweb.kode;
                            kodejurusan = kodeweb;
                            jenjangweb = xweb.jenjang;

                            text_programstudi = xweb.label;

                            getSipemaWhereKelompok(
                                widget.campus.kode.toString(),
                                kodeweb.toString(),
                                sipema_program_kode.toString());

                            angsuranpertama = biayaSpp +
                                biayaSpb +
                                int.parse(biayajaket);

                            if (biayaSpp == 0 || biayaSpb == 0) {
                              spb_spp = 0;
                            } else {
                              spb_spp = 1;
                            }

                            //master
                            getBiayaSipemaAngsuranSPBMaster();
                            getBiayaSipemaAngsuranSPPMaster();
                            //ansguran
                            getBiayaSipemaAngsurSpb();
                            getBiayaSipemaAngsurSpp();

                            _loading = true;

                            _loading_fullscreen();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: index2 == index &&
                                              labelnamaweb ==
                                                  xweb.label
                                              ? Colors.white12
                                              : mainColor1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              "${xweb.label}",
                                              style: whiteFontStyle
                                                  .copyWith(fontSize: 14),
                                            ),
                                          ),
                                          Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [],
                                              )),

                                          SizedBox(
                                            height: 10,
                                          ),

                                          // Text(
                                          //     "Hallo Sipema Angsur${datSipemaByIndex.itembayar.itembayar}"),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white38,
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    )
                                  ],
                                )),
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

  Future bottomModalKelompokLulusan(BuildContext context) {
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
                              //                      widget.campus.kode.toString(),
                              // widget.kodejurusan.toString()==null ? "a" : "a",
                              // first_kodeprogram.toString(),
                              // first_kelompok.toString())
                              kodejurusan =
                                  datasipemaKelompok[index].kodejrs;
                              kodeprogram =
                                  datasipemaKelompok[index].kodeprg;

                              namaKelompok =
                                  datasipemaKelompok[index].kelompok;

                              // dataAngsur = datSipemaByIndex.angsur;
                              biayapendaftaran =
                                  datasipemaKelompok[index].formulir;
                              biayajaket =
                                  datasipemaKelompok[index].jaket;
                              biayaSpp = datasipemaKelompok[index].spp;
                              biayaSpb = datasipemaKelompok[index].spb;

                              text_kelompoklulusan =
                                  datasipemaKelompok[index].lulusan;
                              programstudilulusan =
                                  datasipemaKelompok[index].lulusan;

                              angsuranpertama = biayaSpp +
                                  biayaSpb +
                                  //int.parse(biayapendaftaran) +
                                  int.parse(biayajaket);

                              if (biayaSpp == 0 || biayaSpb == 0) {
                                spb_spp = 0;
                              } else {
                                spb_spp = 1;
                              }

                              //master
                              getBiayaSipemaAngsuranSPBMaster();
                              getBiayaSipemaAngsuranSPPMaster();
                              //ansguran
                              getBiayaSipemaAngsurSpb();
                              getBiayaSipemaAngsurSpp();

                              Navigator.pop(context);

                              _loading = true;

                              _loading_fullscreen();
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

  Future bottomModalProgramPerkuliahan(BuildContext context) {
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
                    child: datasipemaprogram.length == 0
                        ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                        ))
                        : ListView.builder(
                      itemCount: datasipemaprogram.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              sipema_program_kode =
                                  datasipemaprogram[index].kode;

                              text_programperkuliahan =
                                  datasipemaprogram[index].nama;

                              sipema_program_nama =
                                  datasipemaprogram[index].nama;

                              getSipemaWhereKelompok(
                                  widget.campus.kode.toString(),
                                  kodeweb.toString(),
                                  sipema_program_kode.toString());

                              Navigator.pop(context);

                              _loading = true;

                              _loading_fullscreen();
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
                                      Text(datasipemaprogram[index].nama,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: whiteFontStyle.copyWith(
                                              fontWeight:
                                              FontWeight.bold)),
                                      SizedBox(height: 4),
                                      Text(datasipemaprogram[index].kode,
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
}