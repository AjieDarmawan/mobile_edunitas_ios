part of 'widget_home.dart';

class DetailBottomSheetWebJurusan extends StatefulWidget {
  final Photo campus;
  final String jurusan, routef;

  DetailBottomSheetWebJurusan({this.campus, this.jurusan, this.routef});

  @override
  _DetailBottomSheetWebJurusanState createState() =>
      _DetailBottomSheetWebJurusanState();
}

class _DetailBottomSheetWebJurusanState
    extends State<DetailBottomSheetWebJurusan> {
  var labelnamaweb = '', kodeweb = '', jenjangweb;
  var dataWebJurusan = new List();
  void getWebJurusan() {
    sipemaview_model().getBiayaSipema_web(widget.campus.kode).then((value) {
      setState(() {
        dataWebJurusan = value;
        if (widget.jurusan == null) {
          labelnamaweb = dataWebJurusan[0].label;
          kodeweb = dataWebJurusan[0].kode;
          jenjangweb = dataWebJurusan[0].jenjang;
        } else {
          var _labelnamaweb = dataWebJurusan
              .where((u) =>
                  (u.kode.toLowerCase().contains(widget.jurusan.toLowerCase())))
              .toList();
          labelnamaweb = _labelnamaweb[0].label;
          kodeweb = _labelnamaweb[0].kode;
          jenjangweb = _labelnamaweb[0].jenjang;
        }
        print("jdod: " + labelnamaweb);
        //labelkelompok = dataWebJurusan[0].kelompok;
        // labelprogram = dataWebJurusan[0].program;
      });
    });
  }

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

  var likeButtonColor = Color(0xff333030);
  int index2 = 0;

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

        var _handlingJurusan = widget.jurusan == null ? '' : widget.jurusan;
        if (widget.jurusan == null ||
            widget.jurusan == "" ||
            widget.jurusan == "semua-prodi") {
          namaJurusan = datSipemaByIndex.detail.jurusan;
          //hargaJurusan = (int.parse(datSipemaByIndex.itembayar.jaket.toString())+int.parse(datSipemaByIndex.itembayar.spp.toString())+int.parse(datSipemaByIndex.itembayar.spb.toString())+int.parse(datSipemaByIndex.itembayar.formulir.toString())).toString();
          hargaJurusan = datSipemaByIndex.detail.bulanan;
          kodejrs = datSipemaByIndex.detail.kodejrs;
          kodeprg = datSipemaByIndex.detail.kodeprg;
          namalulusan = datSipemaByIndex.detail.lulusan;
          namajaket = datSipemaByIndex.itembayar.jaket;
          namaformulir = datSipemaByIndex.itembayar.formulir;
          namaspb = datSipemaByIndex.itembayar.spb;
          namaspp = datSipemaByIndex.itembayar.spp;
          namaKelompok = datSipemaByIndex.detail.kelompok;
          bulanan = datSipemaByIndex.detail.bulanan;
          angkatan = datSipemaByIndex.detail.angkatan;
          tahunangkatan = datSipemaByIndex.detail.tahun;
          wilayah = datSipemaByIndex.detail.wilayah;
          hereg = datSipemaByIndex.detail.hereg;
          perpus = datSipemaByIndex.itembayar.perpus;
          kmhsmaba = datSipemaByIndex.itembayar.kmhsmaba;

          krs = datSipemaByIndex.itembayar.krs;
          dpm = datSipemaByIndex.itembayar.dpm;

          print("goodNight: \n" +
              "namaJurusan: " +
              namaJurusan +
              "\n" +
              "hargaJurusan: " +
              hargaJurusan +
              "\n" +
              "kodejrs: " +
              kodejrs +
              "\n" +
              "kodeprg: " +
              kodeprg +
              "\n" +
              "namalulusan: " +
              namalulusan +
              "\n" +
              "namajaket: " +
              namajaket +
              "\n" +
              "namaformulir: " +
              namaformulir +
              "\n" +
              "namaspb: " +
              namaspb.toString() +
              "\n" +
              "namaspp: " +
              namaspp.toString() +
              "\n" +
              "namaKelompok: " +
              namaKelompok +
              "\n" +
              "bulanan: " +
              bulanan +
              "\n" +
              "angkatan: " +
              angkatan +
              "\n" +
              "tahunangkatan: " +
              tahunangkatan +
              "\n" +
              "wilayah: " +
              wilayah +
              "\n" +
              "hereg: " +
              hereg.toString() +
              "\n" +
              "perpus: " +
              perpus.toString() +
              "\n" +
              "kmhsmaba: " +
              kmhsmaba.toString() +
              "\n" +
              "krs: " +
              krs.toString() +
              "\n" +
              "dpm: " +
              dpm.toString());
        }

        // namakonversi = datSipemaByIndex.itembayar.itembayar;
        namakonversi = 0;
      });
    });
  }

  Future<void> checkInternet() async {
    Future.delayed(const Duration(seconds: 20), () {
      print("sipemahh: " + dataSipema.toString());
      dataSipema.length == 0
          ? Flushbar(
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
                    getdataCheckProdi();
                    getBiayaSipema2();
                    jurusan();
                    checkInternet();
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Ulangi',
                ),
              )).show(context)
          : checkInternet();
    });
  }

  //list cekbiayakampus;
  Map<String, dynamic> cekbiayakampus = Map<String, dynamic>();
  //Map cekbiayakampus = Map();
  List dataAngsur;

  List<MasterJurusanModel> dataJurusan = new List();
  void jurusan() async {
    Masterview_model().jurusan().then((value1) {
      setState(() {
        dataJurusan = value1;
      });
    });
  }

  List<CheckProdiSearchModel> dataCheckProdi = new List();
  void getdataCheckProdi() async {
    var _handlingJurusan;
    if (widget.jurusan == null ||
        widget.jurusan == "" ||
        widget.jurusan == "semua-prodi")
      _handlingJurusan = '';
    else
      _handlingJurusan = widget.jurusan;
    print("selamat_malam: " + _handlingJurusan);
    if (_handlingJurusan != '') {
      sipemaview_model()
          .check_prodi_search(widget.campus.kode, widget.jurusan)
          .then((value1) {
        setState(() {
          dataCheckProdi = value1;
          namaJurusan = dataCheckProdi[0].jurusan;
          //hargaJurusan = (int.parse(dataCheckProdi[0].jaket.toString())+int.parse(dataCheckProdi[0].spp.toString())+int.parse(dataCheckProdi[0].spb.toString())+int.parse(dataCheckProdi[0].formulir.toString())).toString();
          hargaJurusan = dataCheckProdi[0].bulanan;
          kodejrs = dataCheckProdi[0].kodejrs;
          kodeprg = dataCheckProdi[0].kodeprg;
          namalulusan = dataCheckProdi[0].lulusan;
          namajaket = dataCheckProdi[0].jaket;
          namaformulir = dataCheckProdi[0].formulir;
          namaspb = dataCheckProdi[0].spb;
          namaspp = dataCheckProdi[0].spp;
          namaKelompok = dataCheckProdi[0].kelompok;
          bulanan = dataCheckProdi[0].bulanan;
          angkatan = dataCheckProdi[0].angkatan;
          tahunangkatan = dataCheckProdi[0].tahun;
          wilayah = dataCheckProdi[0].wilayah;
          hereg = dataCheckProdi[0].hereg;
          perpus = dataCheckProdi[0].perpus;
          kmhsmaba = dataCheckProdi[0].kmhsmaba;

          krs = dataCheckProdi[0].krs;
          dpm = dataCheckProdi[0].dpm;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getdataCheckProdi();
    getBiayaSipema2();
    jurusan();
    checkInternet();
    getWebJurusan();
    //indexDataProdi();
  }

  @override
  Widget build(BuildContext context) {
    //print("buttonsipema ${dataSipema.length}");
    //print("hargajurusan: "+(int.parse(dataCheckProdi[0].jaket.toString())+int.parse(dataCheckProdi[0].spp.toString())+int.parse(dataCheckProdi[0].spb.toString())+int.parse(dataCheckProdi[0].formulir.toString())).toString());

    return Container(
        alignment: Alignment.bottomCenter,
        //height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: mainColor1,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(child: displayBottomSheet_top(context)));
  }

  Widget displayBottomSheet_top(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: BoxDecoration(
        // color: colorPrimary,
        color: mainColor1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 45,
            padding: EdgeInsets.only(left: 20, right: 24, top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: namaJurusan == ''
                                ? Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[350],
                                      highlightColor: Colors.white,
                                      child: Container(
                                          height: 16,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.grey[350])),
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Text("${labelnamaweb.toString()}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: whiteFontStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  )),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                    Container(
                      child: widget.campus.logo == null ||
                              widget.campus.logo.isEmpty
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[350])),
                                ),
                              ),
                            )
                          : Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.campus.logo),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white38,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: dataWebJurusan.length == 0
                ? Container(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[350],
                      highlightColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 32,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[350])),
                          Container(
                              height: 32,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[350])),
                          Container(
                              height: 32,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[350])),
                        ],
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        //1
                        SizedBox(
                          width: 100,
                          child: EduButton(
                            onPressed: () {
                              // checkEmailAndPassowrd();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (CekbiayaWebJurusan(
                                            campus: widget.campus == null
                                                ? ""
                                                : widget.campus,
                                            kodejurusan: kodeweb == null
                                                ? ""
                                                : kodeweb.toString(),
                                            jenjang: jenjangweb == null
                                                ? ""
                                                : jenjangweb.toString(),
                                            namaJurusan: labelnamaweb == null
                                                ? ""
                                                : labelnamaweb.toString(),
                                            // kodeprogram:
                                            //     labelprogram.toString() == null
                                            //         ? ""
                                            //         : labelprogram.toString(),

                                            // kodeprogram : "P2K",
                                            // namaKelompok:
                                            //     labelkelompok.toString() == null
                                            //         ? ""
                                            //         : labelkelompok.toString(),
                                          ))));
                            },
                            buttonText: "Cek Biaya",
                          ),
                        ),
                        //2
                        SizedBox(
                          width: 100,
                          child: EduButton(
                            onPressed: () {
                              // checkEmailAndPassowrd();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Prospek(
                                            kodejurusan: kodejrs,
                                          ))));
                            },
                            buttonText: "Prospek",
                          ),
                        ),
                        //3
                        SizedBox(
                          width: 100,
                          child: EduButton(
                            onPressed: () {
                              // checkEmailAndPassowrd();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          (Daftar_kuliahWebJurusan(
                                            campus: widget.campus == null
                                                ? ""
                                                : widget.campus,
                                            kodejurusan: kodeweb == null
                                                ? ""
                                                : kodeweb.toString(),
                                            jenjang: jenjangweb == null
                                                ? ""
                                                : jenjangweb.toString(),
                                            namaJurusan: labelnamaweb == null
                                                ? ""
                                                : labelnamaweb.toString(),
                                            // kodeprogram:
                                            //     labelprogram.toString() == null
                                            //         ? ""
                                            //         : labelprogram.toString(),

                                            // kodeprogram : "P2K",
                                            // namaKelompok:
                                            //     labelkelompok.toString() == null
                                            //         ? ""
                                            //         : labelkelompok.toString(),
                                          ))));
                            },
                            buttonText: "Daftar",
                          ),
                        ),
                      ]),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              color: Colors.white38,
              height: 1),
          dataWebJurusan.length != 0
              ? Expanded(
                  child: Container(
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            displayBottomSheet(context);
                          },
                          child: Text(
                            "klik disini untuk pilihan prodi lainnya",
                            style: whiteFontStyle,
                          )),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  void displayBottomSheet(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                    // color: colorPrimary,
                    color: mainColor1,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
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
                          color: Colors.black45,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 24, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: namaJurusan == ''
                                                ? Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[350],
                                                      highlightColor:
                                                          Colors.white,
                                                      child: Container(
                                                          height: 16,
                                                          width: 150,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: Colors
                                                                  .grey[350])),
                                                    ),
                                                  )
                                                : Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                    child: Text(
                                                        "${labelnamaweb}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: whiteFontStyle
                                                            .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  )),
                                        // SizedBox(
                                        //   height: 6,
                                        // ),
                                        // Container(
                                        //     child: namaJurusan == ''
                                        //         ? Container(
                                        //             padding: EdgeInsets.only(
                                        //                 left: 5),
                                        //             child: Shimmer.fromColors(
                                        //               baseColor:
                                        //                   Colors.grey[350],
                                        //               highlightColor:
                                        //                   Colors.white,
                                        //               child: Container(
                                        //                   height: 12,
                                        //                   width: 70,
                                        //                   decoration: BoxDecoration(
                                        //                       borderRadius:
                                        //                           BorderRadius
                                        //                               .circular(
                                        //                                   6),
                                        //                       color: Colors
                                        //                           .grey[350])),
                                        //             ),
                                        //           )

                                        //         // : Text(
                                        //         //     NumberFormat.currency(
                                        //         //             symbol: 'Rp. ',
                                        //         //             decimalDigits: 0,
                                        //         //             locale: 'id-ID')
                                        //         //         .format(double.parse(hereg
                                        //         //                 .toString()) *
                                        //         //             1.25),
                                        //         //     textAlign: TextAlign.left,
                                        //         //     overflow: TextOverflow.clip,
                                        //         //     style: blackFontStyle1
                                        //         //         .copyWith(
                                        //         //             fontSize: 12,
                                        //         //             fontWeight:
                                        //         //                 FontWeight.w100,
                                        //         //             decoration:
                                        //         //                 TextDecoration
                                        //         //                     .lineThrough,
                                        //         //             color:
                                        //         //                 Colors.white))
                                        //     /*Text(
                                        //     "Rp. ${double.parse(hargaJurusan) * 1.25}",
                                        //     maxLines: 1,
                                        //     textAlign: TextAlign.left,
                                        //     overflow: TextOverflow.clip,
                                        //     style: blackFontStyle1.copyWith(
                                        //         fontSize: 12,
                                        //         fontWeight: FontWeight.w100,
                                        //         fontStyle: FontStyle.italic,
                                        //         decoration:
                                        //             TextDecoration.lineThrough,
                                        //         color: Colors.white),
                                        //   ),*/
                                        //     ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: widget.campus.logo == null ||
                                              widget.campus.logo.isEmpty
                                          ? Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[350],
                                                  highlightColor: Colors.white,
                                                  child: Container(
                                                      height: 32,
                                                      width: 32,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors
                                                              .grey[350])),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            widget.campus.logo),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Container(
                                    //   child: hereg == 0
                                    //       ? Container(
                                    //           padding: EdgeInsets.only(left: 5),
                                    //           child: Shimmer.fromColors(
                                    //             baseColor: Colors.grey[350],
                                    //             highlightColor: Colors.white,
                                    //             child: Container(
                                    //                 height: 12,
                                    //                 width: 90,
                                    //                 decoration: BoxDecoration(
                                    //                     borderRadius:
                                    //                         BorderRadius
                                    //                             .circular(6),
                                    //                     color:
                                    //                         Colors.grey[350])),
                                    //           ),
                                    //         )
                                    //       : Text(
                                    //           NumberFormat.currency(
                                    //                   symbol: 'Rp. ',
                                    //                   decimalDigits: 0,
                                    //                   locale: 'id-ID')
                                    //               .format(double.parse(
                                    //                   hereg.toString())),
                                    //           textAlign: TextAlign.left,
                                    //           overflow: TextOverflow.clip,
                                    //           style: orenFontStyle.copyWith(
                                    //             fontSize: 14,
                                    //             fontWeight: FontWeight.bold,
                                    //           )),
                                    // ),
                                    // Container(
                                    //   child: namalulusan == ''
                                    //       ? Container(
                                    //           child: Shimmer.fromColors(
                                    //             baseColor: Colors.grey[350],
                                    //             highlightColor: Colors.white,
                                    //             child: Container(
                                    //                 height: 12,
                                    //                 width: 90,
                                    //                 decoration: BoxDecoration(
                                    //                     borderRadius:
                                    //                         BorderRadius
                                    //                             .circular(6),
                                    //                     color:
                                    //                         Colors.grey[350])),
                                    //           ),
                                    //         )
                                    //       : Text(namalulusan,
                                    //           style: whiteFontStyle.copyWith(
                                    //             fontSize: 12,
                                    //             fontWeight: FontWeight.w100,
                                    //           )),
                                    // )
                                  ],
                                ),
                              ],
                            )),

                        Divider(
                          color: Colors.white38,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),

                        Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 24, top: 5, bottom: 5),
                          child: dataSipema.length == 0
                              ? Container(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[350],
                                    highlightColor: Colors.white,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 32,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.grey[350])),
                                        Container(
                                            height: 32,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.grey[350])),
                                        Container(
                                            height: 32,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.grey[350])),
                                      ],
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //1
                                    SizedBox(
                                      width: 100,
                                      child: EduButton(
                                        onPressed: () {
                                          // checkEmailAndPassowrd();

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      (CekbiayaWebJurusan(
                                                        campus: widget.campus ==
                                                                null
                                                            ? ""
                                                            : widget.campus,
                                                        kodejurusan:
                                                            kodeweb == null
                                                                ? ""
                                                                : kodeweb
                                                                    .toString(),
                                                        jenjang:
                                                            jenjangweb == null
                                                                ? ""
                                                                : jenjangweb
                                                                    .toString(),
                                                        namaJurusan:
                                                            labelnamaweb == null
                                                                ? ""
                                                                : labelnamaweb
                                                                    .toString(),
                                                        // kodeprogram: labelprogram
                                                        //             .toString() ==
                                                        //         null
                                                        //     ? ""
                                                        //     : labelprogram
                                                        //         .toString(),
                                                        // namaKelompok: labelkelompok
                                                        //             .toString() ==
                                                        //         null
                                                        //     ? ""
                                                        //     : labelkelompok
                                                        //         .toString(),
                                                      ))));
                                        },
                                        buttonText: "Cek Biaya",
                                      ),
                                    ),
                                    //2
                                    SizedBox(
                                      width: 100,
                                      child: EduButton(
                                        onPressed: () {
                                          // checkEmailAndPassowrd();

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      (Prospek(
                                                        kodejurusan: kodejrs,
                                                      ))));
                                        },
                                        buttonText: "Prospek",
                                      ),
                                    ),
                                    //3
                                    SizedBox(
                                      width: 100,
                                      child: EduButton(
                                        onPressed: () {
                                          // checkEmailAndPassowrd();

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      (Daftar_kuliahWebJurusan(
                                                        campus: widget.campus ==
                                                                null
                                                            ? ""
                                                            : widget.campus,
                                                        kodejurusan:
                                                            kodeweb == null
                                                                ? ""
                                                                : kodeweb
                                                                    .toString(),
                                                        jenjang:
                                                            jenjangweb == null
                                                                ? ""
                                                                : jenjangweb
                                                                    .toString(),
                                                        namaJurusan:
                                                            labelnamaweb == null
                                                                ? ""
                                                                : labelnamaweb
                                                                    .toString(),
                                                        // kodeprogram: labelprogram
                                                        //             .toString() ==
                                                        //         null
                                                        //     ? ""
                                                        //     : labelprogram
                                                        //         .toString(),

                                                        // kodeprogram : "P2K",
                                                        // namaKelompok: labelkelompok
                                                        //             .toString() ==
                                                        //         null
                                                        //     ? ""
                                                        //     : labelkelompok
                                                        //         .toString(),
                                                      ))));
                                        },
                                        buttonText: "Daftar",
                                      ),
                                    ),
                                  ],
                                ),
                        ),

                        Divider(
                          color: Colors.white38,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        // Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: 2,
                        //     color: mainColor1,
                        //     child: Center(
                        //       child: Container(
                        //         width: MediaQuery.of(context).size.width - 40,
                        //         height: 2,
                        //         color: CupertinoColors.white,
                        //       ),
                        //     )),

                        Expanded(
                          child: Container(
                            child: dataWebJurusan.length == 0
                                ? Center(
                                    child: SpinKitThreeBounce(
                                    color: Colors.white,
                                  ))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    //physics: NeverScrollableScrollPhysics(),
                                    itemCount: dataWebJurusan.length,
                                    itemBuilder:
                                        (BuildContext context, int indexdua) {
                                      final xweb = dataWebJurusan[indexdua];
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            // dataJurusan = datSipemaByIndex.detail.jurusan;
                                            likeButtonColor = Colors.white;

                                            index2 = indexdua;

                                            labelnamaweb = xweb.label;
                                            kodeweb = xweb.kode;
                                            jenjangweb = xweb.jenjang;
                                          });
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
                                                        color: index2 ==
                                                                    indexdua &&
                                                                labelnamaweb ==
                                                                    xweb.label
                                                            ? Colors.white12
                                                            : mainColor1,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            "${xweb.label}",
                                                            style: whiteFontStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        14),
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
                                    }),
                          ),
                        ),

                        // Expanded(
                        //   child: Container(
                        //     child: dataSipema.length == 0
                        //         ? Center(child: CircularProgressIndicator())
                        //         : ListView.builder(
                        //             itemCount: dataSipema.length,
                        //             itemBuilder:
                        //                 (BuildContext context, int indexsatu) {
                        //               List<Sipema> lastDataSipema =
                        //                   dataSipema[indexsatu];
                        //               return ListView.builder(
                        //                 shrinkWrap: true,
                        //                 physics: NeverScrollableScrollPhysics(),
                        //                 itemCount: lastDataSipema.length,
                        //                 itemBuilder: (BuildContext context,
                        //                     int indexdua) {
                        //                   String jurusanpertama =
                        //                       lastDataSipema[0].detail.jurusan;
                        //                   String bulananpertama =
                        //                       lastDataSipema[0].detail.bulanan;

                        //                   Sipema datSipemaByIndex =
                        //                       lastDataSipema[indexdua];

                        //                   return InkWell(
                        //                     onTap: () {
                        //                       setState(() {
                        //                         // dataJurusan = datSipemaByIndex.detail.jurusan;
                        //                         likeButtonColor = Colors.white;

                        //                         index2 = indexdua;

                        //                         print("nomor${index2}");
                        //                         print("nomordua${indexdua}");

                        //                         namalulusan = datSipemaByIndex
                        //                             .detail.lulusan;

                        //                         bulanan = datSipemaByIndex
                        //                             .detail.bulanan;

                        //                         angkatan = datSipemaByIndex
                        //                             .detail.angkatan;

                        //                         tahunangkatan = datSipemaByIndex
                        //                             .detail.tahun;

                        //                         wilayah = datSipemaByIndex
                        //                             .detail.wilayah;

                        //                         //  namakonversi = datSipemaByIndex.itembayar.itembayar;

                        //                         namakonversi = 0;

                        //                         namajaket = datSipemaByIndex
                        //                             .itembayar.jaket;

                        //                         namaformulir = datSipemaByIndex
                        //                             .itembayar.formulir;

                        //                         namaspb = datSipemaByIndex
                        //                             .itembayar.spb;

                        //                         namaspp = datSipemaByIndex
                        //                             .itembayar.spp;

                        //                         namaJurusan = datSipemaByIndex
                        //                             .detail.jurusan;

                        //                         namaKelompok = datSipemaByIndex
                        //                             .detail.kelompok;

                        //                         hargaJurusan = datSipemaByIndex
                        //                             .detail.bulanan;

                        //                         hereg = datSipemaByIndex
                        //                             .detail.hereg;

                        //                         kodejrs = datSipemaByIndex
                        //                             .detail.kodejrs;

                        //                         kodeprg = datSipemaByIndex
                        //                             .detail.kodeprg;

                        //                         Angsur dataAngsur =
                        //                             datSipemaByIndex.angsur;
                        //                       });
                        //                     },
                        //                     child: Container(
                        //                         padding: EdgeInsets.symmetric(
                        //                           horizontal: 10,
                        //                         ),
                        //                         child: Column(
                        //                           children: [
                        //                             Container(
                        //                               decoration: BoxDecoration(
                        //                                   color: index2 ==
                        //                                               indexdua &&
                        //                                           namaJurusan ==
                        //                                               datSipemaByIndex
                        //                                                   .detail
                        //                                                   .jurusan
                        //                                       ? Colors.white12
                        //                                       : mainColor1,
                        //                                   borderRadius:
                        //                                       BorderRadius.all(
                        //                                           Radius
                        //                                               .circular(
                        //                                                   10))),
                        //                               padding:
                        //                                   EdgeInsets.symmetric(
                        //                                       horizontal: 10),
                        //                               child: Column(
                        //                                 mainAxisAlignment:
                        //                                     MainAxisAlignment
                        //                                         .start,
                        //                                 crossAxisAlignment:
                        //                                     CrossAxisAlignment
                        //                                         .start,
                        //                                 children: [
                        //                                   SizedBox(
                        //                                     height: 10,
                        //                                   ),
                        //                                   Row(
                        //                                     mainAxisAlignment:
                        //                                         MainAxisAlignment
                        //                                             .spaceBetween,
                        //                                     children: [
                        //                                       Flexible(
                        //                                           child:
                        //                                               Container(
                        //                                         child: Text(
                        //                                           "${datSipemaByIndex.detail.jurusan}",
                        //                                           style: whiteFontStyle
                        //                                               .copyWith(
                        //                                                   fontSize:
                        //                                                       14),
                        //                                         ),
                        //                                       )),
                        //                                       Flexible(
                        //                                           child:
                        //                                               Container(
                        //                                         child: Text(
                        //                                           "${datSipemaByIndex.detail.lulusan}",
                        //                                           style: whiteFontStyle
                        //                                               .copyWith(
                        //                                                   fontSize:
                        //                                                       12),
                        //                                         ),
                        //                                       )),
                        //                                     ],
                        //                                   ),
                        //                                   Container(
                        //                                       child: Row(
                        //                                     mainAxisAlignment:
                        //                                         MainAxisAlignment
                        //                                             .spaceBetween,
                        //                                     children: [
                        //                                       Text(
                        //                                           NumberFormat.currency(
                        //                                                   symbol:
                        //                                                       'Rp. ',
                        //                                                   decimalDigits:
                        //                                                       0,
                        //                                                   locale:
                        //                                                       'id-ID')
                        //                                               //.format(double.parse((int.parse(datSipemaByIndex.itembayar.jaket.toString())+int.parse(datSipemaByIndex.itembayar.spp.toString())+int.parse(datSipemaByIndex.itembayar.spb.toString())+int.parse(datSipemaByIndex.itembayar.formulir.toString())).toString())),
                        //                                               //.format(double.parse(datSipemaByIndex.detail.bulanan)),
                        //                                               .format(double.parse(datSipemaByIndex
                        //                                                   .detail
                        //                                                   .hereg
                        //                                                   .toString())),
                        //                                           //(int.parse(datSipemaByIndex.itembayar.jaket.toString())+int.parse(datSipemaByIndex.itembayar.spp.toString())+int.parse(datSipemaByIndex.itembayar.spp.toString())).toString()
                        //                                           textAlign:
                        //                                               TextAlign
                        //                                                   .left,
                        //                                           overflow:
                        //                                               TextOverflow
                        //                                                   .clip,
                        //                                           style: orenFontStyle.copyWith(
                        //                                               fontSize:
                        //                                                   16,
                        //                                               fontWeight:
                        //                                                   FontWeight
                        //                                                       .bold)
                        //                                           //     Text(
                        //                                           //   "Rp. ${datSipemaByIndex.detail.bulanan}",
                        //                                           //   textAlign:
                        //                                           //       TextAlign
                        //                                           //           .start,
                        //                                           //   style: TextStyle(
                        //                                           //       color: Color(
                        //                                           //           0xFFFFCE00),
                        //                                           //       fontSize: 16,
                        //                                           //       fontWeight:
                        //                                           //           FontWeight
                        //                                           //               .bold),
                        //                                           ),
                        //                                       Text(
                        //                                           datSipemaByIndex
                        //                                               .detail
                        //                                               .program,
                        //                                           textAlign:
                        //                                               TextAlign
                        //                                                   .left,
                        //                                           overflow:
                        //                                               TextOverflow
                        //                                                   .clip,
                        //                                           style: whiteFontStyle.copyWith(
                        //                                               fontSize:
                        //                                                   11,
                        //                                               color: Colors
                        //                                                   .white60))
                        //                                     ],
                        //                                   )),

                        //                                   SizedBox(
                        //                                     height: 10,
                        //                                   ),

                        //                                   // Text(
                        //                                   //     "Hallo Sipema Angsur${datSipemaByIndex.itembayar.itembayar}"),
                        //                                 ],
                        //                               ),
                        //                             ),
                        //                             Divider(
                        //                               color: Colors.white38,
                        //                               thickness: 1,
                        //                               indent: 10,
                        //                               endIndent: 10,
                        //                             )
                        //                           ],
                        //                         )),
                        //                   );
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //   ),
                        // ),

                        // Container(
                        //   height: 230,
                        //   child: dataJurusan.length == null || dataJurusan.isEmpty
                        //       ? Center(
                        //           child: CircularProgressIndicator(
                        //             backgroundColor: Colors.white,

                        //           ),
                        //         )
                        //       : ListView.builder(
                        //           itemCount: dataJurusan.length,
                        //           itemBuilder: (context, index) {
                        //             return GestureDetector(
                        //               onTap: () {
                        //                 setState(() {
                        //                   namaJurusan = dataJurusan[index].nama;
                        //                 });
                        //               },
                        //               child: ListTile(
                        //                 title: Text(dataJurusan[index].nama),
                        //               ),
                        //             );
                        //           },
                        //         ),
                        // ),

                        //              Container(
                        //   child: widget.campus.jurusan == null || widget.campus.jurusan.isEmpty
                        //       ? Center(
                        //           child: CircularProgressIndicator(),
                        //         )
                        //       : ListView.builder(
                        //           itemCount: widget.campus.jurusan.length,
                        //           shrinkWrap: true,
                        //           physics: NeverScrollableScrollPhysics(),
                        //           itemBuilder: (context, i) {
                        //             final Campus xkampus = widget.campus.jurusan;
                        //             return ListKampusCard(
                        //               campus: xkampus,
                        //             );
                        //           },
                        //         ),
                        // ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }).whenComplete(() => _closeBottomModal());
  }

  void _closeBottomModal() {
    setState(() {
      namaJurusan = namaJurusan;
    });
  }
}
