part of 'transaction.dart';

class MainTransactionEduCampusHistory extends StatefulWidget {
  // MainTransactionEduCampusHistory({Key key}) : super(key: key);
  final String kodecampus;
  MainTransactionEduCampusHistory({
    this.kodecampus,
  });

  @override
  _MainTransactionEduCampusHistoryState createState() =>
      _MainTransactionEduCampusHistoryState();
}

class _MainTransactionEduCampusHistoryState
    extends State<MainTransactionEduCampusHistory> {
  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  SessionManager sessionManager = SessionManager();
  // var gabs = CryptoData.getData;
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {
      //handled
      setState(() {
        mystatus = sessionManager.status;
        globalkey = sessionManager.key;
        globalEmail = sessionManager.email;
        print("email${globalEmail}");
        print("globalkey${globalkey}");
        print("mystatus${mystatus}");
      });
    });
    List<String> _statusPembayaran = ["Menunggu Pembayaran", "Sukses", "Gagal"];
  }

  String _wStatus(stat) {
    String finStatus;
    if (stat == "1") finStatus = "Menunggu Pembayaran";
    if (stat == "0") finStatus = "Sukses";
    if (stat == "2") finStatus = "Gagal";
    return finStatus;
  }

  MaterialColor _wColor(stat) {
    MaterialColor coloru;
    if (stat == "1") coloru = Colors.yellow;
    if (stat == "0") coloru = Colors.green;
    if (stat == "2") coloru = Colors.red;
    return coloru;
  }

  var datatrans = [];
  void getdatatrans(globalkey2) {
    print("globalkey2${globalkey.toString()}");
    Transactionview_model().getransactionHistory(globalkey2).then((value1) {
      //handled
      print(value1);
      setState(() {
        datatrans = value1;
      });
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  void onErrHandling(erro) {
    print("do_login_err: " + erro.toString());
    if (erro.toString().contains("SocketException")) {
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
                getdatatrans(globalkey);
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  @override
  void initState() {
    super.initState();
    //getdatatrans();
    getPreferences();
    getdatatrans(globalkey);
    // setState(() {
    //   globalkey = globalkey;
    // });
  }

  @override
  Widget build(BuildContext context) {
    getdatatrans(globalkey);
    print("datatrans${datatrans}");
    return Scaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        body: Container(
            child: globalkey == null
                ? NonLogin()
                : Container(
              child: datatrans == null || datatrans.length == 0
                  ? Center(child: SpinKitThreeBounce(color: mainColor1))
                  : Center(
                child: Container(
                  child: ListView.builder(
                      itemCount: datatrans.length == 0
                          ? 0
                          : datatrans.length,
                      itemBuilder: (context, index) {
                        return datatrans[0].noinvoice == "tes"
                            ? Container(
                            height: MediaQuery.of(context)
                                .size
                                .height /
                                1.3,
                            child: NoTransaction())
                            : Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              elevation: 2,
                              margin: EdgeInsets.fromLTRB(
                                  10, 10, 10, 0),
                              borderOnForeground: true,
                              child: InkWell(
                                customBorder:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder:
                                              (context) =>
                                          (InvoiceStruk(
                                            id_invoice: datatrans[index]
                                                .id ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index]
                                                .id,
                                            logo: datatrans[index]
                                                .logo ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index]
                                                .logo,
                                            nama: datatrans[index]
                                                .kampus ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index]
                                                .kampus,
                                            singktan: datatrans[index]
                                                .singkatan ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index]
                                                .singkatan,
                                            formulir: datatrans[index]
                                                .totalpembayaran ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index]
                                                .totalpembayaran,
                                            keycode: globalkey ==
                                                null
                                                ? ""
                                                : globalkey,
                                            namaJurusan: datatrans[index]
                                                .prodi ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index]
                                                .prodi,
                                            kodekampus: widget
                                                .kodecampus ==
                                                null
                                                ? ""
                                                : widget
                                                .kodecampus,
                                            params: datatrans[
                                            index] ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index],
                                            waktu: datatrans[index]
                                                .waktu ==
                                                null
                                                ? ""
                                                : datatrans[
                                            index]
                                                .waktu,
                                            bayar_tiap_tanggal:
                                            datatrans[
                                            0]
                                                .setiap,
                                          ))));
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        "Invoice No",
                                                        style: blackFontStyle3
                                                            .copyWith(
                                                            fontSize:
                                                            10),
                                                      ),
                                                      Text(
                                                        datatrans[index]
                                                            .noinvoice ==
                                                            null
                                                            ? ""
                                                            : datatrans[
                                                        index]
                                                            .noinvoice,
                                                        style: blueFontStyle.copyWith(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                        textAlign:
                                                        TextAlign
                                                            .left,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                              child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      15.0),
                                                  child:
                                                  Container(
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                    height: 30,
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        20),
                                                    color: Colors
                                                        .green,
                                                    child: Text(
                                                      datatrans[index].status ==
                                                          null
                                                          ? ""
                                                          : "Suksess",
                                                      style: whiteFontStyle.copyWith(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize:
                                                          11),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.black38,
                                          height: 20,
                                          thickness: 1,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              datatrans[index]
                                                  .kampus ==
                                                  null
                                                  ? ""
                                                  : datatrans[
                                              index]
                                                  .kampus,
                                              style: blackFontStyle1
                                                  .copyWith(
                                                  fontSize:
                                                  12,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              textAlign:
                                              TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              datatrans[index]
                                                  .prodi ==
                                                  null
                                                  ? ""
                                                  : datatrans[
                                              index]
                                                  .prodi,
                                              style: blackFontStyle2
                                                  .copyWith(
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontSize:
                                                  14),
                                              textAlign:
                                              TextAlign.left,
                                            ),
                                            Divider(
                                              color:
                                              Colors.black38,
                                              height: 20,
                                              thickness: 1,
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.of(
                                                  context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width /
                                                        1.9,
                                                    height: 40,
                                                    child: Text(
                                                      datatrans[index].billtype ==
                                                          null
                                                          ? ""
                                                          : datatrans[index]
                                                          .billtype,
                                                      style: blueFontStyle.copyWith(
                                                          fontSize:
                                                          12,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      textAlign:
                                                      TextAlign
                                                          .left,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          NumberFormat.currency(
                                                              symbol: 'Rp ',
                                                              decimalDigits: 0,
                                                              locale: 'id-ID')
                                                              .format(double.parse(datatrans[index].totalpembayaran)),
                                                          style: blueFontStyle.copyWith(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 16),
                                                          textAlign:
                                                          TextAlign.left,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ));
                      }),
                ),
              ),
            )));
  }
}

// class CryptoData {
//   static final getData = [
//     {
//       'nameUnv': 'UM Surabaya',
//       'fnameUnv': 'Univesitas Muhammadiyah Surabaya',
//       'status': '0',
//       'jurusan': 'D3 - Usaha Perjalanan Wisata',
//       'item': 'Formulir Pembayaran',
//       'harga': '100.000'
//     },
//     {
//       'nameUnv': 'Polnas',
//       'fnameUnv': 'Politeknik Nasional Denpasar',
//       'status': '2',
//       'jurusan': 'D3 - Usaha Perjalanan Wisata',
//       'item': 'Formulir Pembayaran',
//       'harga': '100.000'
//     }
//   ];
// }
