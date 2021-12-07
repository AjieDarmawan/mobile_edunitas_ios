part of 'widget_home.dart';

class InvoiceStruk extends StatefulWidget {
  final Transaction2Model params;
  final String logo,
      nama,
      singktan,
      formulir,
      keycode,
      namaJurusan,
      kodekampus,
      id_invoice,
      waktu;
  InvoiceStruk(
      {this.params,
      this.logo,
      this.nama,
      this.singktan,
      this.formulir,
      this.keycode,
      this.namaJurusan,
      this.kodekampus,
      this.id_invoice,this.waktu});

  @override
  _InvoiceStrukState createState() => _InvoiceStrukState();
}

class _InvoiceStrukState extends State<InvoiceStruk> {
  String logometode, namametode, no_pembayaran_pev;
  List<MetodePembayaranModel> datametodepembayran = new List();
  void getmetodepembayaran() async {
    Masterview_model()
        .metodepembayaran(
            widget.kodekampus.toString(), widget.keycode.toString())
        .then((value2) {
      setState(() {
        datametodepembayran = value2;
        logometode = datametodepembayran[0].logo;
        namametode = datametodepembayran[0].metode;
        no_pembayaran_pev = datametodepembayran[0].no_pembayaran_pev;
      });
    });
  }

  String no_virtual = "";
  void getva() async {
    Masterview_model()
        .va(
      widget.keycode.toString(),
      widget.id_invoice.toString(),
    )
        .then((value2) {
      LoginModel data = value2;
      if (data.status == 200) {
        setState(() {
          no_virtual = data.message;
        });
      }
    });
  }

  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  SessionManager sessionManager = SessionManager();
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {
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
  void datausers(globalemail) {
    UserViewModel().users_detail(globalemail).then((value) {
      UsersDetailModel data = value;

      if (data.status == 200) {
        setState(() {
          varnama = data.nama;
          varemail = data.email;
          varalamat = data.alamat;
          varpendidikan = data.pendidikan;
          varnohp = data.noHp;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getmetodepembayaran();
    getva();
    getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    datausers(globalEmail);

    // print("nama${datametodepembayran.length}");
    //  print("nama_kodekampus${widget.kodekampus}");
    //   print("nama_id_invoice${widget.id_invoice}");

    print("logo${widget.logo}");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: mainColor1,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor1,
        title: Text("Invoice Terbayar", style: whiteFontStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 56,
              color: Colors.green,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.params.billtype,
                        style: whiteFontStyle.copyWith(
                            fontWeight: FontWeight.bold)),
                    Text("LUNAS", style: whiteFontStyle),
                  ]),
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 1.0)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: widget.logo == null
                        ? Text("")
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                Image.network(widget.logo, fit: BoxFit.cover),
                          ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nama,
                            style: blackFontStyle1.copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(height: 5),
                          Text(widget.namaJurusan,
                              style: blueFontStyle.copyWith(fontSize: 12)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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

                // Isi data
                Container(
                  child: widget.params == null
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Table(
                                children: [
                                  TableRow(children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Formulir",
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
                                            .format(
                                                double.parse(widget.formulir)),
                                        style: blueFontStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ])
                                ],
                              )
                            ],
                          ),
                        )
                      : Column(
                          children:
                              widget.params.params.map<Widget>((document) {
                          var data = document.split('#');

                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    TableRow(children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          data[0],
                                          style: blueFontStyle,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          data[1],
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
                                              .format(double.parse(data[2])),
                                          style: blueFontStyle,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList()),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                                    .format(double.parse(widget.formulir)),
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
              ],
            ),

            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 20),
            //   height: 100,
            //   child: namametode == null
            //       ? Center(child: CircularProgressIndicator())
            //       : FlatButton(
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => (MetodePembayran(
            //                         kodekampus: widget.kodekampus == null
            //                             ? ""
            //                             : widget.kodekampus,
            //                         keycode: widget.keycode == null
            //                             ? ""
            //                             : widget.keycode))));
            //           },
            //           child: Card(
            //               shape: RoundedRectangleBorder(
            //                   side: BorderSide(color: mainColor1, width: 1),
            //                   borderRadius: BorderRadius.circular(10)),
            //               color: Colors.white,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Container(
            //                       width: 30,
            //                       height: 30,
            //                       color: Colors.grey,
            //                       child: Image.network(
            //                           logometode == null ? "" : logometode)),
            //                   Text(namametode == null ? "" : namametode,
            //                       style: TextStyle(color: mainColor1)),
            //                   Container(
            //                     width: 100,
            //                   ),
            //                   Icon(
            //                     Icons.navigate_next,
            //                     color: mainColor1,
            //                   )
            //                 ],
            //               )),
            //         ),
            // ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: no_virtual == null
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("No Virtual Akun",
                              style: blackFontStyle3.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.copy,
                                  color: mainColor1,
                                ),
                                onPressed: () {
                                  Clipboard.setData(new ClipboardData(
                                      text: no_virtual.toString()));
                                  Fluttertoast.showToast(
                                      msg: "Copied",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16.0);
                                },
                              ),
                              Text(no_virtual.toString(), style: blueFontStyle)
                            ],
                          )
                        ],
                      )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nama Pelanggan",
                        style: blackFontStyle3.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(varnama == null ? "" : varnama,
                        style: blackFontStyle3.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                )),
            SizedBox(height: 24),
             Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tanggal Bayar",
                        style: blackFontStyle3.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(widget.waktu.toString == null ? "" : widget.waktu.toString(),
                        style: blackFontStyle3.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                )),
                SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: mainColor1, width: 0.5),
                  bottom: BorderSide(color: mainColor1, width: 0.5),
                ),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (MetodePembayran(
                              no_virtual: no_virtual == null ? "" : no_virtual,
                              kodekampus: widget.kodekampus == null
                                  ? ""
                                  : widget.kodekampus,
                              keycode: widget.keycode == null
                                  ? ""
                                  : widget.keycode))));
                },
                child: Container(),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: 250,
              height: 48,
              child: EduButtonSecond(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                buttonText: "Selesai",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
