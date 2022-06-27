part of 'transaction.dart';

class MainTransactionEduDonation extends StatefulWidget {
  MainTransactionEduDonation({Key key}) : super(key: key);

  @override
  _MainTransactionEduDonationState createState() =>
      _MainTransactionEduDonationState();
}

class _MainTransactionEduDonationState
    extends State<MainTransactionEduDonation> {
  DateTime currentBackPressTime;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "Tekan sekali lagi untuk keluar",
          backgroundColor: yellowColor,
          textColor: mainColor1,
          gravity: ToastGravity.BOTTOM);
      return Future.value(false);
    }
    return SystemNavigator.pop();
  }

  var biayapelayanan = "2000";
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

  String stat = "1";
  String _wStatus(stat) {
    String finStatus;
    setState(() {
      if (stat == "1") finStatus = "Menunggu Pembayaran";
      if (stat == "0") finStatus = "Sukses";
      if (stat == "2") finStatus = "Gagal";
    });
    return finStatus;
  }

  MaterialColor _wColor(stat) {
    MaterialColor coloru;
    setState(() {
      if (stat == "1") coloru = Colors.yellow;
      if (stat == "0") coloru = Colors.green;
      if (stat == "2") coloru = Colors.red;
    });

    return coloru;
  }

  var datatrans = [];
  var data = [];
  List<Params> item;
  void getdatatrans(globalkey2) {
    print("globalkey2${globalkey.toString()}");
    Transactionview_model().transaction_donasi(globalkey2).then((value1) {
      //handled
      print(value1);
      setState(() {
        datatrans = value1;
      });
    }).catchError((erro) {
      print("do_list_transaction_err: " + erro.toString());
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
                  conn();
                  getdatatrans(globalkey2);
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      } else {
        Flushbar(
            title: "Mohon Maaf",
            message: "Terjadi kesalahan, mohon hubungi pihak Edunitas",
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
                  conn();
                  getdatatrans(globalkey2);
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    });
  }

  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void fcm() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        FlutterRingtonePlayer.playNotification();
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onResume: $message");
      },
    );
    //ios only
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: $token";
      });
      print(_homeScreenText);
    });
  }

  //conn has been updated 22 August 2021
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
          getData();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
          getData();
        } else {
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  Future getData() async {
    fcm();
    getdatatrans(globalkey);
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
    conn();
  }

  Widget shimmerLoading() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[350],
            highlightColor: Colors.white,
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350])),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350])),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("datatrans${datatrans}");
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        body: RefreshIndicator(
          child: Container(
              child: globalkey == null
                  ? NonLogin()
                  : Container(
                child: datatrans == null
                    ? ErrorDataHandler(context)
                    : datatrans.length == 0
                    ? shimmerLoading()
                    : Container(
                  child: datatrans[0].cid == "tes"
                      ? Container(
                      height:
                      MediaQuery.of(context).size.height /
                          1.3,
                      child: NoTransaction())
                      : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        10)),
                                elevation: 2,
                                margin: EdgeInsets.all(10),
                                borderOnForeground: true,
                                child: InkWell(
                                  customBorder:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        10),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            (InvoiceDonasi(
                                              trx_id: datatrans[0].trx_id.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .trx_id
                                                  .toString(),
                                              nopembayaran: datatrans[0].nopembayaran.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .nopembayaran
                                                  .toString(),
                                              donaturname: datatrans[0].donaturname.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .donaturname
                                                  .toString(),
                                              isanonim: datatrans[0].isanonim.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .isanonim
                                                  .toString(),
                                              nowa: datatrans[0].nowa.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .nowa
                                                  .toString(),
                                              notlp: datatrans[0].notlp.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .notlp
                                                  .toString(),
                                              nominal: datatrans[0].nominal.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .nominal
                                                  .toString(),
                                              champaigner: datatrans[0].champaigner.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .champaigner
                                                  .toString(),
                                              judul: datatrans[0].judul.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .judul
                                                  .toString(),
                                              seolink: datatrans[0].seolink.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .seolink
                                                  .toString(),
                                              novirtual_bni: datatrans[0].novirtualBni.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .novirtualBni
                                                  .toString(),
                                              channel: datatrans[0].channel.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .channel
                                                  .toString(),
                                              method: datatrans[0].metode.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .metode
                                                  .toString(),
                                              label_an:
                                              "",
                                              label_rek:
                                              "",
                                              label_bank:
                                              "",
                                              loopitem:
                                              "",
                                              routeref:
                                              "transaksi",
                                              nominaltrf: datatrans[0].nominaltrf.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[0]
                                                  .nominaltrf
                                                  .toString(),
                                            ))));
                                  },
                                  child: Container(
                                      padding:
                                      EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                datatrans[0].tanggal ==
                                                    null
                                                    ? ""
                                                    : datatrans[
                                                0]
                                                    .tanggal,
                                                style: blackFontStyle3
                                                    .copyWith(
                                                    fontSize:
                                                    12),
                                                overflow:
                                                TextOverflow
                                                    .ellipsis,
                                                textAlign:
                                                TextAlign
                                                    .left,
                                              ),
                                              Container(
                                                margin: EdgeInsets
                                                    .only(
                                                    left:
                                                    10),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(12.0),
                                                    child: Container(
                                                      alignment:
                                                      Alignment.center,
                                                      height:
                                                      24,
                                                      padding:
                                                      EdgeInsets.symmetric(horizontal: 10),
                                                      color: Colors
                                                          .red,
                                                      child:
                                                      Text(
                                                        "Tagihan",
                                                        style: whiteFontStyle.copyWith(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 11),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors
                                                .black38,
                                            height: 20,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                datatrans[0]
                                                    .title
                                                    .toString() ==
                                                    null
                                                    ? ""
                                                    : datatrans[
                                                0]
                                                    .title
                                                    .toString(),
                                                style: blueFontStyle.copyWith(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                              Divider(
                                                color: Colors
                                                    .black38,
                                                height: 20,
                                                thickness: 1,
                                              ),
                                              Container(
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.symmetric(
                                                          horizontal:
                                                          10),
                                                      child:
                                                      Container(
                                                        width:
                                                        48,
                                                        height:
                                                        48,
                                                        decoration:
                                                        BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(color: Colors.black38, offset: Offset(0.0, 0.0), blurRadius: 1.0)
                                                          ],
                                                          borderRadius:
                                                          BorderRadius.circular(10),
                                                          image:
                                                          DecorationImage(image: NetworkImage(datatrans[0].logo), fit: BoxFit.cover),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width /
                                                          1.45,
                                                      child:
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            datatrans[0].kampus == null ? "" : datatrans[0].kampus,
                                                            style: blackFontStyle3.copyWith(fontSize: 12),
                                                            //maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                          ),
                                                          Text(
                                                            datatrans[0].singkatan == null ? "" : datatrans[0].singkatan,
                                                            style: blackFontStyle3.copyWith(fontSize: 12),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                          // Text(
                                                          //   datatrans[0].nopembayaran == null ? "" : datatrans[0].nopembayaran,
                                                          //   style: blackFontStyle3.copyWith(fontSize: 12),
                                                          //   textAlign: TextAlign.left,
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Table(
                                                children: [
                                                  TableRow(
                                                      decoration:
                                                      BoxDecoration(color: Colors.blue[100]),
                                                      children: [
                                                        Container(
                                                          padding:
                                                          EdgeInsets.all(10),
                                                          child:
                                                          Text(
                                                            "Item",
                                                            style: blueFontStyle,
                                                            textAlign: TextAlign.start,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                          EdgeInsets.symmetric(vertical: 10),
                                                          child:
                                                          Text(
                                                            "Pembayaran",
                                                            style: blueFontStyle,
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                          EdgeInsets.all(10),
                                                          child:
                                                          Text(
                                                            "Nominal",
                                                            style: blueFontStyle,
                                                            textAlign: TextAlign.end,
                                                          ),
                                                        ),
                                                      ]),
                                                ],
                                              ),
                                              Container(
                                                child: _formulir_eduDonation(
                                                    datatrans[
                                                    0]
                                                        .nominal,
                                                    datatrans[
                                                    0]
                                                        .nominaltrf
                                                        .toString()),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.only(bottom: 10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics:
                              NeverScrollableScrollPhysics(),
                              itemCount: datatrans.length,
                              itemBuilder: (context, index) {
                                return index != 0
                                    ? Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10)),
                                  elevation: 2,
                                  margin: EdgeInsets
                                      .fromLTRB(10, 10,
                                      10, 0),
                                  borderOnForeground:
                                  true,
                                  child: InkWell(
                                    customBorder:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              (InvoiceDonasi(
                                                trx_id: datatrans[index].trx_id.toString() == null
                                                    ? ""
                                                    : datatrans[index].trx_id.toString(),
                                                nopembayaran: datatrans[index].nopembayaran.toString() == null
                                                    ? ""
                                                    : datatrans[index].nopembayaran.toString(),
                                                donaturname: datatrans[index].donaturname.toString() == null
                                                    ? ""
                                                    : datatrans[index].donaturname.toString(),
                                                isanonim: datatrans[index].isanonim.toString() == null
                                                    ? ""
                                                    : datatrans[index].isanonim.toString(),
                                                nowa: datatrans[index].nowa.toString() == null
                                                    ? ""
                                                    : datatrans[index].nowa.toString(),
                                                notlp: datatrans[index].notlp.toString() == null
                                                    ? ""
                                                    : datatrans[index].notlp.toString(),
                                                nominal: datatrans[index].nominal.toString() == null
                                                    ? ""
                                                    : datatrans[index].nominal.toString(),
                                                champaigner: datatrans[index].champaigner.toString() == null
                                                    ? ""
                                                    : datatrans[index].champaigner.toString(),
                                                judul: datatrans[index].judul.toString() == null
                                                    ? ""
                                                    : datatrans[index].judul.toString(),
                                                seolink: datatrans[index].seolink.toString() == null
                                                    ? ""
                                                    : datatrans[index].seolink.toString(),
                                                novirtual_bni: datatrans[index].novirtualBni.toString() == null
                                                    ? ""
                                                    : datatrans[index].novirtualBni.toString(),
                                                channel: datatrans[index].channel.toString() == null
                                                    ? ""
                                                    : datatrans[index].channel.toString(),
                                                method: datatrans[index].metode.toString() == null
                                                    ? ""
                                                    : datatrans[index].metode.toString(),
                                                label_an:
                                                "",
                                                label_rek:
                                                "",
                                                label_bank:
                                                "",
                                                loopitem:
                                                "",
                                                routeref:
                                                "transaksi",
                                                nominaltrf: datatrans[index].nominaltrf.toString() == null
                                                    ? ""
                                                    : datatrans[index].nominaltrf.toString(),
                                              ))));
                                    },
                                    child: Container(
                                        padding: EdgeInsets
                                            .symmetric(
                                            horizontal:
                                            16,
                                            vertical:
                                            10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  datatrans[index].tanggal == null
                                                      ? ""
                                                      : datatrans[index].tanggal,
                                                  style:
                                                  blackFontStyle3.copyWith(fontSize: 12),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign:
                                                  TextAlign.left,
                                                ),
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(left: 10),
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(12.0),
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        height: 24,
                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                        color: Colors.red,
                                                        child: Text(
                                                          "Tagihan",
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors
                                                  .black38,
                                              height:
                                              20,
                                              thickness:
                                              1,
                                            ),
                                            Text(
                                              datatrans[index].title.toString() ==
                                                  null
                                                  ? ""
                                                  : datatrans[index]
                                                  .title
                                                  .toString(),
                                              style: blueFontStyle.copyWith(
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  datatrans[index].kampus == null
                                                      ? ""
                                                      : datatrans[index].kampus,
                                                  style:
                                                  blackFontStyle3.copyWith(fontSize: 12),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign:
                                                  TextAlign.left,
                                                ),
                                                Text(
                                                  datatrans[index].singkatan == null
                                                      ? ""
                                                      : datatrans[index].singkatan,
                                                  style:
                                                  blackFontStyle3.copyWith(fontSize: 12),
                                                  textAlign:
                                                  TextAlign.left,
                                                ),
                                                // Text(
                                                //   datatrans[index].singkatan == null
                                                //       ? ""
                                                //       : datatrans[index].singkatan,
                                                //   style:
                                                //       blackFontStyle3.copyWith(fontSize: 12),
                                                //   textAlign:
                                                //       TextAlign.left,
                                                // ),
                                                Divider(
                                                  color:
                                                  Colors.black38,
                                                  height:
                                                  20,
                                                  thickness:
                                                  1,
                                                ),
                                                Container(
                                                  child:
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total",
                                                        style: blueFontStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                                                      ),
                                                      Text(
                                                        //datatrans[index].nominal == null ? "" : "Rp. ${datatrans[index].nominal}",
                                                        NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID').format(double.parse(datatrans[index].nominal)),
                                                        style: blueFontStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                )
                                    : Container();
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          onRefresh: getData,
          color: mainColor1,
        ),
      ),
    );
  }
}

Widget _formulir_eduDonation(String total, String totalpem) {
  // print("tes${datatrans[0].params}");
  return Column(children: [
    Table(
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
              total,
              style: blueFontStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ]),
        TableRow(decoration: BoxDecoration(color: Colors.blue[50]), children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Total",
              style: blueFontStyleBold,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(""),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              totalpem,
              style: blueFontStyleBold,
              textAlign: TextAlign.end,
            ),
          ),
        ])
      ],
    ),
  ]);
}
