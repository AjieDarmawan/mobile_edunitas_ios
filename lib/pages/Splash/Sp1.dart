part of 'intro.dart';

class SPSatu extends StatefulWidget {
  SPSatu({Key key}) : super(key: key);

  @override
  _SPSatuState createState() => _SPSatuState();
}

class _SPSatuState extends State<SPSatu> {
  String _deviceId = 'Unknown';
  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 4), cek_devices);
  }

  Future<void> initPlatformState() async {
    String deviceId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
      //cek_devices();
      print("deviceId->$_deviceId");
    });
  }

  SessionManager sessionManager = SessionManager();
  var globalandroid_id = "";
  void cek_devices() async {
    await sessionManager.getandroid_id().then((value) {
      setState(() {
        globalandroid_id = sessionManager.android_id;
      });
    });

    if (globalandroid_id == null) {
      print("globalandroid_id${globalandroid_id}");
      Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => Onboarding()));
    } else {
      print("globalandroid_id${globalandroid_id}");
      Navigator.pushReplacement((context),
          MaterialPageRoute(builder: (context) => Navigation_bottom()));
    }
    // UserViewModel().android_devices(_deviceId.toString()).then((value) {
    //   StatusModel data = value;

    //   if (data.status == 200) {
    //     Navigator.pushReplacement(
    //         (context), MaterialPageRoute(builder: (context) => Navigation_bottom()));
    //   } else if(data.status==400) {
    //       Navigator.pushReplacement(
    //         (context), MaterialPageRoute(builder: (context) => Onboarding()));
    //   }
    // });
  }

  @override
  void initState() {

    //loadData();
    cek_devices();
    initPlatformState();
  }

  void onDonLoading() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Color(0xffffce00)),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "edu",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
              // Text(
              //   "${_deviceId}",
              //   style: TextStyle(
              //       color: Colors.yellow,
              //       fontStyle: FontStyle.italic,
              //       fontSize: 12,
              //       fontWeight: FontWeight.bold),
              // ),
              Text(
                "Nitas",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
