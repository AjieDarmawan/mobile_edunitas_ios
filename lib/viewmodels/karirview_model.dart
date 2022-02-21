part of 'viewmodel.dart';

// import 'dart:convert';
// import 'dart:ffi';
// import 'dart:io';

// import 'dart:async';
// import 'package:async/async.dart';
// import 'package:flutter/material.dart';

// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_edunitas/constant/constant.dart';
// import 'package:flutter_app_edunitas/model/Master/MasterDaerahModel.dart';
// import 'package:flutter_app_edunitas/model/Master/MasterJurusanModel.dart';
// import 'package:flutter_app_edunitas/model/Master/SmbModel.dart';
// import 'package:flutter_app_edunitas/model/Master/StatusModel.dart';
// import 'package:flutter_app_edunitas/model/karir/RiwayatLamaran.dart';
// import 'package:flutter_app_edunitas/model/karir/SpesialisasiModel.dart';
// import 'package:flutter_app_edunitas/model/karir/detailKarir.dart';
// import 'package:flutter_app_edunitas/model/karir/ShowPengalamanModel.dart';
// import 'package:flutter_app_edunitas/model/karir/ShowInfoTambahan.dart';
// import 'package:http/http.dart' as http;

class KarirViewModel {
  Future detailKarir(String cid) async {
    try {
      final response =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "detail_karir"), body: {
        'cid': cid.toString(),
      });

