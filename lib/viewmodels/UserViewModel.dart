import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ios_edunitas/constant/constant.dart';
import 'package:ios_edunitas/model/Auth/LoginModel.dart';
import 'package:ios_edunitas/model/Auth/UsersDetailModel.dart';
import 'package:ios_edunitas/model/Auth/PendidikanUserDetailModel.dart';
import 'package:ios_edunitas/model/Campus/PhotoModel.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:ios_edunitas/model/karir/ShowBahasa.dart';
import 'package:ios_edunitas/model/karir/ShowKemampuan.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:async/async.dart';

class UserViewModel {
  Future login(String email, String password, String android_id) async {
    final response = await http.post(ConstanUrl().baseUrl + "login", body: {
      'email': email,
      'password': password,
      'android_id': android_id,
    });

    final jsondata = jsonDecode(response.body);
    LoginModel listData = LoginModel.fromJson(jsondata);

    if (listData.status == 200) {
      print(listData);
      return listData;
    }else if (listData.status == 202) {
      return listData;
    } 
    
    else if (listData.status == 300) {
      return listData;
    } else if (listData.status == 600) {
      return listData;
    } else if (listData.status == 400) {
      print(listData.status);
      print("gagal212");

      return listData;
    } else if (listData.status == 405) {
      print(listData.status);
      print("gagal212");

      return listData;
    } else {
      print("gagal");
      return listData;
    }
  }

