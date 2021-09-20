import 'dart:convert';
import 'package:ios_edunitas/constant/constant.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:ios_edunitas/model/educampus/CategoriModel.dart';
import 'package:ios_edunitas/model/educampus/listedu.dart';
import 'package:http/http.dart' as http;

class Eduinfoview_model {
  Future<List> getCategori() async {
    try {
      final hasil = await http.get(ConstanUrl().baseUrl + "categori");

      // print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        final data = categoriModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status categori error");
        print("error status categori" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch categori $e");
      return null;
    }
  }

  Future<List> getedulist(String kategori) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "listedu", body: {
        'kategori': kategori.toString(),
        //
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      print("ceeah${kategori}");
      if (hasil.statusCode == 200) {
        final data = listEduModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status transaction 1 error");
        print("error status transaction" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction 2 $e");
      return null;
    }
  }

  Future<List> getterbaru() async {
    try {
      final hasil = await http.get(ConstanUrl().baseUrl + "terbaru");

      print("hasil${hasil}");
      if (hasil.statusCode == 200) {
        final data = listEduModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status terbaru error");
        print("error status terbaru" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction 3 $e");
      return null;
    }
  }

  //PROMOSI
   Future<List> getCategoripromosi() async {
    try {
      final hasil = await http.get(ConstanUrl().baseUrl + "categori_promosi");

      // print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        final data = categoriModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status categori error");
        print("error status categori" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch categori $e");
      return null;
    }
  }

  Future<List> getpromosilist(String kategori) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "listpromosi", body: {
        'kategori': kategori.toString(),
        //
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      print("ceeah${kategori}");
      if (hasil.statusCode == 200) {
        final data = listEduModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status transaction error");
        print("error status transaction" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction $e");
      return null;
    }
  }

   Future<List> getPromositerbaru() async {
    try {
      final hasil = await http.get(ConstanUrl().baseUrl + "terbarupromosi");

      print("hasil${hasil}");
      if (hasil.statusCode == 200) {
        final data = listEduModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status terbaru error");
        print("error status terbaru" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction $e");
      return null;
    }
  }

  Future<List> getPromositerbarudaftar() async {
    try {
      final hasil = await http.get(ConstanUrl().baseUrl + "menampilan_promosi_daftar");

      print("hasil${hasil}");
      if (hasil.statusCode == 200) {
        final data = listEduModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status terbaru error");
        print("error status terbaru" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction $e");
      return null;
    }
  }


   Future check_promo(String kodepromo,String kode_campus) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "check_promo", body: {
      'kodepromo': kodepromo,
      'kode_campus': kode_campus,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    }else if (listData.status == 404) {
      return listData;
    }
    else if (listData.status == 402) {
      return listData;
    }
     else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }
}
