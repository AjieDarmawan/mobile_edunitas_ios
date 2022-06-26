part of 'transaction.dart';

class MainTransaction extends StatefulWidget {
  MainTransaction({Key key}) : super(key: key);

  @override
  _MainInboxState createState() => _MainInboxState();
}

class _MainInboxState extends State<MainTransaction> {
  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  SessionManager sessionManager = SessionManager();
  ScrollController _controller;
  //var gabs = CryptoData.getData;

  var datatrans = [];
  var data = [];
  List<Params> item;
  void getdatatrans(globalkey2) {
    print("globalkey2${globalkey.toString()}");
    Transactionview_model().transaction_donasi(globalkey2).then((value1) {
      //handled
      print(value1);
      setState(() {
        // Transaction2Model data = value1;
        datatrans = value1;

        // item = value1[0].;
      });
    }).catchError((erro) {});
  }

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
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
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

  var datamessage = [];
  var totalmessage = 0;
  var tabmessage;

  void unreadmessage() {
    var joms = 0;
    for (var index = 0; index < datamessage.length; index++) {
      if (datamessage[index].readdate == null) {
        joms++;
        print("totalmessagereaded: ${totalmessage}");
      }
    }
    setState(() {
      totalmessage = joms;
      tabmessage = joms == 0 ? "" : "(${totalmessage.toString()})";
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
    getPreferences();
    getdatatrans(globalkey);
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return _tab();
  }

  Widget _tab() {
    return globalkey == null
        ? NonLogin()
        : DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
              ),
              backgroundColor: mainColor1,
              title: Text(
                "Transaksi ",
                style: whiteFontStyle,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (TrasnsactionHistory(
                              kodecampus: datatrans[0].kode == null
                                  ? ""
                                  : datatrans[0].kode,
                            ))));
                  },
                )
              ],
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(48),
                child: Material(
                  color: mainColor1,
                  child: TabBar(
                    labelColor: mainColor1,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: CupertinoColors.systemGrey6),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("eduCampus "),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("eduDonation"),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          backgroundColor: CupertinoColors.systemGrey6,
          body: SafeArea(
            child: globalkey == null
                ? NonLogin()
                : TabBarView(
              children: [
                MainTransactionEduCampus(),
                MainTransactionEduDonation()
              ],
            ),
          ),
        ));
  }
}
