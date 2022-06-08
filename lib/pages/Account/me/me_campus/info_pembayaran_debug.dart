part of 'me_kampus.dart';

class InfoPembayaranDebug extends StatefulWidget {
  final String namalengkap,
      logo_me,
      campus_me,
      prodi_me,
      no_virtual,
      nosel,
      singkatan_me,
      keycode,
      kode_campus_me,
      kelas_me, nim;

  InfoPembayaranDebug(
      {this.namalengkap,
        this.logo_me,
        this.campus_me,
        this.prodi_me,
        this.singkatan_me,
        this.kelas_me,
        this.nosel,
        this.keycode,
        this.kode_campus_me,
        this.no_virtual,
        this.nim});

  @override
  _InfoPembayaranDebugState createState() => _InfoPembayaranDebugState();
}

class _InfoPembayaranDebugState extends State<InfoPembayaranDebug>
    with TickerProviderStateMixin {
  String valtab;
  List<Basket> basket = [];

  var valsemester = '1';
  var sum = 0;

  double plusSt = 0.0;

  //tab
  List<Tabtab> tab = [];

  List<dynamic> suggestionList = [];

  List<Tab> tabList = [];
  List<Tab> tabListSpb = [];
  TabController _tabController;
  final formatCurrency = new NumberFormat.simpleCurrency();

  void info() {
    Apiinfoview_model().info_pembayaran("", "").then((value) {//handled
      setState(() {
        InfoPembayaranMeModel data = value;
        basket = data.basket;
        tab = data.tab;

        // datainfo = value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  //basket
  List<Datum> databasket = [];
  int total_tagihan = 0;
  void data_basket() {
    Apiinfoview_model()
        .dataBasket(widget.keycode.toString(), widget.no_virtual.toString()).then((value) {//handled
      setState(() {
        BasketModel data = value;
        databasket = data.data??[];
        total_tagihan = data.total;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var dataSPb_rencana = [];
  int dataSPb_summaryr = 0;
  int dataSPb_summarya = 0;
  var dataSPb_realita = [];

  void spb() {
    Apiinfoview_model()
        .dataRRSpb(widget.keycode.toString(), widget.no_virtual.toString()).then((value) {//handled
      setState(() {
        InfoPSPB data = value;
        dataSPb_rencana = data.rencana;
        dataSPb_summaryr = data.summaryr.jumr;
        dataSPb_summarya = data.summarya.juma;
        dataSPb_realita = data.realita;
        spbcat = "realita";
        changeLenght();
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var dataSPP_rencana = [];
  int dataSPP_summaryr = 0;
  int dataSPP_summarya = 0 ;
  var dataSPP_realita = [];

  List<InfoPsppJumlahSemesterRencana> dataSemester = [];
  void spp() {
    Apiinfoview_model()
        .dataRRSpp(widget.keycode.toString(), widget.no_virtual.toString()).then((value) {//handled
      setState(() {
        dataSemester = value==null?[]:value;
        sppcat = "realita";
        changeLenght();
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  int sppTotal_realita=0;
  int sppTotal_rencana=0;

  List<InfoPsppR> data_spp_rencana = [];
  void spp_rencana_data() {
    Apiinfoview_model()
        .dataRRSpp_rencana(widget.keycode.toString(),
        widget.no_virtual.toString(), valsemester.toString()).then((value) {//handled
      setState(() {
        data_spp_rencana = value;
        data_spp_rencana.forEach((element) {
          setState(() {
            print("sppTotal_rencana: "+element.rp.toString());
            sppTotal_rencana = sppTotal_rencana + int.parse(element.rp.toString());
          });
        });
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<InfoPsppR> data_spp_realita = [];
  void spp_realita_data() {
    Apiinfoview_model()
        .dataRRSpp_realita(widget.keycode.toString(),
        widget.no_virtual.toString(), valsemester.toString()).then((value) {//handled
      setState(() {
        data_spp_realita = value;
        data_spp_realita.forEach((element) {
          setState(() {
            sppTotal_realita = sppTotal_realita + int.parse(element.rp.toString());
          });
        });
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  int datajaket_summarya = 0;
  var datajaket_realita = [];
  void jaket() {
    Apiinfoview_model()
        .dataRR_jaket(widget.keycode.toString(), widget.no_virtual.toString()).then((value) {//handled
      setState(() {
        InfoPJaket data = value;
        datajaket_summarya = data.summarya.juma;
        datajaket_realita = data.realita;
        // datainfo = value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  int dataformulir_summarya = 0;
  var dataformulir_realita = [];
  void formulir() {
    Apiinfoview_model()
        .dataRR_formulir(
        widget.keycode.toString(), widget.no_virtual.toString()).then((value) {//handled
      setState(() {
        InfoPFormulir data = value;
        dataformulir_summarya = data.summarya.juma;
        dataformulir_realita = data.realita;
        // datainfo = value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  _divider() {
    return Divider(
      color: mainColor1.withOpacity(0.3),
      thickness: 1,
      height: 24,
    );
  }

  _dividerBlack() {
    return Divider(
      color: Colors.grey,
      thickness: 0.5,
    );
  }

  Timer _timerinfo;
  Widget _loadingView(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext builderContext) {
          _timerinfo = Timer(Duration(seconds: 5), () {
            Navigator.of(context).pop();
          });

          return SpinKitThreeBounce(color: Colors.white);
        }
    );
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
                data_basket();
                spp_rencana_data();
                spp_realita_data();
                info();
                spb();
                spp();
                formulir();
                jaket();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  var spbcat = 'realita';
  var sppcat;

  @override
  void initState() {
    data_basket();
    spp_rencana_data();
    spp_realita_data();
    info();
    spb();
    spp();
    formulir();
    jaket();

    tabList.add(new Tab(
      text: 'Formulir',
    ));
    tabList.add(new Tab(
      text: 'Jaket',
    ));
    tabList.add(new Tab(
      text: 'SPb',
    ));
    tabList.add(new Tab(
      text: 'SPP',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  int dataSPblenght = 0;
  int dataSPPlenght = 0;

  void changeLenght(){
    setState(() {
      dataSPblenght = spbcat == "realita"
          ? dataSPb_realita==null?0:dataSPb_realita.length
          : dataSPb_rencana==null?0:dataSPb_rencana.length;
      dataSPPlenght = sppcat == "realita"
          ? data_spp_realita==null?0:data_spp_realita.length
          : data_spp_rencana==null?0:data_spp_rencana.length;
      print('dataSPP lenght $spbcat: '+dataSPPlenght.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Info Pembayaran',
          style: whiteFontStyle,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.blue[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Menampilkan detail tagihan dan transaksi terbayar Anda",
                          style: blueFontStyle.copyWith(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Anda bisa lihat detail tagihan terkini, tagihan yang akan datang, dan riwayat dari transaksi terbayar Anda.",
                          style: blueFontStyle.copyWith(fontSize: 11),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 3.0),
                              blurRadius: 3.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              widget.namalengkap,
                              style: blueFontStyle2Bold,
                            ),
                            _divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Container(
                                //   width: 60,
                                //   height: 60,
                                //   child: Card(
                                //     borderOnForeground: true,
                                //     color: Colors.grey,
                                //   ),
                                // ),
                                Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        widget.logo_me, fit: BoxFit.cover,
                                        // height: MediaQuery.of(context).size.height / 9,
                                        // width: MediaQuery.of(context).size.width / 3,
                                      ),
                                    )),
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.singkatan_me.toString(),
                                        style: blackFontStyle3.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        widget.prodi_me.toString(),
                                        style: blackFontStyle3.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            _divider(),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'NIM : ',
                                        style:
                                        blackFontStyle3.copyWith(fontSize: 14),
                                      ),
                                      Text(
                                        widget.nim==null||widget.nim==''?'-':widget.nim,
                                        style: blueFontStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Virtual Account : ',
                                        style:
                                        blackFontStyle3.copyWith(fontSize: 14),
                                      ),
                                      Text(
                                        widget.no_virtual,
                                        style: blueFontStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'NoSel : ',
                                        style:
                                        blackFontStyle3.copyWith(fontSize: 14),
                                      ),
                                      Text(
                                        widget.nosel,
                                        style: blueFontStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            _divider(),
                            Container(
                              padding: EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tagihan Terkini : ',
                                    style: blackFontStyle1.copyWith(fontSize: 16),
                                  ),
                                  Text(
                                    'Rp, ${total_tagihan == null ? 0 : total_tagihan}',
                                    style: blackFontStyle1.copyWith(
                                        color: Colors.red[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 3.0),
                              blurRadius: 3.0)
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "Detail Tagihan Terkini",
                            style: blackFontStyle1.copyWith(fontSize: 16),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    // Text(
                                    //   "Singkatan",
                                    //   style: blueFontStyle.copyWith(
                                    //       fontWeight: FontWeight.bold),
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    Text(
                                      "Item Bayar",
                                      style: blueFontStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text("Nominal",
                                        style: blueFontStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.right)
                                  ]),
                                ],
                              ),
                            ),

                            Container(
                                child: databasket == null
                                    ? Center(child: CircularProgressIndicator())
                                    : databasket == []
                                    ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Center(
                                    child: Text('Anda tidak punya tagihan'),
                                  ),
                                )
                                    : Container(
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: databasket.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      final xbasket = databasket[i];

                                      // for (var i = 0;
                                      //     i < databasket.length;
                                      //     i++) {
                                      //   sum += databasket[i].nominal;
                                      // }

                                      // print("Sum : ${sum}");

                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          children: [
                                            _dividerBlack(),
                                            Table(
                                              children: [
                                                TableRow(
                                                    children: [
                                                      // Container(
                                                      //   child: Text(
                                                      //     xbasket.singkatan,
                                                      //     style: blackFontStyle3,
                                                      //     textAlign:
                                                      //         TextAlign.left,
                                                      //   ),
                                                      // ),
                                                      Container(
                                                        child: xbasket.nama == xbasket.singkatan ? Text(
                                                          xbasket.nama,
                                                          style: blackFontStyle3
                                                              .copyWith(
                                                              fontSize: 12),
                                                          textAlign:
                                                          TextAlign.left,
                                                        )
                                                            : Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              xbasket.singkatan,
                                                              style: blackFontStyle3
                                                                  .copyWith(
                                                                  fontSize: 12),
                                                              textAlign:
                                                              TextAlign.left,
                                                            ),

                                                            Text(
                                                              xbasket.nama,
                                                              style: blackFontStyle3
                                                                  .copyWith(
                                                                  fontSize: 10),
                                                              textAlign:
                                                              TextAlign.left,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          NumberFormat.currency(
                                                              symbol: 'Rp ',
                                                              decimalDigits:
                                                              0,
                                                              locale: 'id-ID')
                                                              .format(xbasket
                                                              .nominal),
                                                          style: blackFontStyle3,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                            ),

                            // _dividerBlack(),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            //   child: Table(
                            //     children: [
                            //       TableRow(children: [
                            //         Text(
                            //           "Formulir",
                            //           style: blackFontStyle3,
                            //         ),
                            //         Text("Formulir", style: blackFontStyle3),
                            //         Text("100.000", style: blackFontStyle3)
                            //       ]),
                            //     ],
                            //   ),
                            // ),
                            // _dividerBlack(),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            //   child: Table(
                            //     children: [
                            //       TableRow(children: [
                            //         Text(
                            //           "SPbb",
                            //           style: blackFontStyle3,
                            //         ),
                            //         Text("Sumbangan Pengembangan",
                            //             style: blackFontStyle3),
                            //         Text("100.000", style: blackFontStyle3)
                            //       ]),
                            //     ],
                            //   ),
                            // ),
                            // _dividerBlack(),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            //   child: Table(
                            //     children: [
                            //       TableRow(children: [
                            //         Text(
                            //           "Jaket",
                            //           style: blackFontStyle3,
                            //         ),
                            //         Text("Jaket Almamater", style: blackFontStyle3),
                            //         Text("100.000", style: blackFontStyle3)
                            //       ]),
                            //     ],
                            //   ),
                            // ),
                            // _dividerBlack(),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            //   child: Table(
                            //     children: [
                            //       TableRow(children: [
                            //         Text(
                            //           "Pelayanann",
                            //           style: blackFontStyle3,
                            //         ),
                            //         Text("Pelayanann", style: blackFontStyle3),
                            //         Text("100.000", style: blackFontStyle3)
                            //       ]),
                            //     ],
                            //   ),
                            // ),

                            SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: EduButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (MetodePembayran(
                                  no_virtual: widget.no_virtual == null
                                      ? ""
                                      : widget.no_virtual,
                                  kodekampus: widget.kode_campus_me == null
                                      ? ""
                                      : widget.kode_campus_me,
                                  keycode: widget.keycode == null
                                      ? ""
                                      : widget.keycode))));
                    },
                    buttonText: 'Cara Pembayaran',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            )),
                        child: TabBar(
                            controller: _tabController,
                            labelColor: blueColor,
                            indicatorColor: blueColor,
                            tabs: tabList),
                      ),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height / (1.3-plusSt),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                    child: Text(
                                      "Biaya Formulir",
                                      style: blueFontStyleBold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: mainColor1, width: 2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                          child: Table(
                                            columnWidths: {
                                              0: FlexColumnWidth(1),
                                              1: FlexColumnWidth(4),
                                              2: FlexColumnWidth(4),
                                            },
                                            children: [
                                              TableRow(children: [
                                                Text(
                                                  "Ke",
                                                  style: blueFontStyleBold,
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "Tanggal",
                                                  style: blueFontStyleBold,
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "Nominal (Rp.)",
                                                  style: blueFontStyleBold,
                                                  textAlign: TextAlign.right,
                                                )
                                              ])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                          child: _divider(),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                          child: ListView.builder(
                                              physics:
                                              NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                              dataformulir_realita.length,
                                              itemBuilder: (context, i) {
                                                return Column(
                                                  children: [
                                                    Table(
                                                      columnWidths: {
                                                        0: FlexColumnWidth(1),
                                                        1: FlexColumnWidth(4),
                                                        2: FlexColumnWidth(4),
                                                      },
                                                      children: [
                                                        TableRow(children: [
                                                          Text(
                                                            dataformulir_realita[i]
                                                                .ke,
                                                            style: blackFontStyle3,
                                                          ),
                                                          Text(
                                                              dataformulir_realita[
                                                              i]
                                                                  .tg ==
                                                                  "01/01/2000"
                                                                  ? "Belum ada data"
                                                                  : dataformulir_realita[
                                                              i]
                                                                  .tg,
                                                              style:
                                                              blackFontStyle3),
                                                          Text(
                                                            dataformulir_realita[i]
                                                                .rp ==
                                                                "1"
                                                                ? "-"
                                                                : NumberFormat.currency(
                                                                decimalDigits: 0,
                                                                symbol: '',
                                                                locale: 'id-ID')
                                                                .format(int.parse(dataformulir_realita[i]
                                                                .rp)),
                                                            style: blackFontStyle3,
                                                            textAlign:
                                                            TextAlign.right,
                                                          )
                                                        ])
                                                      ],
                                                    ),
                                                    _divider()
                                                  ],
                                                );
                                              }),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total",
                                                style: blueFontStyleBold,
                                              ),
                                              Text(
                                                //dataformulir_summarya.toString(),
                                                NumberFormat.currency(
                                                    decimalDigits: 0,
                                                    symbol: '',
                                                    locale: 'id-ID')
                                                    .format(dataformulir_summarya),
                                                style: blueFontStyle.copyWith(
                                                    fontWeight: FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //2

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                    child: Text(
                                      "Biaya Jaket",
                                      style: blueFontStyleBold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: mainColor1, width: 2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 0),
                                          child: Table(
                                            columnWidths: {
                                              0: FlexColumnWidth(1),
                                              1: FlexColumnWidth(4),
                                              2: FlexColumnWidth(4),
                                            },
                                            children: [
                                              TableRow(children: [
                                                Text(
                                                  "Ke",
                                                  style: blueFontStyleBold,
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "Tanggal",
                                                  style: blueFontStyleBold,
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "Nominal (Rp.)",
                                                  style: blueFontStyleBold,
                                                  textAlign: TextAlign.right,
                                                )
                                              ])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                          child: _divider(),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                          child: ListView.builder(
                                              physics:
                                              NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: datajaket_realita.length,
                                              itemBuilder: (context, i) {
                                                return Column(
                                                  children: [
                                                    Table(
                                                      columnWidths: {
                                                        0: FlexColumnWidth(1),
                                                        1: FlexColumnWidth(4),
                                                        2: FlexColumnWidth(4),
                                                      },
                                                      children: [
                                                        TableRow(children: [
                                                          Text(
                                                            datajaket_realita[i].ke,
                                                            style: blackFontStyle3,
                                                          ),
                                                          Text(
                                                              datajaket_realita[i]
                                                                  .tg ==
                                                                  "01/01/2000"
                                                                  ? "Belum ada data"
                                                                  : dataformulir_realita[
                                                              i]
                                                                  .tg,
                                                              style:
                                                              blackFontStyle3),
                                                          Text(
                                                            datajaket_realita[i]
                                                                .rp ==
                                                                "1"
                                                                ? "-"
                                                                : NumberFormat.currency(
                                                                decimalDigits: 0,
                                                                symbol: '',
                                                                locale: 'id-ID')
                                                                .format(int.parse(datajaket_realita[i].rp,)),
                                                            style: blackFontStyle3,
                                                            textAlign:
                                                            TextAlign.right,
                                                          )
                                                        ])
                                                      ],
                                                    ),
                                                    _divider()
                                                  ],
                                                );
                                              }),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total",
                                                style: blueFontStyleBold,
                                              ),
                                              Text(
                                                //datajaket_summarya.toString(),
                                                NumberFormat.currency(
                                                    decimalDigits: 0,
                                                    symbol: '',
                                                    locale: 'id-ID')
                                                    .format(datajaket_summarya),
                                                style: blueFontStyle.copyWith(
                                                    fontWeight: FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //3

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: mainColor1, width: 2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:
                                    _tabBarSPB(),
                                  ),
                                ],
                              ),
                            ),

                            //4

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  ),
                                  Container(
                                    height: 60,
                                    padding: EdgeInsets.only(bottom: 20),
                                    width: MediaQuery.of(context).size.width,
                                    child: dataSemester == null
                                        ? LinearProgressIndicator()
                                        : ListView.builder(
                                        itemCount: 1,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: int.parse(dataSemester[index].smt.toString())>=20?Container():CustomRadioButton(
                                              width: 70,
                                              enableShape: true,
                                              elevation: 0,
                                              padding: 5,
                                              spacing: 0.0,
                                              autoWidth: false,
                                              enableButtonWrap: true,
                                              wrapAlignment:
                                              WrapAlignment.start,
                                              horizontal: false,
                                              absoluteZeroSpacing: false,
                                              selectedColor: mainColor1,
                                              unSelectedColor:
                                              Theme.of(context).canvasColor,
                                              buttonLables:
                                              dataSemester.map((item) {
                                                return "" +
                                                    item.smt.toString();
                                              }).toList(),
                                              buttonValues:
                                              dataSemester.map((item) {
                                                return item.smt.toString();
                                              }).toList(),
                                              defaultSelected: dataSemester[0]
                                                  .smt
                                                  .toString(),
                                              buttonTextStyle: ButtonTextStyle(
                                                  selectedColor: Colors.white,
                                                  unSelectedColor: mainColor1,
                                                  textStyle: whiteFontStyle),
                                              radioButtonValue: (value) {
                                                valsemester = value;
                                                print("semester${valsemester}");

                                                setState(() {
                                                  _loadingView();
                                                  _loadingProcess("spp", value);
                                                });
                                              },
                                            ),
                                          );
                                        }),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: mainColor1, width: 2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        _tabBarSPP()
                                      ],
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
                )
              ],
            ),
          )),
    );
  }

  void _loadingProcess(var cat, var value) {
    Future.delayed(const Duration(seconds:0), () {
      setState(() {
        if (cat == "spp") {
          valsemester = value;
          print("ehini: $valsemester");
          spp_rencana_data();
          spp_realita_data();
        } else if (cat == "spb") {
          // valsemester = value;
          // data();
          // _loadingfSpb = false;
        }
      });
    });
  }

  Widget _tabBarSPB(){
    return Column(
      children: [
        ExpansionTile(
          onExpansionChanged: (ex){
            if(ex){
              setState(() {
                plusSt = 0.5;
              });
            } else {
              setState(() {
                plusSt = 0.0;
              });
            }
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sumbangan Pengembangan (SPb) Realita",
                textAlign: TextAlign.start,
                style: blueFontStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Rincian biaya",
                style: blackFontStyle3.copyWith(fontSize: 9),
              ),
            ],
          ),
          children: [
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(4),
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Ke",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Tanggal",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Nominal (Rp.)",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.right,
                    )
                  ])
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: _divider(),
            ),
            Container(
              height:
              MediaQuery.of(context).size.height /
                  2.8,
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                //physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataSPb_realita.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(4),
                          },
                          children: [
                            TableRow(children: [
                              Text(
                                dataSPb_realita[i].ke,
                                style: blackFontStyle3,
                              ),
                              Text(
                                  dataSPb_realita[i].tg == "01/01/2000"
                                      ? "Belum ada data"
                                      : dataSPb_realita[i].tg,
                                  style:
                                  blackFontStyle3),
                              Text(
                                dataSPb_realita[i].rp == "1"
                                    ? "-"
                                    : NumberFormat.currency(
                                    decimalDigits: 0,
                                    symbol: '',
                                    locale: 'id-ID')
                                    .format(int.parse(dataSPb_realita[i].rp)),
                                style: blackFontStyle3,
                                textAlign:
                                TextAlign.right,
                              ),
                            ])
                          ],
                        ),
                        _divider()
                      ],
                    );
                  }),
            ),
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: blueFontStyleBold,
                  ),
                  Text(
                    NumberFormat.currency(
                        decimalDigits: 0,
                        symbol: '',
                        locale: 'id-ID')
                        .format(dataSPb_summarya),
                    style: blueFontStyle.copyWith(
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
        ExpansionTile(
          onExpansionChanged: (ex){
            if(ex){
              setState(() {
                plusSt = 0.5;
              });
            } else {
              setState(() {
                plusSt = 0.0;
              });
            }
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sumbangan Pengembangan (SPb) Rencana",
                textAlign: TextAlign.start,
                style: blueFontStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Rincian biaya",
                style: blackFontStyle3.copyWith(fontSize: 9),
              ),
            ],
          ),
          children: [
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(4),
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Ke",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Tanggal",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Nominal (Rp.)",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.right,
                    )
                  ])
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: _divider(),
            ),
            Container(
              height:
              MediaQuery.of(context).size.height /
                  2.8,
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                //physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataSPb_rencana.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(4),
                          },
                          children: [
                            TableRow(children: [
                              Text(
                                dataSPb_rencana[i].ke,
                                style: blackFontStyle3,
                              ),
                              Text(
                                  dataSPb_rencana[i].tg == "01/01/2000"
                                      ? "Belum ada data"
                                      : dataSPb_rencana[i].tg,
                                  style:
                                  blackFontStyle3),
                              Text(
                                dataSPb_rencana[i].rp == "1"
                                    ? "-"
                                    : NumberFormat.currency(
                                    decimalDigits: 0,
                                    symbol: '',
                                    locale: 'id-ID')
                                    .format(int.parse(dataSPb_rencana[i].rp)),
                                style: blackFontStyle3,
                                textAlign:
                                TextAlign.right,
                              ),
                            ])
                          ],
                        ),
                        _divider()
                      ],
                    );
                  }),
            ),
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: blueFontStyleBold,
                  ),
                  Text(
                    NumberFormat.currency(
                        decimalDigits: 0,
                        symbol: '',
                        locale: 'id-ID')
                        .format(dataSPb_summaryr),
                    style: blueFontStyle.copyWith(
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _tabBarSPP(){
    return Column(
      children: [
        ExpansionTile(
          onExpansionChanged: (ex){
            if(ex){
              setState(() {
                plusSt = 0.5;
              });
            } else {
              setState(() {
                plusSt = 0.0;
              });
            }
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Biaya PerSemester (SPp) Realita",
                textAlign: TextAlign.start,
                style: blueFontStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Rincian biaya",
                style: blackFontStyle3.copyWith(fontSize: 9),
              ),
            ],
          ),
          children: [
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(4),
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Ke",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Tanggal",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Nominal (Rp.)",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.right,
                    )
                  ])
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: _divider(),
            ),
            Container(
              height:
              MediaQuery.of(context).size.height /
                  3.5,
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                //physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data_spp_realita.length,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Column(
                        children: [
                          Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(4),
                            },
                            children: [
                              TableRow(children: [
                                Text(
                                  data_spp_realita[i].ke == "tes"
                                      ? "-"
                                      : data_spp_realita[i].ke,
                                  style: blackFontStyle3,
                                ),
                                Text(
                                    data_spp_realita[i].tg == "01/01/2000"
                                        ? "Belum ada data"
                                        : data_spp_realita[i].tg,
                                    style:
                                    blackFontStyle3),
                                Text(
                                  data_spp_realita[i].rp,
                                  style: blackFontStyle3,
                                  textAlign: TextAlign.right,
                                ),
                              ])
                            ],
                          ),
                          _divider()
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: blueFontStyleBold,
                  ),
                  Text(
                    sppTotal_realita.toString(),
                    style: blueFontStyleBold,
                  )
                ],
              ),
            )
          ],
        ),
        ExpansionTile(
          onExpansionChanged: (ex){
            if(ex){
              setState(() {
                plusSt = 0.5;
              });
            } else {
              setState(() {
                plusSt = 0.0;
              });
            }
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Biaya PerSemester (SPp) Rencana",
                textAlign: TextAlign.start,
                style: blueFontStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Rincian biaya",
                style: blackFontStyle3.copyWith(fontSize: 9),
              ),
            ],
          ),
          children: [
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(4),
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Ke",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Tanggal",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Nominal (Rp.)",
                      style: blueFontStyleBold,
                      textAlign: TextAlign.right,
                    )
                  ])
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: _divider(),
            ),
            Container(
              height:
              MediaQuery.of(context).size.height /
                  3.5,
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                //physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data_spp_rencana.length,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Column(
                        children: [
                          Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(4),
                            },
                            children: [
                              TableRow(children: [
                                Text(
                                  data_spp_rencana[i].ke == "tes"
                                      ? "-"
                                      : data_spp_rencana[i].ke,
                                  style: blackFontStyle3,
                                ),
                                Text(
                                    data_spp_rencana[i].tg == "01/01/2000"
                                        ? "Belum ada data"
                                        : data_spp_rencana[i].tg,
                                    style:
                                    blackFontStyle3),
                                Text(
                                  data_spp_rencana[i].rp,
                                  style: blackFontStyle3,
                                  textAlign: TextAlign.right,
                                ),
                              ])
                            ],
                          ),
                          _divider()
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              padding:
              EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: blueFontStyleBold,
                  ),
                  Text(
                    sppTotal_rencana.toString(),
                    style: blueFontStyleBold,
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}