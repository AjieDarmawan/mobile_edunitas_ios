import 'package:connectivity/connectivity.dart';

class ConnectionCheck{
  var connectivityResult;
  Future<void> conn() async{
    connectivityResult = await (Connectivity().checkConnectivity());
  }
  String check_conn(){
    conn();
    if (connectivityResult == ConnectivityResult.mobile) {
      return "I am connected to a mobile network.";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return "I am connected to a wifi network.";
    } else {
      return "No network";
    }
  }
}