  Future register_email(String email) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "register_email", body: {
      'email': email,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future forget_email(String email) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "forget_email", body: {
      'email': email,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future register(String email, String password, String username, String nowa,
      String notlp, String leveledu) async {
    final response = await http.post(ConstanUrl().baseUrl + "register", body: {
      'email': email,
      'password': password,
      'username': username,
      'nowa': nowa,
      'notlp': notlp,
      'leveledu': leveledu
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

  Future aktivasi(String email, String kode) async {
    final response = await http.post(ConstanUrl().baseUrl + "activasi", body: {
      'email': email,
      'code': kode,
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

  Future android_devices(String android_id) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "android_id", body: {
      'android_id': android_id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    print("listdata${listData.status}");

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

  Future logout(String android_id) async {
    final response = await http.post(ConstanUrl().baseUrl + "logout", body: {
      'android_id': android_id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    print("listdata${listData.status}");

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

  Future resend_pin(String email) async {
    final response = await http.post(ConstanUrl().baseUrl + "mailform", body: {
      'email': email,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    print("listdata${listData.status}");

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

  Future android_id_update(String android_id) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "android_id_update", body: {
      'android_id': android_id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    print("listdata${listData.status}");

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

  Future users_detail(String email) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "users_detail", body: {
      'email': email,
    });

    final jsondata = jsonDecode(response.body);
    UsersDetailModel listData = UsersDetailModel.fromJson(jsondata);

    // print("listdata${listData.status}");

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

  Future form_forgetpassword(
      String email, String password, String codereff) async {
    final response = await http.post(ConstanUrl().baseUrl + "form_password",
        body: {'email': email, 'password': password, 'codereff': codereff});

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future update_profile(
      String keycode,
      String namalengkap,
      String tempatlahir,
      String tanggal_lahir,
      String pendidikan,
      String gender,
      String nohp,
      String nowa,
      String alamat) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "update_profil", body: {
      'keycode': keycode,
      'namalengkap': namalengkap,
      'tempatlahir': tempatlahir,
      'tanggal_lahir': tanggal_lahir,
      'pendidikan': pendidikan,
      'gender': gender,
      'nohp': nohp,
      'nowa': nowa,
      'alamat': alamat,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    //print("datas${jsondata}");

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future gantiPassword(
    String email,
    String passlama,
    String passbaru,
  ) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "ganti_password", body: {
      'email': email,
      'pass_lama': passlama,
      'pass_baru': passbaru,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    print("datas${jsondata}");

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  @override
  Future gantipp(String keycode, File formdata_imguser, context) async {
    var stream = new http.ByteStream(
        DelegatingStream.typed(formdata_imguser.openRead()));
    //read size image
    var length = await formdata_imguser.length();
    //multipart
    var multipart = http.MultipartFile('formdata_imguser', stream, length,
        filename: formdata_imguser.path);
    var request = http.MultipartRequest(
        'POST', Uri.parse("https://api.edunitas.com/mod/edun-medata-g"));
    request.files.add(multipart);
    request.fields['formdata_apikey'] = keycode; //2
    request.fields['setdata_mod'] = "update-photo"; //2

    final response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");

      Flushbar(
        title: "Berhasil",
        message: "Data Berhasil Disimpan",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.fastOutSlowIn,
        boxShadows: [
          BoxShadow(
              color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
        ],
        backgroundColor: Colors.green[600],
      )..show(context);

      // Navigator.pop(context);

      // Toast.show("Success", context, duration: 3, gravity: Toast.BOTTOM);

      // Navigator.pop(context);
    } else {
      Flushbar(
        title: "Gagal",
        message: "Data Gagal Disimpan",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.fastOutSlowIn,
        boxShadows: [
          BoxShadow(
              color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
        ],
        backgroundColor: Colors.red[600],
      )..show(context);

      print("Upload Failed");
      //Toast.show("Gagal", context, duration: 3, gravity: Toast.BOTTOM);
      //Navigator.pop(context);
    }
    return response.statusCode;
  }

  Future<List> check_login_tmp(String singkatan) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "check_login_tmp", body: {
        'singkatan': singkatan.toString(),
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      print("ceeah${singkatan}");
      if (hasil.statusCode == 200) {
        print("data check_login_tmp success");
        // final data = lowonganModelFromJson(hasil.body);
        List<Photo> data = Photo.parseList(json.decode(hasil.body));
        return data;
      } else {
        print("data error status check_login_tmp error");
        print("error status check_login_tmp" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch check_login_tmp $e");
      return null;
    }
  }

  Future edit_pendidikan_user(
    String tingkatpendidikan,
    String jurusan,
    String provinsi,
    String kabupaten,
    String kecamatan,
    String desa,
    String alamat,
    String kodepos,
    String namainstitusi,
    String tahunkelulusan,
    String nilaiakhir,
    String dari,
    String keycode,
  ) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "insert_pendidikan", body: {
      'tingkatpendidikan': tingkatpendidikan,
      'jurusan': jurusan,
      'namainstitusi': namainstitusi,
      'tahunkelulusan': tahunkelulusan,
      'provinsi': provinsi,
      'kabkota': kabupaten,
      'kecamatan': kecamatan,
      'desa': desa,
      'alamat': alamat,
      'kodepos': kodepos,
      'nilaiakhir': nilaiakhir,
      'dari': dari,
      'keycode': keycode
    });

    print("tingkatpendidikan${tingkatpendidikan}");
    print("hasilbody${response.body}");
    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future pendidikan_detail(String keycode) async {
    try {
      final response =
          await http.post(ConstanUrl().baseUrl + "show_pendidikan", body: {
        'keycode': keycode,
      });

      // print("tes${response.body}");
      final jsondata = jsonDecode(response.body);
      DetailPendidikanModel listData = DetailPendidikanModel.fromJson(jsondata);

      // print("listdata${listData.status}");
      if (response.statusCode == 200) {
        print("data show_pendidikan");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
    } catch (e) {
      print("error show_pendidikan $e");
      return null;
    }
  }

  Future insert_kemampuan(
    String kemampuan,
    String tingkatan,
    String keycode,
    String id,
  ) async {
    final response = await http.post(ConstanUrl().baseUrl + "insert_kemampuan",
        body: {
          'kemampuan': kemampuan,
          'tingkatan': tingkatan,
          'keycode': keycode,
          'id': id
        });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future insert_bahasa(
    String bahasa,
    String tulisan,
    String lisan,
    String keycode,
    String id,
  ) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "insert_bahasa", body: {
      'bahasa': bahasa,
      'tulisan': tulisan,
      'lisan': lisan,
      'keycode': keycode,
      'id': id
    });
     

     print("bahasa121${bahasa}");
    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future<List<ShowBahasaModel>> show_bahasa(String keycode) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "show_bahasa"),
      //     headers: {"Accept": "application/json"});

      final hasil =
          await http.post(ConstanUrl().baseUrl + "show_bahasa", body: {
        'keycode': keycode.toString(),
      });

      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = showBahasaModelFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  Future<List<ShowKemampuanModel>> show_kemampuan(String keycode) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "show_kemampuan"),
      //     headers: {"Accept": "application/json"});

      final hasil =
          await http.post(ConstanUrl().baseUrl + "show_kemampuan", body: {
        'keycode': keycode.toString(),
      });

      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = showKemampuanModelFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  Future hapus_kemampuan(String id) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "hapus_kemampuan", body: {
      'id': id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future hapus_bahasa(String id) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(ConstanUrl().baseUrl + "hapus_bahasa", body: {
      'id': id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }
}
