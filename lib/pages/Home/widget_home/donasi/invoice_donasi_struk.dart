part of 'widget_donasi.dart';

class InvoiceDonasiStruk extends StatefulWidget {
  final String trx_id,
      nopembayaran,
      donaturname,
      isanonim,
      nowa,
      notlp,
      nominal,
      champaigner,
      judul,
      seolink,
      novirtual_bni,
      channel,
      method,
      label_an,
      label_rek,
      label_bank,
      loopitem,
      nominaltrf,
      routeref,
      nama_bank,
      txttime,
      txtdate,
      images,
      no_reff;

  InvoiceDonasiStruk({
    this.trx_id,
    this.nopembayaran,
    this.donaturname,
    this.isanonim,
    this.nowa,
    this.notlp,
    this.nominal,
    this.champaigner,
    this.judul,
    this.seolink,
    this.novirtual_bni,
    this.channel,
    this.method,
    this.label_an,
    this.label_rek,
    this.label_bank,
    this.loopitem,
    this.nominaltrf,
    this.routeref,
    this.no_reff,
    this.nama_bank,
    this.txttime,
    this.images,
    this.txtdate,
  });

  @override
  _InvoiceDonasiStrukState createState() => _InvoiceDonasiStrukState();
}

class _InvoiceDonasiStrukState extends State<InvoiceDonasiStruk> {
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  //  final updateAction = () {
  //     _launched = _launchInBrowser('https://play.google.com/store/apps/details?id='+androidApplicationId);
  //     Navigator.pop(context);
  //   };

  DonasiDetailModel datadonasi;
  double _percent = 0.0;
  String _instansi_label = "";
  String _cover = "";
  String _donasi = "";
  String _judul = "";
  String _dkumpul = "";
  String _dhingga = "";
  String _dtarget = "";
  void getdonasidetail() {
    Donasiview_model().getDetail(widget.seolink).then((value1) {
      //handled
      setState(() {
        datadonasi = value1 == null ? null : value1;
        //lenght = datadonasi==null?0:1;//is this even list
        //_percent = datadonasi.persentase;
        _percent = double.parse("0." + datadonasi.persentase.toString().replaceAll(".", ""));
        _instansi_label = datadonasi.instansi_label;
        _cover = datadonasi.cover;
        _donasi = datadonasi.donasi;
        _judul = datadonasi.judul;
        _dkumpul = datadonasi.terkumpul;
        _dhingga = datadonasi.hingga;
        _dtarget = datadonasi.target;
      });
    }).catchError((erro) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getdonasidetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Invoice Pembayaran Donasi',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 56,
              color: Colors.green,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Konfirmasi Pembayaran Donasi",
                        style: whiteFontStyle.copyWith(
                            fontWeight: FontWeight.bold)),
                    Text("LUNAS", style: whiteFontStyle),
                  ]),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                border: Border.all(color: mainColor1, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.volunteer_activism,
                              color: orenColor,
                              size: 48,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Penggalang Dana",
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.champaigner.toString() == null
                                    ? ""
                                    : widget.champaigner.toString(),
                                style: blackFontStyle3,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                      color: mainColor1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dana Terkumpul :",
                                style: blackFontStyle3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Rp. " + _dkumpul,
                                    style: blueFontStyle.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Dari: Rp. " + _dtarget,
                                      style: blackFontStyle3),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 18,
                                  child: new LinearPercentIndicator(
                                    animation: false,
                                    lineHeight: 20.0,
                                    percent: 0.5,
                                    center: Text(""),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: orenColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Hingga: " + _dhingga,
                                style: blueFontStyle.copyWith(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Card(
                      color: abuColor,
                      borderOnForeground: true,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        widget.judul.toString() == null
                            ? ""
                            : widget.judul.toString(),
                        style: blueFontStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  color: Colors.blue[100],
                  child: Table(
                    children: [
                      TableRow(
                          decoration: BoxDecoration(color: Colors.blue[100]),
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Item",
                                style: blueFontStyle,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Pembayaran",
                                style: blueFontStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Nominal",
                                style: blueFontStyle,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Donasi",
                              style: blueFontStyle,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "1",
                              style: blueFontStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              NumberFormat.currency(
                                      symbol: 'Rp ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                  .format(double.parse(widget.nominal)),
                              style: blueFontStyle,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ])
                      ],
                    )

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Donasi",
                    //       style: blackFontStyle3.copyWith(fontSize: 13),
                    //     ),
                    //     Text(
                    //       "1",
                    //       style: blackFontStyle3.copyWith(fontSize: 13),
                    //     ),
                    //     Text(
                    //       widget.nominal.toString(),
                    //       style: blackFontStyle3.copyWith(fontSize: 13),
                    //     ),
                    //   ],
                    // ),
                    ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Table(
                    children: [
                      TableRow(
                          decoration: BoxDecoration(color: mainColor1),
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Total",
                                style: whiteFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "",
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                NumberFormat.currency(
                                        symbol: 'Rp ',
                                        decimalDigits: 0,
                                        locale: 'id-ID')
                                    .format(double.parse(widget.nominal)),
                                style: whiteFontStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(12),
                //   color: mainColor1,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Total Pembayaran",
                //         style: whiteFontStyle.copyWith(fontSize: 13),
                //       ),
                //       Text(
                //         "Rp. ${widget.nominal.toString()},-",
                //         style: whiteFontStyle.copyWith(
                //             fontSize: 16, fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),

                // Container(
                //   padding: EdgeInsets.all(12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Lembaga Penggalang Dana",
                //         style: blackFontStyle3,
                //       ),
                //       Text(
                //         "eduNitas",
                //         style: blackFontStyle3,
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.all(12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Donatur",
                //         style: blackFontStyle3.copyWith(fontSize: 13),
                //       ),
                //       Text(
                //           widget.donaturname.toString() == null
                //               ? ""
                //               : widget.donaturname.toString(),
                //           maxLines: 1,
                //           softWrap: false,
                //           overflow: TextOverflow.clip,
                //           style: blackFontStyle3.copyWith(
                //             fontSize: 13,
                //           )),
                //     ],
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180,
                        child: Text("Lembaga Penggalang Dana",
                            style: blackFontStyle3.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                          child: Text(
                        'eduNitas',
                        style: blueFontStyle.copyWith(fontSize: 12),
                        textAlign: TextAlign.right,
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180,
                        child: Text("Donatur",
                            style: blackFontStyle3.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: Text(
                          widget.donaturname.toString() == null
                              ? ""
                              : widget.donaturname.toString(),
                          maxLines: 2,
                          style: blueFontStyle.copyWith(fontSize: 12),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 24),
              child: Column(
                children: [
                  widget.images == null
                      ? Container()
                      : EduButton(
                          buttonText: "Lihat Struk",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (Lihat_struk(
                                          method: widget.method,
                                          nama_bank: widget.nama_bank,
                                          txttime: widget.txttime,
                                          txtdate: widget.txtdate,
                                          images: widget.images,
                                        ))));
                          },
                        ),
                  SizedBox(
                    height: 16,
                  ),
                  EduButtonSecond(
                    buttonText: "Cetak",
                    onPressed: () {
                      setState(() {
                        _launched = _launchInBrowser(
                            "https://edunitas.com/file/invoice/${widget.seolink}_${widget.no_reff}.pdf");
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
