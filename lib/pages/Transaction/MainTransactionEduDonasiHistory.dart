part of 'transaction.dart';

class MainTransactionEduDonasiHistory extends StatefulWidget {
  // MainTransactionEduDonasiHistory({Key key}) : super(key: key);
  final String kodecampus;
  MainTransactionEduDonasiHistory({
    this.kodecampus,
  });

  @override
  _MainTransactionEduDonasiHistoryState createState() =>
      _MainTransactionEduDonasiHistoryState();
}

class _MainTransactionEduDonasiHistoryState
    extends State<MainTransactionEduDonasiHistory> {
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

  var datatrans = [];
  void getdatatrans(globalkey2) {
    print("globalkey2${globalkey.toString()}");
    Transactionview_model()
        .transaction_donasi_history(globalkey2)
        .then((value1) {
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
    //getPreferences();
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
                                    return datatrans[0].cid == "tes"
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
                                                        builder: (context) =>
                                                            (InvoiceDonasiStruk(
                                                              no_reff: datatrans[
                                                                              index]
                                                                          .noreff
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .noreff
                                                                      .toString(),
                                                              trx_id: datatrans[
                                                                              index]
                                                                          .trx_id
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .trx_id
                                                                      .toString(),
                                                              nopembayaran: datatrans[
                                                                              index]
                                                                          .nopembayaran
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .nopembayaran
                                                                      .toString(),
                                                              donaturname: datatrans[
                                                                              index]
                                                                          .donaturname
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .donaturname
                                                                      .toString(),
                                                              isanonim: datatrans[
                                                                              index]
                                                                          .isanonim
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .isanonim
                                                                      .toString(),
                                                              nowa: datatrans[index]
                                                                          .nowa
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .nowa
                                                                      .toString(),
                                                              notlp: datatrans[
                                                                              index]
                                                                          .notlp
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .notlp
                                                                      .toString(),
                                                              nominal: datatrans[
                                                                              index]
                                                                          .nominal
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .nominal
                                                                      .toString(),
                                                              champaigner: datatrans[
                                                                              index]
                                                                          .champaigner
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .champaigner
                                                                      .toString(),
                                                              judul: datatrans[
                                                                              index]
                                                                          .judul
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .judul
                                                                      .toString(),
                                                              seolink: datatrans[
                                                                              index]
                                                                          .seolink
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .seolink
                                                                      .toString(),
                                                              novirtual_bni: datatrans[
                                                                              index]
                                                                          .novirtualBni
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .novirtualBni
                                                                      .toString(),
                                                              channel: datatrans[
                                                                              index]
                                                                          .channel
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .channel
                                                                      .toString(),
                                                              method: datatrans[
                                                                              index]
                                                                          .metode
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .metode
                                                                      .toString(),
                                                              images: datatrans[
                                                                              index]
                                                                          .images
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .images
                                                                      .toString(),
                                                              label_an: "",
                                                              label_rek: "",
                                                              label_bank: "",
                                                              loopitem: "",
                                                              routeref:
                                                                  "transaksi",
                                                              nama_bank: datatrans[
                                                                              index]
                                                                          .nama_bank
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .nama_bank
                                                                      .toString(),
                                                              txttime: datatrans[
                                                                              index]
                                                                          .txttime
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .txttime
                                                                      .toString(),
                                                              txtdate: datatrans[
                                                                              index]
                                                                          .txtdate
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .txtdate
                                                                      .toString(),
                                                              nominaltrf: datatrans[
                                                                              index]
                                                                          .nominaltrf
                                                                          .toString() ==
                                                                      null
                                                                  ? ""
                                                                  : datatrans[
                                                                          index]
                                                                      .nominaltrf
                                                                      .toString(),
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
                                                                              .trx_id ==
                                                                          null
                                                                      ? ""
                                                                      : datatrans[
                                                                              index]
                                                                          .trx_id,
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
                                                                    "Suksess",
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
                                                                        .nama ==
                                                                    null
                                                                ? ""
                                                                : datatrans[
                                                                        index]
                                                                    .nama,
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
                                                                        .singkatan ==
                                                                    null
                                                                ? ""
                                                                : datatrans[
                                                                        index]
                                                                    .singkatan,
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
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            datatrans[index]
                                                                        .tanggal ==
                                                                    null
                                                                ? ""
                                                                : datatrans[
                                                                        index]
                                                                    .tanggal,
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
                                                                    datatrans[index].title ==
                                                                            null
                                                                        ? ""
                                                                        : datatrans[index]
                                                                            .title,
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
                                                                            .format(datatrans[index].nominaltrf),
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
