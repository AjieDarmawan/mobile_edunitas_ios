import 'dart:convert';

import 'package:ios_edunitas/constant/constant.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:http/http.dart' as http;

class Partnerkampusview_model{
  Future getProdi(String email) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
    await http.post(Uri.parse(ConstanUrl().baseUrl + "check_singkron"), body: {
      'email': email,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else if (listData.status == 402) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }
}