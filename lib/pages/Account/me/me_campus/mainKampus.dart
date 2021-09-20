part of 'me_kampus.dart';

class MainKampus extends StatefulWidget {
  @override
  _MainKampusState createState() => _MainKampusState();
}

class _MainKampusState extends State<MainKampus> {
  bool isConn = false;

  //conn has been updated 29 Jun 2021 (not used)
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          isConn = true;
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
          //getData();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          isConn = true;
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
          //getData();
        } else {
          isConn = false;
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  @override
  void initState() {
    conn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Kampus Saya'),
        backgroundColor: mainColor1,
      ),
    );
  }
}