      final jsondata = jsonDecode(response.body);
      DetailKarirModel listData = DetailKarirModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data detail_Karir");
        //return DetailKarirModel.fromJson(jsonDecode(response.body));
        return listData;
      }
    } catch (e) {
      print("error detail_Karir $e");
      return null;
    }
  }

  Future simpan_karir(String cid, String keycode) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "simpan_karir"), body: {
      'cid': cid,
      'keycode': keycode,
    });

    print("simpankarir${cid}");
    print("simpankarir${keycode}");
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

  Future<List<MasterJurusanModel>> karir_pendidikan() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "karir_pendidikan")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = masterJurusanModelFromJson(hasil.body);
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

  Future<List<SpesialisasiModel>> karir_spesialisasi() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "karir_spesialisasi")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = spesialisasiModelFromJson(hasil.body);
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

  //
  Future<List<SpesialisasiModel>> karir_jabatan() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "karir_jabatan")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = spesialisasiModelFromJson(hasil.body);
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

  //
  Future<List<SpesialisasiModel>> karir_industri() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "karir_industri")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = spesialisasiModelFromJson(hasil.body);
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

  //

  Future<List<SpesialisasiModel>> karir_bidang() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "karir_bidang")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = spesialisasiModelFromJson(hasil.body);
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

  Future<List<SpesialisasiModel>> karir_posisi() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "karir_posisi")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("karir_posisi " + hasil.body);
        final data = spesialisasiModelFromJson(hasil.body);
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

  Future<List<SmbModel>> karir_tipe() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "karir_tipe")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data unitarea success");
        final data = smbModelFromJson(hasil.body);
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

  Future<List> wilayah_karir() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "wilayah_karir")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data provinsi success");
        final data = masterDaerahModelFromJson(hasil.body);
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

  Future<List<ShowPengalamanModel>> show_pengalaman(String keycode) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "show_pengalaman"),
      //     headers: {"Accept": "application/json"});

      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "show_pengalaman"), body: {
        'keycode': keycode.toString(),
      });

      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = showPengalamanModelFromJson(hasil.body);
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

  Future hapus_pengalaman(String id) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "hapus_pengalaman"), body: {
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

  Future simpan_pengalaman(
      String nama,
      String dari,
      String hingga,
      String untilnow,
      String bidang,
      String spesialisasi,
      String negara,
      String provinsi,
      String kota,
      String kecamatan,
      String kelurahan,
      String alamat,
      String kodepos,
      String industri,
      String jabatan,
      String gaji,
      String deskripsi,
      String posisi,
      String keycode) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "insert_pengalaman"), body: {
      'nama': nama,
      'dari': dari,
      'hingga': hingga,
      'untilnow': untilnow,
      'bidang': bidang,
      'spesialisasi': spesialisasi,
      'negara': negara,
      'provinsi': provinsi,
      'kota': kota,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'alamat': alamat,
      'kodepos': kodepos,
      'industri': industri,
      'jabatan': jabatan,
      'gaji': gaji,
      'deskripsi': deskripsi,
      'posisi': posisi,
      'keycode': keycode,
    });

    print("testing${response.body}");
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

  Future edit_pengalaman(
      String nama,
      String dari,
      String hingga,
      String untilnow,
      String bidang,
      String spesialisasi,
      String negara,
      String provinsi,
      String kota,
      String kecamatan,
      String kelurahan,
      String alamat,
      String kodepos,
      String industri,
      String jabatan,
      String gaji,
      String deskripsi,
      String posisi,
      String keycode,
      String id) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "edit_pengalaman"), body: {
      'nama': nama,
      'dari': dari,
      'hingga': hingga,
      'untilnow': untilnow,
      'bidang': bidang,
      'spesialisasi': spesialisasi,
      'negara': negara,
      'provinsi': provinsi,
      'kota': kota,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'alamat': alamat,
      'kodepos': kodepos,
      'industri': industri,
      'jabatan': jabatan,
      'gaji': gaji,
      'deskripsi': deskripsi,
      'posisi': posisi,
      'keycode': keycode,
      'id': id,
    });

    print("testing${response.body}");
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

  Future<List<ShowInfotambahanModel>> show_info_tambahan(String keycode) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "show_info_tambahan"),
      //     headers: {"Accept": "application/json"});

      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "show_info_tambahan"), body: {
        'keycode': keycode.toString(),
      });

      if (hasil.statusCode == 200) {
        print("show_info_tambahan: " + hasil.body);
        final data = showInfotambahanModelFromJson(hasil.body);
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

  Future insert_infotambahan(
    String wilayah,
    String penghasilan,
    String deskripsi,
    String keycode,
  ) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "insert_infotambahan"), body: {
      'wilayah': wilayah,
      'penghasilan': penghasilan,
      'deskripsi': deskripsi,
      'keycode': keycode,
    });

    print("testing${response.body}");
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

  Future hapus_infotambahan(String id) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    print("hapus_info_tambahan_id: "+id);
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "hapus_infotambahan"), body: {
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

  Future<List<RiwayatLamaranModel>> riwayat_lamaran(String keycode) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "riwayat_lamaran"),
      //     headers: {"Accept": "application/json"});

      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "riwayat_lamaran"), body: {
        'keycode': keycode.toString(),
      });

      if (hasil.statusCode == 200) {
        print("datariwayat${hasil.body}");
        final data = riwayatLamaranModelFromJson(hasil.body);
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

  // Future simpan_postin_loker(
  //   String formdata_jobtipe,
  //   String formdata_comnama1,
  //   String formdata_jobposisi,
  //   String formdata_joblokasi,
  //   String formdata_comdeskripsi,
  //   String formdata_jobpersayaratan,
  //   String formdata_jobalamat,
  //   String formdata_jobpendidikan,
  //   String formdata_jobdari,
  //   String formdata_jobhingga,
  //   String formdata_jobseolink,
  //   String formdata_comlogo,
  //   String formdata_comskala,
  //   String formdata_comagency,
  //   String formdata_comnama2,
  //   String formdata_combidang,
  //   String formdata_comemail,
  //   String formdata_comnotlp,
  //   String formdata_comnofax,
  //   String formdata_comwebsite,
  //   String formdata_comprovinsi,
  //   String formdata_comkota,
  //   String formdata_comkecamatan,
  //   String formdata_comkelurahan,
  //   String formdata_comalamat,
  //   String formdata_comkodepos,
  //   String formdata_comcpnama,
  //   String formdata_comcpjabatan,
  //   String formdata_comcpemail,
  //   String formdata_comcpnotlp,
  //   String input_captcha_h,
  //   String input_captcha,
  //   String formdata_jenis,
  //   String formdata_cid,
  // ) async {

  //     var stream = formdata_comlogo != null ? new http.ByteStream(
  //       DelegatingStream.typed(formdata_comlogo.openRead())) : "";
  //   //read size image
  //   var length = await formdata_comlogo.length();
  //   //multipart
  //   var multipart = http.MultipartFile('formdata_comlogo', stream, length,
  //       filename: formdata_comlogo.path);

  //   final response =
  //       await http.post(ConstanUrl().baseUrl + "insert_posting", body: {
  //     "formdata_jobtipe": formdata_jobtipe,
  //     "formdata_comnama1": formdata_comnama1,
  //     "formdata_jobposisi": formdata_jobposisi,
  //     "formdata_joblokasi": formdata_joblokasi,
  //     "formdata_comdeskripsi": formdata_comdeskripsi,
  //     "formdata_jobpersayaratan": formdata_jobpersayaratan,
  //     "formdata_jobalamat": formdata_jobalamat,
  //     "formdata_jobpendidikan": formdata_jobpendidikan,
  //     "formdata_jobdari": formdata_jobdari,
  //     "formdata_jobhingga": formdata_jobhingga,
  //     "formdata_jobseolink": formdata_jobseolink,
  //     "formdata_comlogo": formdata_comlogo,
  //     "formdata_comskala": formdata_comskala,
  //     "formdata_comagency": formdata_comagency,
  //     "formdata_comnama2": formdata_comnama2,
  //     "formdata_combidang": formdata_combidang,
  //     "formdata_comemail": formdata_comemail,
  //     "formdata_comnotlp": formdata_comnotlp,
  //     "formdata_comnofax": formdata_comnofax,
  //     "formdata_comwebsite": formdata_comwebsite,
  //     "formdata_comprovinsi": formdata_comprovinsi,
  //     "formdata_comkota": formdata_comkota,
  //     "formdata_comkecamatan": formdata_comkecamatan,
  //     "formdata_comkelurahan": formdata_comkelurahan,
  //     "formdata_comalamat": formdata_comalamat,
  //     "formdata_comkodepos": formdata_comkodepos,
  //     "formdata_comcpnama": formdata_comcpnama,
  //     "formdata_comcpjabatan": formdata_comcpjabatan,
  //     "formdata_comcpemail": formdata_comcpemail,
  //     "formdata_comcpnotlp": formdata_comcpnotlp,
  //     "input_captcha_h": input_captcha_h,
  //     "input_captcha": input_captcha,
  //     "formdata_jenis": formdata_jenis,
  //     "formdata_cid": formdata_cid,
  //   });

  //   print("testing${response.body}");
  //   final jsondata = jsonDecode(response.body);
  //   StatusModel listData = StatusModel.fromJson(jsondata);

  //   if (listData.status == 200) {
  //     return listData;
  //   } else if (listData.status == 400) {
  //     return listData;
  //   } else if (listData.status == 500) {
  //     return listData;
  //   } else {
  //     print("gagal");
  //     return null;
  //   }
  // }

  @override
  Future simpan_postin_loker(
      String email_edit,
      String cid_edit,
      String formdata_jobtipe,
      String formdata_comnama1,
      String formdata_jobposisi,
      String formdata_joblokasi,
      String formdata_comdeskripsi,
      String formdata_jobpersayaratan,
      String formdata_jobalamat,
      String formdata_jobpendidikan,
      String formdata_jobdari,
      String formdata_jobhingga,
      String formdata_jobseolink,
      File formdata_comlogo,
      String formdata_comskala,
      String formdata_comagency,
      String formdata_comnama2,
      String formdata_combidang,
      String formdata_comemail,
      String formdata_comnotlp,
      String formdata_comnofax,
      String formdata_comwebsite,
      String formdata_comprovinsi,
      String formdata_comkota,
      String formdata_comkecamatan,
      String formdata_comkelurahan,
      String formdata_comalamat,
      String formdata_comkodepos,
      String formdata_comcpnama,
      String formdata_comcpjabatan,
      String formdata_comcpemail,
      String formdata_comcpnotlp,
      String input_captcha_h,
      String input_captcha,
      String formdata_jenis,
      String formdata_cid,
      context) async {
    //formdata_logo
    var stream = formdata_comlogo != null
        ? new http.ByteStream(
            DelegatingStream.typed(formdata_comlogo.openRead()))
        : "";
    //read size image
    var length =
        formdata_comlogo != null ? await formdata_comlogo.length() : "";
    //multipart
    var multipart = formdata_comlogo != null
        ? http.MultipartFile('formdata_comlogo', stream, length,
            filename: formdata_comlogo.path)
        : File;

    String edited = email_edit != "" ? "?email=$email_edit&cid=$cid_edit" : "";
    var request = http.MultipartRequest('POST',
        Uri.parse("https://dev-api.p2k.co.id/karir/simpan_lengkap" + edited));

    formdata_comlogo == null ? '' : request.files.add(multipart);
    // request.fields['formdata_apikey'] = keycode; //2
    //2

    print("formdata_jobtipe: " + formdata_jobtipe);
    print("formdata_comnama1: " + formdata_comnama1);
    print("formdata_jobposisi: " + formdata_jobposisi);
    print("formdata_joblokasi: " + formdata_joblokasi);
    print("formdata_comdeskripsi: " + formdata_comdeskripsi);
    print("formdata_jobpersayaratan: " + formdata_jobpersayaratan);
    print("formdata_jobalamat: " + formdata_jobalamat);
    print("formdata_jobpendidikan: " + formdata_jobpendidikan);
    print("formdata_jobdari: " + formdata_jobdari);
    print("formdata_jobhingga: " + formdata_jobhingga);
    print("formdata_jobseolink: " + formdata_jobseolink);
    // print("formdata_comlogo: "+formdata_comlogo;)
    print("formdata_comskala: " + formdata_comskala);
    print("formdata_comagency: " + formdata_comagency);
    print("formdata_comnama2: " + formdata_comnama2);
    print("formdata_combidang: " + formdata_combidang);
    print("formdata_comemail: " + formdata_comemail);
    print("formdata_comnotlp: " + formdata_comnotlp);
    print("formdata_comnofax: " + formdata_comnofax);
    print("formdata_comwebsite: " + formdata_comwebsite);
    print("formdata_comprovinsi: " + formdata_comprovinsi);
    print("formdata_comkota: " + formdata_comkota);
    print("formdata_comkecamatan: " + formdata_comkecamatan);
    print("formdata_comkelurahan: " + formdata_comkelurahan);
    print("formdata_comalamat: " + formdata_comalamat);
    print("formdata_comkodepos: " + formdata_comkodepos);
    print("formdata_comcpnama: " + formdata_comcpnama);
    print("formdata_comcpjabatan: " + formdata_comcpjabatan);
    print("formdata_comcpemail: "+formdata_comcpemail);
    //print("formdata_comcpemail: " + "daniyal.hafidz@gmail.com");
    print("formdata_comcpnotlp: " + formdata_comcpnotlp);
    print("input_captcha_h: " + input_captcha_h);
    print("input_captcha: " + input_captcha);
    print("formdata_jenis: " + formdata_jenis);
    print("formdata_cid: " + formdata_cid);

    request.fields["formdata_jobtipe"] = formdata_jobtipe;
    request.fields["formdata_comnama1"] = formdata_comnama1;
    request.fields["formdata_jobposisi"] = formdata_jobposisi;
    request.fields["formdata_joblokasi"] = formdata_joblokasi;
    request.fields["formdata_comdeskripsi"] = formdata_comdeskripsi;
    request.fields["formdata_jobpersayaratan"] = formdata_jobpersayaratan;
    request.fields["formdata_jobalamat"] = formdata_jobalamat;
    request.fields["formdata_jobpendidikan[]"] = formdata_jobpendidikan;
    request.fields["formdata_jobdari"] = formdata_jobdari;
    request.fields["formdata_jobhingga"] = formdata_jobhingga;
    request.fields["formdata_jobseolink"] = formdata_jobseolink;
    // request.fields["formdata_comlogo"] = formdata_comlogo;
    request.fields["formdata_comskala"] = formdata_comskala;
    request.fields["formdata_comagency"] = formdata_comagency;
    request.fields["formdata_comnama2"] = formdata_comnama2;
    request.fields["formdata_combidang"] = formdata_combidang;
    request.fields["formdata_comemail"] = formdata_comemail;
    request.fields["formdata_comnotlp"] = formdata_comnotlp;
    request.fields["formdata_comnofax"] = formdata_comnofax;
    request.fields["formdata_comwebsite"] = formdata_comwebsite;
    request.fields["formdata_comprovinsi"] = formdata_comprovinsi;
    request.fields["formdata_comkota"] = formdata_comkota;
    request.fields["formdata_comkecamatan"] = formdata_comkecamatan;
    request.fields["formdata_comkelurahan"] = formdata_comkelurahan;
    request.fields["formdata_comalamat"] = formdata_comalamat;
    request.fields["formdata_comkodepos"] = formdata_comkodepos;
    request.fields["formdata_comcpnama"] = formdata_comcpnama;
    request.fields["formdata_comcpjabatan"] = formdata_comcpjabatan;
    request.fields["formdata_comcpemail"] = formdata_comcpemail;
//    request.fields["formdata_comcpemail"] = "daniyal.hafidz@gmail.com";
    request.fields["formdata_comcpnotlp"] = formdata_comcpnotlp;
    request.fields["input_captcha_h"] = input_captcha_h;
    request.fields["input_captcha"] = input_captcha;
    request.fields["formdata_jenis"] = formdata_jenis;
    request.fields["formdata_cid"] = formdata_cid;

    final response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    request.send().then((onValue) {
      print("hasil_dua" + onValue.statusCode.toString());

      print(onValue.headers);
      print(onValue.contentLength);
    });

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(responseString);
      StatusResponseKarirModel listData =
      StatusResponseKarirModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data detail_campus");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
      print("Image Uploaded");

      // Flushbar(
      //   title: "Berhasil",
      //   message: "Data Berhasil Disimpan",
      //   duration: Duration(seconds: 3),
      //   flushbarPosition: FlushbarPosition.TOP,
      //   flushbarStyle: FlushbarStyle.FLOATING,
      //   reverseAnimationCurve: Curves.decelerate,
      //   forwardAnimationCurve: Curves.fastOutSlowIn,
      //   boxShadows: [
      //     BoxShadow(
      //         color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
      //   ],
      //   backgroundColor: Colors.green[600],
      // )..show(context);

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

  @override
  Future simpan_postin_loker_singkat(
      String email_edit,
      String cid_edit,
      String formdata_jobtipe,
      String formdata_comnama1,
      String formdata_jobposisi,
      String formdata_joblokasi,
      String formdata_comdeskripsi,
      String formdata_jobpersayaratan,
      String formdata_jobalamat,
      String formdata_jobpendidikan,
      String formdata_jobdari,
      String formdata_jobhingga,
      String formdata_jobseolink,
      File formdata_comlogo,
      String formdata_comskala,
      String formdata_comagency,
      String formdata_comnama2,
      String formdata_combidang,
      String formdata_comemail,
      String formdata_comnotlp,
      String formdata_comnofax,
      String formdata_comwebsite,
      String formdata_comprovinsi,
      String formdata_comkota,
      String formdata_comkecamatan,
      String formdata_comkelurahan,
      String formdata_comalamat,
      String formdata_comkodepos,
      String formdata_comcpnama,
      String formdata_comcpjabatan,
      String formdata_comcpemail,
      String formdata_comcpnotlp,
      String input_captcha_h,
      String input_captcha,
      String formdata_jenis,
      String formdata_cid,
      context) async {
    // var stream = new http.ByteStream(
    //     DelegatingStream.typed(formdata_comlogo.openRead()));
    // //read size image
    // var length = await formdata_comlogo.length();
    // //multipart
    // var multipart = http.MultipartFile('formdata_comlogo', stream, length,
    //     filename: formdata_comlogo.path);

    //GAUSAH PAKE FILE UNTUK SINGKAT

    // //imgoth1
    // var streamimgoth1 = formdata_comlogo != null
    //     ? new http.ByteStream(
    //         DelegatingStream.typed(formdata_comlogo.openRead()))
    //     : "";
    // //read size image
    // var lengthimgoth1 =
    //     formdata_comlogo != null ? await formdata_comlogo.length() : "";
    // //multipart
    // var multipart = formdata_comlogo != null
    //     ? http.MultipartFile('formdata_comlogo', streamimgoth1, lengthimgoth1,
    //         filename: formdata_comlogo.path)
    //     : File;
    var joe = cid_edit.replaceAll("", "");
    String edited = email_edit != "" ? "?email=$email_edit&cid=$joe" : "";

    String _url_ =
        email_edit != "" ? "?simpan_edit_singkat" : "simpan_singkat";
    // String _urls = email_edit!=""?"simpan_singkat":"insert_posting_singkat";
    // String _base_url = email_edit!=""?"https://dev-api.p2k.co.id/karir/":ConstanUrl().baseUrl;
    // var request = http.MultipartRequest(
    //     'POST', Uri.parse(_base_url + _urls + edited));

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://dev-api.p2k.co.id/karir/" + _url_ + edited));

    //formdata_comlogo == null ? '' : request.files.add(multipart);
    // request.fields['formdata_apikey'] = keycode; //2
    //2

    print("formdata_jobtipe" +
        "https://dev-api.p2k.co.id/karir/simpan_singkat" +
        edited);

    print("formdata_jobtipe: " + formdata_jobtipe);
    print("formdata_comnama1: " + formdata_comnama1);
    print("formdata_jobposisi: " + formdata_jobposisi);
    print("formdata_joblokasi: " + formdata_joblokasi);
    print("formdata_comdeskripsi: " + formdata_comdeskripsi);
    print("formdata_jobpersayaratan: " + formdata_jobpersayaratan);
    print("formdata_jobalamat: " + formdata_jobalamat);
    print("formdata_jobpendidikan: " + formdata_jobpendidikan);
    print("formdata_jobdari: " + formdata_jobdari);
    print("formdata_jobhingga: " + formdata_jobhingga);
    print("formdata_jobseolink: " + formdata_jobseolink);
    // print("formdata_comlogo: "+formdata_comlogo;)
    print("formdata_comskala: " + formdata_comskala);
    print("formdata_comagency: " + formdata_comagency);
    print("formdata_comnama2: " + formdata_comnama2);
    print("formdata_combidang: " + formdata_combidang);
    print("formdata_comemail: " + formdata_comemail);
    print("formdata_comnotlp: " + formdata_comnotlp);
    print("formdata_comnofax: " + formdata_comnofax);
    print("formdata_comwebsite: " + formdata_comwebsite);
    print("formdata_comprovinsi: " + formdata_comprovinsi);
    print("formdata_comkota: " + formdata_comkota);
    print("formdata_comkecamatan: " + formdata_comkecamatan);
    print("formdata_comkelurahan: " + formdata_comkelurahan);
    print("formdata_comalamat: " + formdata_comalamat);
    print("formdata_comkodepos: " + formdata_comkodepos);
    print("formdata_comcpnama: " + formdata_comcpnama);
    print("formdata_comcpjabatan: " + formdata_comcpjabatan);
    print("formdata_comcpemail: "+formdata_comcpemail);
    //print("formdata_comcpemail: " + "daniyal.hafidz@gmail.com");
    print("formdata_comcpnotlp: " + formdata_comcpnotlp);
    print("input_captcha_h: " + input_captcha_h);
    print("input_captcha: " + input_captcha);
    print("formdata_jenis: " + formdata_jenis);
    print("formdata_cid: " + formdata_cid);

    request.fields["formdata_jobtipe"] = formdata_jobtipe;
    request.fields["formdata_comnama1"] = formdata_comnama1;
    request.fields["formdata_jobposisi"] = formdata_jobposisi;
    request.fields["formdata_joblokasi"] = formdata_joblokasi;
    request.fields["formdata_comdeskripsi"] = formdata_comdeskripsi;
    request.fields["formdata_jobpersayaratan"] = formdata_jobpersayaratan;
    request.fields["formdata_jobalamat"] = formdata_jobalamat;
    request.fields["formdata_jobpendidikan"] = formdata_jobpendidikan;
    request.fields["formdata_jobdari"] = formdata_jobdari;
    request.fields["formdata_jobhingga"] = formdata_jobhingga;
    request.fields["formdata_jobseolink"] = formdata_jobseolink;
    // request.fields["formdata_comlogo"] = formdata_comlogo;
    request.fields["formdata_comskala"] = formdata_comskala;
    request.fields["formdata_comagency"] = formdata_comagency;
    request.fields["formdata_comnama2"] = formdata_comnama2;
    request.fields["formdata_combidang"] = formdata_combidang;
    request.fields["formdata_comemail"] = formdata_comemail;
    request.fields["formdata_comnotlp"] = formdata_comnotlp;
    request.fields["formdata_comnofax"] = formdata_comnofax;
    request.fields["formdata_comwebsite"] = formdata_comwebsite;
    request.fields["formdata_comprovinsi"] = formdata_comprovinsi;
    request.fields["formdata_comkota"] = formdata_comkota;
    request.fields["formdata_comkecamatan"] = formdata_comkecamatan;
    request.fields["formdata_comkelurahan"] = formdata_comkelurahan;
    request.fields["formdata_comalamat"] = formdata_comalamat;
    request.fields["formdata_comkodepos"] = formdata_comkodepos;
    request.fields["formdata_comcpnama"] = formdata_comcpnama;
    request.fields["formdata_comcpjabatan"] = formdata_comcpjabatan;
    request.fields["formdata_comcpemail"] = formdata_comcpemail;
//    request.fields["formdata_comcpemail"] = "daniyal.hafidz@gmail.com";
    request.fields["formdata_comcpnotlp"] = formdata_comcpnotlp;
    request.fields["input_captcha_h"] = input_captcha_h;
    request.fields["input_captcha"] = input_captcha;
    request.fields["formdata_jenis"] = formdata_jenis;
    request.fields["formdata_cid"] = formdata_cid;

    final response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("hasil_satu" + responseString);

    print("hasil_url" + "https://dev-api.p2k.co.id/karir/" + _url_ + edited);

    request.send().then((onValue) {
      print("hasil_dua" + onValue.statusCode.toString());

      print(onValue.headers);
      print(onValue.contentLength);
    });

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(responseString);
      StatusResponseKarirModel listData =
          StatusResponseKarirModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data detail_campus");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
      print("Image Uploaded");

      // Flushbar(
      //   title: "Berhasil",
      //   message: "Data Berhasil Disimpan",
      //   duration: Duration(seconds: 3),
      //   flushbarPosition: FlushbarPosition.TOP,
      //   flushbarStyle: FlushbarStyle.FLOATING,
      //   reverseAnimationCurve: Curves.decelerate,
      //   forwardAnimationCurve: Curves.fastOutSlowIn,
      //   boxShadows: [
      //     BoxShadow(
      //         color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
      //   ],
      //   backgroundColor: Colors.green[600],
      // )..show(context);

      // Navigator.pop(context);

      // Toast.show("Success", context, duration: 3, gravity: Toast.BOTTOM);

      // Navigator.pop(context);
    }
    else {
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

  @override
  Future simpan_postin_loker_sangat_singkat(
      String email_edit,
      String cid_edit,
      String formdata_jobtipe,
      String formdata_comnama1,
      String formdata_jobposisi,
      String formdata_joblokasi,
      String formdata_comdeskripsi,
      String formdata_jobpersayaratan,
      String formdata_jobalamat,
      String formdata_jobpendidikan,
      String formdata_jobdari,
      String formdata_jobhingga,
      String formdata_jobseolink,
      File formdata_comlogo,
      String formdata_comskala,
      String formdata_comagency,
      String formdata_comnama2,
      String formdata_combidang,
      String formdata_comemail,
      String formdata_comnotlp,
      String formdata_comnofax,
      String formdata_comwebsite,
      String formdata_comprovinsi,
      String formdata_comkota,
      String formdata_comkecamatan,
      String formdata_comkelurahan,
      String formdata_comalamat,
      String formdata_comkodepos,
      String formdata_comcpnama,
      String formdata_comcpjabatan,
      String formdata_comcpemail,
      String formdata_comcpnotlp,
      String input_captcha_h,
      String input_captcha,
      String formdata_jenis,
      String formdata_cid,
      context) async {
    // var streamimgoth1 = formdata_comlogo != null
    //     ? new http.ByteStream(
    //         DelegatingStream.typed(formdata_comlogo.openRead()))
    //     : "";
    // //read size image
    // var lengthimgoth1 =
    //     formdata_comlogo != null ? await formdata_comlogo.length() : "";
    // //multipart
    // var multipart = formdata_comlogo != null
    //     ? http.MultipartFile('formdata_comlogo', streamimgoth1, lengthimgoth1,
    //         filename: formdata_comlogo.path)
    //     : File;

    var joe = cid_edit.replaceAll("L", "");
    String edited = email_edit != "" ? "?email=$email_edit&cid=$cid_edit" : "";
    String _urls = email_edit != ""
        ? "simpan_edit_sangat_singkat"
        : "simpan_sangat_singkat";
    String _base_url = email_edit != ""
        ? "https://dev-api.p2k.co.id/karir/"
        : ConstanUrl().baseUrl;

    // var request = http.MultipartRequest('POST',
    //     Uri.parse(ConstanUrl().baseUrl + "insert_posting_sangat_singkat"));
    // var request = http.MultipartRequest(
    //     'POST', Uri.parse(_base_url + _urls + edited));

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://dev-api.p2k.co.id/karir/" + _urls + edited));

    //formdata_comlogo == null ? '' : request.files.add(multipart);
    // request.fields['formdata_apikey'] = keycode; //2
    //2

    print("formdata_jobtipe" + formdata_jobtipe);
    print("formdata_comnama1" + formdata_comnama1);
    print("formdata_jobposisi" + formdata_jobposisi);
    print("formdata_joblokasi" + formdata_joblokasi);
    print("formdata_comdeskripsi" + formdata_comdeskripsi);
    print("formdata_jobpersayaratan" + formdata_jobpersayaratan);
    print("formdata_jobalamat" + formdata_jobalamat);
    print("formdata_jobpendidikan" + formdata_jobpendidikan);
    print("formdata_jobdari" + formdata_jobdari);
    print("formdata_jobhingga" + formdata_jobhingga);
    print("formdata_jobseolink" + formdata_jobseolink);
    // print("formdata_comlogo"+formdata_comlogo;)
    print("formdata_comskala" + formdata_comskala);
    print("formdata_comagency" + formdata_comagency);
    print("formdata_comnama2" + formdata_comnama2);
    print("formdata_combidang" + formdata_combidang);
    print("formdata_comemail" + formdata_comemail);
    print("formdata_comnotlp" + formdata_comnotlp);
    print("formdata_comnofax" + formdata_comnofax);
    print("formdata_comwebsite" + formdata_comwebsite);
    print("formdata_comprovinsi" + formdata_comprovinsi);
    print("formdata_comkota" + formdata_comkota);
    print("formdata_comkecamatan" + formdata_comkecamatan);
    print("formdata_comkelurahan" + formdata_comkelurahan);
    print("formdata_comalamat" + formdata_comalamat);
    print("formdata_comkodepos" + formdata_comkodepos);
    print("formdata_comcpnama" + formdata_comcpnama);
    print("formdata_comcpjabatan" + formdata_comcpjabatan);
    // print("formdata_comcpemail"+formdata_comcpema)il;
    print("formdata_comcpemail" + "daniyal.hafidz@gmail.com");
    print("formdata_comcpnotlp" + formdata_comcpnotlp);
    print("input_captcha_h" + input_captcha_h);
    print("input_captcha" + input_captcha);
    print("formdata_jenis" + formdata_jenis);
    print("formdata_cid" + formdata_cid);

    request.fields["formdata_jobtipe"] = formdata_jobtipe;
    request.fields["formdata_comnama1"] = formdata_comnama1;
    request.fields["formdata_jobposisi"] = formdata_jobposisi;
    request.fields["formdata_joblokasi"] = formdata_joblokasi;
    request.fields["formdata_comdeskripsi"] = formdata_comdeskripsi;
    request.fields["formdata_jobpersayaratan"] = formdata_jobpersayaratan;
    request.fields["formdata_jobalamat"] = formdata_jobalamat;
    request.fields["formdata_jobpendidikan"] = formdata_jobpendidikan;
    request.fields["formdata_jobdari"] = formdata_jobdari;
    request.fields["formdata_jobhingga"] = formdata_jobhingga;
    request.fields["formdata_jobseolink"] = formdata_jobseolink;
    // request.fields["formdata_comlogo"] = formdata_comlogo;
    request.fields["formdata_comskala"] = formdata_comskala;
    request.fields["formdata_comagency"] = formdata_comagency;
    request.fields["formdata_comnama2"] = formdata_comnama2;
    request.fields["formdata_combidang"] = formdata_combidang;
    request.fields["formdata_comemail"] = formdata_comemail;
    request.fields["formdata_comnotlp"] = formdata_comnotlp;
    request.fields["formdata_comnofax"] = formdata_comnofax;
    request.fields["formdata_comwebsite"] = formdata_comwebsite;
    request.fields["formdata_comprovinsi"] = formdata_comprovinsi;
    request.fields["formdata_comkota"] = formdata_comkota;
    request.fields["formdata_comkecamatan"] = formdata_comkecamatan;
    request.fields["formdata_comkelurahan"] = formdata_comkelurahan;
    request.fields["formdata_comalamat"] = formdata_comalamat;
    request.fields["formdata_comkodepos"] = formdata_comkodepos;
    request.fields["formdata_comcpnama"] = formdata_comcpnama;
    request.fields["formdata_comcpjabatan"] = formdata_comcpjabatan;
    request.fields["formdata_comcpemail"] = formdata_comcpemail;
//    request.fields["formdata_comcpemail"] = "daniyal.hafidz@gmail.com";
    request.fields["formdata_comcpnotlp"] = formdata_comcpnotlp;
    request.fields["input_captcha_h"] = input_captcha_h;
    request.fields["input_captcha"] = input_captcha;
    request.fields["formdata_jenis"] = formdata_jenis;
    request.fields["formdata_cid"] = formdata_cid;

    final response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("hasil_satu" + responseString);

    print("hasil_url" + "https://dev-api.p2k.co.id/karir/" + _urls + edited);

    request.send().then((onValue) {
      print("hasil_dua" + onValue.statusCode.toString());

      print(onValue.headers);
      print(onValue.contentLength);
    });

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(responseString);
      StatusResponseKarirModel listData =
          StatusResponseKarirModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data detail_campus");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
      print("Image Uploaded");

      // Flushbar(
      //   title: "Berhasil",
      //   message: "Data Berhasil Disimpan",
      //   duration: Duration(seconds: 3),
      //   flushbarPosition: FlushbarPosition.TOP,
      //   flushbarStyle: FlushbarStyle.FLOATING,
      //   reverseAnimationCurve: Curves.decelerate,
      //   forwardAnimationCurve: Curves.fastOutSlowIn,
      //   boxShadows: [
      //     BoxShadow(
      //         color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
      //   ],
      //   backgroundColor: Colors.green[600],
      // )..show(context);

      // Navigator.pop(context);

      // Toast.show("Success", context, duration: 3, gravity: Toast.BOTTOM);

      // Navigator.pop(context);
    } else {
      print("Failed_response_code: " + response.statusCode.toString());
      print("Failed_response_code: " + response.reasonPhrase.toString());
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

  @override
  Future simpan_postin_loker_gambar(
      String email_edit,
      String cid_edit,
      String formdata_jobtipe,
      String formdata_comnama1,
      String formdata_jobposisi,
      String formdata_joblokasi,
      String formdata_comdeskripsi,
      String formdata_jobpersayaratan,
      String formdata_jobalamat,
      String formdata_jobpendidikan,
      String formdata_jobdari,
      String formdata_jobhingga,
      String formdata_jobseolink,
      //File formdata_comlogo,
      File formdata_jobgambar1,
      File formdata_jobgambar2,
      File formdata_jobgambar3,
      String formdata_comskala,
      String formdata_comagency,
      String formdata_comnama2,
      String formdata_combidang,
      String formdata_comemail,
      String formdata_comnotlp,
      String formdata_comnofax,
      String formdata_comwebsite,
      String formdata_comprovinsi,
      String formdata_comkota,
      String formdata_comkecamatan,
      String formdata_comkelurahan,
      String formdata_comalamat,
      String formdata_comkodepos,
      String formdata_comcpnama,
      String formdata_comcpjabatan,
      String formdata_comcpemail,
      String formdata_comcpnotlp,
      String input_captcha_h,
      String input_captcha,
      String formdata_jenis,
      String formdata_cid,
      String formdata_jobkatakunci,
      context) async {
    var stream = new http.ByteStream(
        DelegatingStream.typed(formdata_jobgambar1.openRead()));
    //read size image
    var length = await formdata_jobgambar1.length();
    //multipart
    var multipart = http.MultipartFile('formdata_jobgambar1', stream, length,
        filename: formdata_jobgambar1.path);

    //formdata_jobgambar2
    var streamimgoth1 = formdata_jobgambar2 != null
        ? new http.ByteStream(
            DelegatingStream.typed(formdata_jobgambar2.openRead()))
        : "";
    //read size image
    var lengthimgoth1 =
        formdata_jobgambar2 != null ? await formdata_jobgambar2.length() : "";
    //multipart
    var multipartgambar2 = formdata_jobgambar2 != null
        ? http.MultipartFile(
            'formdata_jobgambar2', streamimgoth1, lengthimgoth1,
            filename: formdata_jobgambar2.path)
        : File;

    // formdata_jobgambar3
    var streamimgoth2 = formdata_jobgambar3 != null
        ? new http.ByteStream(
            DelegatingStream.typed(formdata_jobgambar3.openRead()))
        : "";
    //read size image
    var lengthimgoth2 =
        formdata_jobgambar3 != null ? await formdata_jobgambar3.length() : "";
    //multipart
    var multipartgambar3 = formdata_jobgambar3 != null
        ? http.MultipartFile(
            'formdata_jobgambar3', streamimgoth2, lengthimgoth2,
            filename: formdata_jobgambar3.path)
        : "";

    // var request = http.MultipartRequest(
    //     'POST', Uri.parse(ConstanUrl().baseUrl + "insert_posting_gambar"));

    String edited = email_edit != "" ? "?email=$email_edit&cid=$cid_edit" : "";
    var request = http.MultipartRequest('POST',
        Uri.parse("https://dev-api.p2k.co.id/karir/simpan_gambar" + edited));
    request.files.add(multipart);

    formdata_jobgambar2 == null ? '' : request.files.add(multipartgambar2);

    formdata_jobgambar3 == null ? '' : request.files.add(multipartgambar3);
    // request.fields['formdata_apikey'] = keycode; //2
    //2

    //print("formdata_jobtipe" + multipart);
    //  print("formdata_jobtipe" + multipartgambar2);
    //   print("formdata_jobtipe" + multipartgambar3);
    // print("formdata_comnama1" + formdata_comnama1);
    // print("formdata_jobposisi" + formdata_jobposisi);
    // print("formdata_joblokasi" + formdata_joblokasi);
    // print("formdata_comdeskripsi" + formdata_comdeskripsi);
    // print("formdata_jobpersayaratan" + formdata_jobpersayaratan);
    // print("formdata_jobalamat" + formdata_jobalamat);
    // print("formdata_jobpendidikan" + formdata_jobpendidikan);
    // print("formdata_jobdari" + formdata_jobdari);
    // print("formdata_jobhingga" + formdata_jobhingga);
    // print("formdata_jobseolink" + formdata_jobseolink);
    // // print("formdata_comlogo"+formdata_comlogo;)
    // print("formdata_comskala" + formdata_comskala);
    // print("formdata_comagency" + formdata_comagency);
    // print("formdata_comnama2" + formdata_comnama2);
    // print("formdata_combidang" + formdata_combidang);
    // print("formdata_comemail" + formdata_comemail);
    // print("formdata_comnotlp" + formdata_comnotlp);
    // print("formdata_comnofax" + formdata_comnofax);
    // print("formdata_comwebsite" + formdata_comwebsite);
    // print("formdata_comprovinsi" + formdata_comprovinsi);
    // print("formdata_comkota" + formdata_comkota);
    // print("formdata_comkecamatan" + formdata_comkecamatan);
    // print("formdata_comkelurahan" + formdata_comkelurahan);
    // print("formdata_comalamat" + formdata_comalamat);
    // print("formdata_comkodepos" + formdata_comkodepos);
    // print("formdata_comcpnama" + formdata_comcpnama);
    // print("formdata_comcpjabatan" + formdata_comcpjabatan);
    // // print("formdata_comcpemail"+formdata_comcpema)il;
    // print("formdata_comcpemail" + "daniyal.hafidz@gmail.com");
    // print("formdata_comcpnotlp" + formdata_comcpnotlp);
    // print("input_captcha_h" + input_captcha_h);
    // print("input_captcha" + input_captcha);
    // print("formdata_jenis" + formdata_jenis);
    // print("formdata_cid" + formdata_cid);

    request.fields["formdata_jobtipe"] = formdata_jobtipe;
    request.fields["formdata_comnama1"] = formdata_comnama1;
    request.fields["formdata_jobposisi"] = formdata_jobposisi;
    request.fields["formdata_joblokasi"] = formdata_joblokasi;
    request.fields["formdata_comdeskripsi"] = formdata_comdeskripsi;
    request.fields["formdata_jobpersayaratan"] = formdata_jobpersayaratan;
    request.fields["formdata_jobalamat"] = formdata_jobalamat;
    request.fields["formdata_jobpendidikan"] = formdata_jobpendidikan;
    request.fields["formdata_jobdari"] = formdata_jobdari;
    request.fields["formdata_jobhingga"] = formdata_jobhingga;
    request.fields["formdata_jobseolink"] = formdata_jobseolink;
    // request.fields["formdata_comlogo"] = formdata_comlogo;
    request.fields["formdata_comskala"] = formdata_comskala;
    request.fields["formdata_comagency"] = formdata_comagency;
    request.fields["formdata_comnama2"] = formdata_comnama2;
    request.fields["formdata_combidang"] = formdata_combidang;
    request.fields["formdata_comemail"] = formdata_comemail;
    request.fields["formdata_comnotlp"] = formdata_comnotlp;
    request.fields["formdata_comnofax"] = formdata_comnofax;
    request.fields["formdata_comwebsite"] = formdata_comwebsite;
    request.fields["formdata_comprovinsi"] = formdata_comprovinsi;
    request.fields["formdata_comkota"] = formdata_comkota;
    request.fields["formdata_comkecamatan"] = formdata_comkecamatan;
    request.fields["formdata_comkelurahan"] = formdata_comkelurahan;
    request.fields["formdata_comalamat"] = formdata_comalamat;
    request.fields["formdata_comkodepos"] = formdata_comkodepos;
    request.fields["formdata_comcpnama"] = formdata_comcpnama;
    request.fields["formdata_comcpjabatan"] = formdata_comcpjabatan;
    request.fields["formdata_comcpemail"] = formdata_comcpemail;
//    request.fields["formdata_comcpemail"] = "daniyal.hafidz@gmail.com";
    request.fields["formdata_comcpnotlp"] = formdata_comcpnotlp;
    request.fields["input_captcha_h"] = input_captcha_h;
    request.fields["input_captcha"] = input_captcha;
    request.fields["formdata_jenis"] = formdata_jenis;
    request.fields["formdata_cid"] = formdata_cid;
    request.fields["formdata_jobkatakunci"] = formdata_jobkatakunci;

    final response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("hasil" + responseString);

    request.send().then((onValue) {
      print("hasil" + onValue.statusCode.toString());

      print(onValue.headers);
      print(onValue.contentLength);
    });

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(responseString);
      StatusResponseKarirModel listData =
      StatusResponseKarirModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data detail_campus");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
      print("Image Uploaded");
      // Flushbar(
      //   title: "Berhasil",
      //   message: "Data Berhasil Disimpan",
      //   duration: Duration(seconds: 3),
      //   flushbarPosition: FlushbarPosition.TOP,
      //   flushbarStyle: FlushbarStyle.FLOATING,
      //   reverseAnimationCurve: Curves.decelerate,
      //   forwardAnimationCurve: Curves.fastOutSlowIn,
      //   boxShadows: [
      //     BoxShadow(
      //         color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
      //   ],
      //   backgroundColor: Colors.green[600],
      // )..show(context);

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

  @override
  Future simpan_postin_loker_pdf(
      String email_edit,
      String cid_edit,
      String formdata_jobtipe,
      String formdata_comnama1,
      String formdata_jobposisi,
      String formdata_joblokasi,
      String formdata_comdeskripsi,
      String formdata_jobpersayaratan,
      String formdata_jobalamat,
      String formdata_jobpendidikan,
      String formdata_jobdari,
      String formdata_jobhingga,
      String formdata_jobseolink,
      File formdata_jobpdf,
      String formdata_comskala,
      String formdata_comagency,
      String formdata_comnama2,
      String formdata_combidang,
      String formdata_comemail,
      String formdata_comnotlp,
      String formdata_comnofax,
      String formdata_comwebsite,
      String formdata_comprovinsi,
      String formdata_comkota,
      String formdata_comkecamatan,
      String formdata_comkelurahan,
      String formdata_comalamat,
      String formdata_comkodepos,
      String formdata_comcpnama,
      String formdata_comcpjabatan,
      String formdata_comcpemail,
      String formdata_comcpnotlp,
      String input_captcha_h,
      String input_captcha,
      String formdata_jenis,
      String formdata_cid,
      String formdata_jobkatakunci,
      context) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(formdata_jobpdf.openRead()));
    //read size image
    var length = await formdata_jobpdf.length();
    //multipart
    var multipart = http.MultipartFile('formdata_jobpdf', stream, length,
        filename: formdata_jobpdf.path);
    // var request = http.MultipartRequest(
    //     'POST', Uri.parse(ConstanUrl().baseUrl + "insert_posting_pdf"));

    var joe = cid_edit.replaceAll("L", "");
    String edited = email_edit != "" ? "?email=$email_edit&cid=$joe" : "";
    String _urls = email_edit != "" ? "simpan_pdf" : "insert_posting_pdf";
    String _base_url = email_edit != ""
        ? "https://dev-api.p2k.co.id/karir/"
        : ConstanUrl().baseUrl;
    var request =
        http.MultipartRequest('POST', Uri.parse(_base_url + _urls + edited));

    request.files.add(multipart);
    // request.fields['formdata_apikey'] = keycode; //2
    //2

    print("formdata_jobtipe" + formdata_jobtipe);
    print("formdata_comnama1" + formdata_comnama1);
    print("formdata_jobposisi" + formdata_jobposisi);
    print("formdata_joblokasi" + formdata_joblokasi);
    print("formdata_comdeskripsi" + formdata_comdeskripsi);
    print("formdata_jobpersayaratan" + formdata_jobpersayaratan);
    print("formdata_jobalamat" + formdata_jobalamat);
    print("formdata_jobpendidikan" + formdata_jobpendidikan);
    print("formdata_jobdari" + formdata_jobdari);
    print("formdata_jobhingga" + formdata_jobhingga);
    print("formdata_jobseolink" + formdata_jobseolink);
    // print("formdata_comlogo"+formdata_comlogo;)
    print("formdata_comskala" + formdata_comskala);
    print("formdata_comagency" + formdata_comagency);
    print("formdata_comnama2" + formdata_comnama2);
    print("formdata_combidang" + formdata_combidang);
    print("formdata_comemail" + formdata_comemail);
    print("formdata_comnotlp" + formdata_comnotlp);
    print("formdata_comnofax" + formdata_comnofax);
    print("formdata_comwebsite" + formdata_comwebsite);
    print("formdata_comprovinsi" + formdata_comprovinsi);
    print("formdata_comkota" + formdata_comkota);
    print("formdata_comkecamatan" + formdata_comkecamatan);
    print("formdata_comkelurahan" + formdata_comkelurahan);
    print("formdata_comalamat" + formdata_comalamat);
    print("formdata_comkodepos" + formdata_comkodepos);
    print("formdata_comcpnama" + formdata_comcpnama);
    print("formdata_comcpjabatan" + formdata_comcpjabatan);
    // print("formdata_comcpemail"+formdata_comcpema)il;
    print("formdata_comcpemail" + "daniyal.hafidz@gmail.com");
    print("formdata_comcpnotlp" + formdata_comcpnotlp);
    print("input_captcha_h" + input_captcha_h);
    print("input_captcha" + input_captcha);
    print("formdata_jenis" + formdata_jenis);
    print("formdata_cid" + formdata_cid);

    request.fields["formdata_jobtipe"] = formdata_jobtipe;
    request.fields["formdata_comnama1"] = formdata_comnama1;
    request.fields["formdata_jobposisi"] = formdata_jobposisi;
    request.fields["formdata_joblokasi"] = formdata_joblokasi;
    request.fields["formdata_comdeskripsi"] = formdata_comdeskripsi;
    request.fields["formdata_jobpersayaratan"] = formdata_jobpersayaratan;
    request.fields["formdata_jobalamat"] = formdata_jobalamat;
    request.fields["formdata_jobpendidikan"] = formdata_jobpendidikan;
    request.fields["formdata_jobdari"] = formdata_jobdari;
    request.fields["formdata_jobhingga"] = formdata_jobhingga;
    request.fields["formdata_jobseolink"] = formdata_jobseolink;
    // request.fields["formdata_comlogo"] = formdata_comlogo;
    request.fields["formdata_comskala"] = formdata_comskala;
    request.fields["formdata_comagency"] = formdata_comagency;
    request.fields["formdata_comnama2"] = formdata_comnama2;
    request.fields["formdata_combidang"] = formdata_combidang;
    request.fields["formdata_comemail"] = formdata_comemail;
    request.fields["formdata_comnotlp"] = formdata_comnotlp;
    request.fields["formdata_comnofax"] = formdata_comnofax;
    request.fields["formdata_comwebsite"] = formdata_comwebsite;
    request.fields["formdata_comprovinsi"] = formdata_comprovinsi;
    request.fields["formdata_comkota"] = formdata_comkota;
    request.fields["formdata_comkecamatan"] = formdata_comkecamatan;
    request.fields["formdata_comkelurahan"] = formdata_comkelurahan;
    request.fields["formdata_comalamat"] = formdata_comalamat;
    request.fields["formdata_comkodepos"] = formdata_comkodepos;
    request.fields["formdata_comcpnama"] = formdata_comcpnama;
    request.fields["formdata_comcpjabatan"] = formdata_comcpjabatan;
    request.fields["formdata_comcpemail"] = formdata_comcpemail;
//    request.fields["formdata_comcpemail"] = "daniyal.hafidz@gmail.com";
    request.fields["formdata_comcpnotlp"] = formdata_comcpnotlp;
    request.fields["input_captcha_h"] = input_captcha_h;
    request.fields["input_captcha"] = input_captcha;
    request.fields["formdata_jenis"] = formdata_jenis;
    request.fields["formdata_cid"] = formdata_cid;
    request.fields["formdata_jobkatakunci"] = formdata_jobkatakunci;

    final response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("hasil" + responseString);

    request.send().then((onValue) {
      print("hasil" + onValue.statusCode.toString());

      print(onValue.headers);
      print(onValue.contentLength);
    });

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(responseString);
      StatusResponseKarirModel listData =
      StatusResponseKarirModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data detail_campus");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }

      // Flushbar(
      //   title: "Berhasil",
      //   message: "Data Berhasil Disimpan",
      //   duration: Duration(seconds: 3),
      //   flushbarPosition: FlushbarPosition.TOP,
      //   flushbarStyle: FlushbarStyle.FLOATING,
      //   reverseAnimationCurve: Curves.decelerate,
      //   forwardAnimationCurve: Curves.fastOutSlowIn,
      //   boxShadows: [
      //     BoxShadow(
      //         color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
      //   ],
      //   backgroundColor: Colors.green[600],
      // )..show(context);

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

  Future check_edit(String cid, String jenis_lowongan) async {
    try {
      final response =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "check_edit"), body: {
        'cid': cid.toString(),
        'jenis_lowongan': jenis_lowongan.toString(),
      });

      final jsondata = jsonDecode(response.body);
      DetailKarirMeModel listData = DetailKarirMeModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("result_data_edit: " + jsondata.toString());
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
    } catch (e) {
      print("error check_edit $e");
      return null;
    }
  }

  Future<List<ListDetailJurusanPengelompok>> biayasipema_baru_kelompok(
      String kode_kampus, String kode_jurusan,String kodeprg) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "biayasipema_baru_kelompok"),
      //     headers: {"Accept": "application/json"});

      final hasil = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "biayasipema_baru_kelompok"), body: {
        'kode_kampus': kode_kampus.toString(),
        'kode_jurusan': kode_jurusan.toString(),
        'kodeprg': kodeprg.toString(),
      });

      print("biayasipema_baru_kelompok" + hasil.body);
      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = listDetailJurusanPengelompokFromJson(hasil.body);
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

  Future<List<MasterJurusanModel>> biayasipema_baru_program(
      String kode_kampus, String kode_jurusan) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "biayasipema_baru_program"),
      //     headers: {"Accept": "application/json"});

      final hasil = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "biayasipema_baru_program"), body: {
        'kode_kampus': kode_kampus.toString(),
        'kode_jurusan': kode_jurusan.toString(),
      });

      print("biayasipema_baru_kelompok" + hasil.body);
      if (hasil.statusCode == 200) {
        // print(hasil.body);
        final data = masterJurusanModelFromJson(hasil.body);
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
}
