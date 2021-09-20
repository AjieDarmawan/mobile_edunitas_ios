part of 'transaction.dart';

class MainTransactionEduCampus extends StatefulWidget {
  MainTransactionEduCampus({Key key}) : super(key: key);

  @override
  _MainTransactionEduCampusState createState() =>
      _MainTransactionEduCampusState();
}

class _MainTransactionEduCampusState extends State<MainTransactionEduCampus> {
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
  // SessionManager sessionManager = SessionManager();
  // // var gabs = CryptoData.getData;
  // void getPreferences() async {
  //   await sessionManager.getPreference().then((value) {
  //     //handled
  //     setState(() {
  //       mystatus = sessionManager.status;
  //       globalkey = sessionManager.key;
  //       globalEmail = sessionManager.email;
  //       print("email${globalEmail}");
  //       print("globalkey${globalkey}");
  //       print("mystatus${mystatus}");
  //     });
  //   });
  //   List<String> _statusPembayaran = ["Menunggu Pembayaran", "Sukses", "Gagal"];
  // }

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
    Transactionview_model().getransaction(globalkey2).then((value1) {
      //handled
      print(value1);
      setState(() {
        // Transaction2Model data = value1;
        datatrans = value1;

        // item = value1[0].;
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
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void fcm() {
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     setState(() {
    //       _messageText = "Push Messaging message: $message";
    //     });
    //     FlutterRingtonePlayer.playNotification();
    //     print("onMessage: $message");
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     setState(() {
    //       _messageText = "Push Messaging message: $message";
    //     });
    //     print("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     setState(() {
    //       _messageText = "Push Messaging message: $message";
    //     });
    //     print("onResume: $message");
    //   },
    // );
    //ios only
    // _firebaseMessaging.requestNotificationPermissions(
    //   const IosNotificationSettings(sound: true, badge: true, alert: true),
    // );
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });

    // _firebaseMessaging.getToken().then((String token) {
    //   assert(token != null);
    //   setState(() {
    //     _homeScreenText = "Push Messaging token: $token";
    //   });
    //   print(_homeScreenText);
    // });
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
    //getPreferences();
    conn();
    //checkInternet();
    // setState(() {
    //   globalkey = globalkey;
    // });
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
                      child: datatrans == null || datatrans.length == 0
                          ? shimmerLoading()
                          : Container(
                              child: datatrans[0].noinvoice == "tes"
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
                                                              builder:
                                                                  (context) =>
                                                                      (Invoice(
                                                                        id_invoice: datatrans[0].id ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0].id,
                                                                        logo: datatrans[0].logo ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0].logo,
                                                                        nama: datatrans[0].kampus ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0].kampus,
                                                                        singktan: datatrans[0].singkatan ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0].singkatan,
                                                                        formulir: datatrans[0].totalpembayaran ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0].totalpembayaran,
                                                                        keycode: globalkey ==
                                                                                null
                                                                            ? ""
                                                                            : globalkey,
                                                                        namaJurusan: datatrans[0].prodi ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0].prodi,
                                                                        kodekampus: datatrans[0].kode ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0].kode,
                                                                        params: datatrans[0] ==
                                                                                null
                                                                            ? ""
                                                                            : datatrans[0],
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
                                                                  datatrans[0].waktu ==
                                                                          null
                                                                      ? ""
                                                                      : datatrans[
                                                                              0]
                                                                          .waktu,
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
                                                                          datatrans[0].status == null
                                                                              ? ""
                                                                              : "Tagihan",
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
                                                                  datatrans[0].billtype ==
                                                                          null
                                                                      ? ""
                                                                      : datatrans[
                                                                              0]
                                                                          .billtype,
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
                                                                              datatrans[0].prodi == null ? "" : datatrans[0].prodi,
                                                                              style: blackFontStyle3.copyWith(fontSize: 12),
                                                                              textAlign: TextAlign.left,
                                                                            ),
                                                                            Text(
                                                                              datatrans[0].kelas == null ? "" : datatrans[0].kelas,
                                                                              style: blackFontStyle3.copyWith(fontSize: 12),
                                                                              textAlign: TextAlign.left,
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
                                                                  child: datatrans[0]
                                                                              .billtype ==
                                                                          "KONFIRMASI PEMBAYARAN PENDAFTARAN"
                                                                      ? _registrasi(
                                                                          datatrans)
                                                                      : _formulir(
                                                                          datatrans),
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
                                                                          (Invoice(
                                                                            id_invoice: datatrans[index].id == null
                                                                                ? ""
                                                                                : datatrans[index].id,
                                                                            logo: datatrans[index].logo == null
                                                                                ? ""
                                                                                : datatrans[index].logo,
                                                                            nama: datatrans[index].kampus == null
                                                                                ? ""
                                                                                : datatrans[index].kampus,
                                                                            singktan: datatrans[index].singkatan == null
                                                                                ? ""
                                                                                : datatrans[index].singkatan,
                                                                            formulir: datatrans[index].totalpembayaran == null
                                                                                ? ""
                                                                                : datatrans[index].totalpembayaran,
                                                                            keycode: globalkey == null
                                                                                ? ""
                                                                                : globalkey,
                                                                            namaJurusan: datatrans[index].prodi == null
                                                                                ? ""
                                                                                : datatrans[index].prodi,
                                                                            kodekampus: datatrans[index].kode == null
                                                                                ? ""
                                                                                : datatrans[index].kode,
                                                                            params: datatrans[index] == null
                                                                                ? ""
                                                                                : datatrans[index],
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
                                                                          datatrans[index].waktu == null
                                                                              ? ""
                                                                              : datatrans[index].waktu,
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
                                                                                  datatrans[index].status == null ? "" : "Tagihan",
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
                                                                      datatrans[index].billtype ==
                                                                              null
                                                                          ? ""
                                                                          : datatrans[index]
                                                                              .billtype,
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
                                                                          datatrans[index].prodi == null
                                                                              ? ""
                                                                              : datatrans[index].prodi,
                                                                          style:
                                                                              blackFontStyle3.copyWith(fontSize: 12),
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                        ),
                                                                        Text(
                                                                          datatrans[index].kelas == null
                                                                              ? ""
                                                                              : datatrans[index].kelas,
                                                                          style:
                                                                              blackFontStyle3.copyWith(fontSize: 12),
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                        ),
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
                                                                                //datatrans[index].totalpembayaran == null ? "" : "Rp. ${datatrans[index].totalpembayaran}",
                                                                                NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID').format(double.parse(datatrans[index].totalpembayaran)),
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

Widget _formulir(datatrans) {
  // print("tes${datatrans[0].params}");
  return Column(
    children: [
      Column(
          children: datatrans[0].params.map<Widget>((document) {
        var data = document.split('#');
        return Container(
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
      Table(children: [
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
              NumberFormat.currency(
                      symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                  .format(double.parse(datatrans[0].totalpembayaran)),
              style: blueFontStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ])
      ])
    ],
  );
  //   children: [
  //   Table(
  //     children: [
  //       TableRow(children: [
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           child: Text(
  //             "Formulir",
  //             style: blueFontStyle,
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           child: Text(
  //             datatrans[0].formulir_qty,
  //             style: blueFontStyle,
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           child: Text(
  //             datatrans[0].formulir_harga,
  //             style: blueFontStyle,
  //             textAlign: TextAlign.end,
  //           ),
  //         ),
  //       ]),
  //       TableRow(decoration: BoxDecoration(color: Colors.blue[50]), children: [
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           child: Text(
  //             "Total",
  //             style: blueFontStyle,
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           child: Text(""),
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(10),
  //           child: Text(
  //             datatrans[0].totalpembayaran,
  //             style: blueFontStyle,
  //             textAlign: TextAlign.end,
  //           ),
  //         ),
  //       ])
  //     ],
  //   ),
  // ]

  //);
}

Widget _registrasi(datatrans) {
  // print("tes${datatrans[0].params}");
  return Column(
    children: [
      Column(
          children: datatrans[0].params.map<Widget>((document) {
        var data = document.split('#');
        return Container(
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
      Table(children: [
        TableRow(decoration: BoxDecoration(color: Colors.blue[50]), children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Total",
              style: blueFontStyle,
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
              NumberFormat.currency(
                      symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                  .format(double.parse(datatrans[0].totalpembayaran)),
              style: blueFontStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ])
      ])
    ],
  );
  // return Column(
  //   children: [
  //     Table(
  //       children: [
  //         TableRow(children: [
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               "Jaket",
  //               style: blueFontStyle,
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //           Container(
  //               padding: EdgeInsets.all(10),
  //               child: Text(
  //                 datatrans[0].jaket_qty,
  //                 style: blueFontStyle,
  //                 textAlign: TextAlign.center,
  //               )),
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               datatrans[0].jaket_harga,
  //               style: blueFontStyle,
  //               textAlign: TextAlign.end,
  //             ),
  //           ),
  //         ]),
  //         TableRow(children: [
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               "Spb",
  //               style: blueFontStyle,
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //           Container(
  //               padding: EdgeInsets.all(10),
  //               child: Text(
  //                 datatrans[0].spb_qty,
  //                 style: blueFontStyle,
  //                 textAlign: TextAlign.center,
  //               )),
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               datatrans[0].spb_harga,
  //               style: blueFontStyle,
  //               textAlign: TextAlign.end,
  //             ),
  //           ),
  //         ]),
  //         TableRow(children: [
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               "Spp",
  //               style: blueFontStyle,
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //           Container(
  //               padding: EdgeInsets.all(10),
  //               child: Text(
  //                 datatrans[0].spp_qty,
  //                 style: blueFontStyle,
  //                 textAlign: TextAlign.center,
  //               )),
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               datatrans[0].spp_harga,
  //               style: blueFontStyle,
  //               textAlign: TextAlign.end,
  //             ),
  //           ),
  //         ]),
  //         TableRow(children: [
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               "Pelayanan",
  //               style: blueFontStyle,
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //           Container(
  //               padding: EdgeInsets.all(10),
  //               child: Text(
  //                 "1",
  //                 style: blueFontStyle,
  //                 textAlign: TextAlign.center,
  //               )),
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               "2000",
  //               style: blueFontStyle,
  //               textAlign: TextAlign.end,
  //             ),
  //           ),
  //         ]),
  //         TableRow(
  //             decoration: BoxDecoration(color: Colors.blue[50]),
  //             children: [
  //               Container(
  //                 padding: EdgeInsets.all(10),
  //                 child: Text(
  //                   "Total",
  //                   style: blueFontStyle,
  //                   textAlign: TextAlign.left,
  //                 ),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.all(10),
  //                 child: Text(""),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.all(10),
  //                 child: Text(
  //                   "${int.parse((datatrans[0].jaket_harga)) * int.parse((datatrans[0].jaket_qty)) + int.parse((datatrans[0].spp_harga)) + int.parse((datatrans[0].spb_harga)) + 2000}",
  //                   style: blueFontStyle,
  //                   textAlign: TextAlign.end,
  //                 ),
  //               ),
  //             ])
  //       ],
  //     ),
  //   ],
  // );
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
