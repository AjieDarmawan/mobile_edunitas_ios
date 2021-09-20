import 'dart:convert';
import 'package:ios_edunitas/constant/constant.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:ios_edunitas/model/me/InfoPembayaran_me_Model.dart';
import 'package:ios_edunitas/model/me/basket_model.dart';
import 'package:ios_edunitas/model/me/dataRR_SPB.dart';
import 'package:ios_edunitas/model/me/dataRR_SPP.dart';
import 'package:ios_edunitas/model/me/dataRR_formulir.dart';
import 'package:ios_edunitas/model/me/dataRR_jaket.dart';
import 'package:ios_edunitas/model/me/dataRR_jumlah_semester_rencana.dart';
import 'package:ios_edunitas/model/me/dataRR_sppR.dart';

import 'package:http/http.dart' as http;

class Apiinfoview_model {
  Future sinkron_mhs(String keycode, String no_virtual, String kelas,
      String email, String kampus_singkatan) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "sinkron_mhs", body: {
      'keycode': keycode,
      'no_virtual': no_virtual,
      'kelas': kelas,
      'email': email,
      'kampus_singkatan': kampus_singkatan,
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

  Future check_singkron(String email) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "check_singkron", body: {
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

  Future info_pembayaran(String keycode, String no_va) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "info_pembayaran", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
      });
      if (hasil.statusCode == 200) {
        print("data info_pembayaran success");
        // final data = infoPembayaranMeModelFromJson(hasil.body);
        // return data;
        final jsondata = jsonDecode(hasil.body);
        InfoPembayaranMeModel listData =
            InfoPembayaranMeModel.fromJson(jsondata);
        return listData;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  //basket
  Future dataBasket(String keycode, String no_va) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "basket", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data basket success");
        //final jsondata = jsonDecode(hasil.body);
        //  InfoPSPP listData = InfoPSPP.fromJson(jsondata);
        //  return listData;

        final data = basketModelFromJson(hasil.body);
        return data;
      }
    } catch (e) {
      print("error status basket $e");
      return null;
    }
  }

  Future dataRRSpb(String keycode, String no_va) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "dataRRSpb", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data dataRRSpb success");
        final jsondata = jsonDecode(hasil.body);
        InfoPSPB listData = InfoPSPB.fromJson(jsondata);
        return listData;
      }
    } catch (e) {
      print("error status dataRRSpb $e");
      return null;
    }
  }

  Future<List<InfoPsppJumlahSemesterRencana>> dataRRSpp(
      String keycode, String no_va) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "dataRRSpp", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data dataRRSpp success");
        //final jsondata = jsonDecode(hasil.body);
        //  InfoPSPP listData = InfoPSPP.fromJson(jsondata);
        //  return listData;

        final data = infoPsppJumlahSemesterRencanaFromJson(hasil.body);
        return data;
      }
    } catch (e) {
      print("error status dataRRSpp $e");
      return null;
    }
  }

  Future<List<InfoPsppR>> dataRRSpp_rencana(
      String keycode, String no_va, String semester) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "SPP_rencana", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
        'semester': semester.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data dataRRSpp success");
         
         print("hasilspprencana ${hasil.body}");
        final data = infoPsppRFromJson(hasil.body);
        return data;
      }
    } catch (e) {
      print("error status dataRRSpp $e");
      return null;
    }
  }

  Future<List<InfoPsppR>> dataRRSpp_realita(
      String keycode, String no_va, String semester) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "SPP_realita", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
        'semester': semester.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data dataRRSpp success");
        
        final data = infoPsppRFromJson(hasil.body);
         print("hasilspprencana ${hasil.body}");
        return data;
      }
    } catch (e) {
      print("error status dataRRSpp $e");
      return null;
    }
  }

  Future dataRR_formulir(String keycode, String no_va) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "DataRR_formulir", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data DataRR_formulir success");
        final jsondata = jsonDecode(hasil.body);
        InfoPFormulir listData = InfoPFormulir.fromJson(jsondata);
        return listData;
      }
    } catch (e) {
      print("error status DataRR_formulir $e");
      return null;
    }
  }

  Future dataRR_jaket(String keycode, String no_va) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "DataRR_jaket", body: {
        'keycode': keycode.toString(),
        'no_va': no_va.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data DataRR_jaket success");
        final jsondata = jsonDecode(hasil.body);
        InfoPJaket listData = InfoPJaket.fromJson(jsondata);
        return listData;
      }
    } catch (e) {
      print("error status DataRR_jaket $e");
      return null;
    }
  }
}
