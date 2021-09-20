import 'dart:convert';

import 'package:ios_edunitas/constant/constant.dart';
import 'package:ios_edunitas/model/Auth/LoginModel.dart';
import 'package:ios_edunitas/model/Campus/PhotoModel.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:http/http.dart' as http;

class Whitlistview_model {
  Future simpanwhitlist(
      String keycode,
      String pendidikan,
      String postlist,
      String kampus,
      String title,
      String subtitle,
      String prodi,
      String kelas,
      String origin) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "simpanwhitlisht", body: {
      'keycode': keycode,
      'pendidikan': pendidikan,
      'postlist': postlist,
      'kampus': kampus,
      'title': title,
      'subtitle': subtitle,
      'prodi': prodi,
      'kelas': kelas,
      'origin': origin
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future hapuswhitlist(
    String id,
  ) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "hapuswhitlisht", body: {
      'id': id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future<List> getwhitlist(String keycode) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "whitlist", body: {
        'keycode': keycode.toString(),
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        print("data whitlist success");
        // final data = lowonganModelFromJson(hasil.body);
        List<Photo> data = Photo.parseList(json.decode(hasil.body));
        return data;
      } else {
        print("data error status whitlist error");
        print("error status whitlist" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch whitlist $e");
      return null;
    }
  }
}
