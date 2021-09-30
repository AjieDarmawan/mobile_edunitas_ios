part of 'viewmodel.dart';

class Masterview_model {
  Future<List> provinsi() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "provinsi")),
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

  Future<List> kab__kota(String idprovinsi) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "kab__kota"),
      //     headers: {"Accept": "application/json"});
      final hasil = await http.post(Uri.parse(ConstanUrl().baseUrl + "kabkota"), body: {
        'id_parent': idprovinsi.toString(),
      });

      //  print("response${hasil.body}");
      if (hasil.statusCode == 200) {
        print("data kab__kota success");
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

  Future<List> kecamatan(String idkabkota) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "kecamatan"),
      //     headers: {"Accept": "application/json"});

      final hasil = await http.post(Uri.parse(ConstanUrl().baseUrl + "kecamatan"), body: {
        'id_parent': idkabkota.toString(),
      });

      print("response${hasil.body}");
      if (hasil.statusCode == 200) {
        print("data kab__kota success");
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

  Future<List> desa(String idkecamatan) async {
    try {
      // http.Response hasil = await http.get(
      //     Uri.encodeFull(ConstanUrl().baseUrl + "kab__kota"),
      //     headers: {"Accept": "application/json"});

      final hasil = await http.post(Uri.parse(ConstanUrl().baseUrl + "desa"), body: {
        'id_parent': idkecamatan.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data kab__kota success");
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

  // ini buat patner kampus . all kota ya
  Future<List> kota() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "kota")),
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

  Future<List<MasterJurusanModel>> jurusan() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "masterjurusan")),
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

  Future<List<MasterJurusanModel>> jurusan_detail(String kode_jurusan) async {
    try {
      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "jurusan_detail"), body: {
        'kode_jurusan': kode_jurusan.toString(),
      });

      if (hasil.statusCode == 200) {
        print("data jurusan detail success");
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

  Future<List<KelasModel>> masterkelas() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "kelas")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data masterkelas success");
        final data = kelasModelFromJson(hasil.body);
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

  Future<List<UnitAreaModel>> unitarea() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "unitarea")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data unitarea success");
        final data = unitAreaModelFromJson(hasil.body);
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

  Future<List<PendidikanModel>> masterpendidikan() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "pendidikan")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data masterpendidikan success");
        final data = pendidikanModelFromJson(hasil.body);
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

  Future<List<PendidikanModel>> pendidikan_registrasi_daftar(
      String kodelulusan) async {
    try {
      final hasil = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "pendidikan_registrasi_daftar"), body: {
        'kodelulusan': kodelulusan.toString(),

        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      if (hasil.statusCode == 200) {
        print("data pendidikan_registrasi_daftar success");
        final data = pendidikanModelFromJson(hasil.body);
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

  Future pendidikan_registrasi_daftar_mapping(
      String kodelulusan, String kelompok) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response = await http.post(
        Uri.parse(ConstanUrl().baseUrl + "pendidikan_registrasi_daftar_mapping"),
        body: {
          'kodelulusan': kodelulusan.toString(),
          'kelompok': kelompok.toString(),
        });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

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

  Future<List<MetodePembayaranModel>> metodepembayaran(
      String kodekampus, String no_virtual) async {
    try {
      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "metodepembayaran"), body: {
        'kode': kodekampus.toString(),
        'no_virtual': no_virtual.toString(),
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      if (hasil.statusCode == 200) {
        print("data metodepembayaran success");
        final data = metodePembayaranModelFromJson(hasil.body);
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

  Future<List<SmbModel>> sumber_smb() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "sumber_smb")),
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

  Future va(String keycode, String id_invoice) async {
    final response = await http.post(Uri.parse(ConstanUrl().baseUrl + "va"), body: {
      'keycode': keycode,
      'id_invoice': id_invoice,
    });

    final jsondata = jsonDecode(response.body);
    LoginModel listData = LoginModel.fromJson(jsondata);

    if (listData.status == 200) {
      print(listData);
      return listData;
    } else if (listData.status == 300) {
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

  Future<List> kampus_master() async {
    try {
      http.Response hasil = await http.get(
        Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "kampus_master")),
        // headers: {"Accept": "application/json"}
      );
      if (hasil.statusCode == 200) {
        print("data kampus success");
        // final data = lowonganModelFromJson(hasil.body);
        final data = kampusMasterModelFromJson(hasil.body);
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

  Future prodimultipe() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "jurusan_all_multiple")),
          headers: {"Accept": "application/json"});
          
          print("testing${hasil.body}");
      if (hasil.statusCode == 200) {
        print("data jurusan_all_multiple success");
        final data = prodiMultipeModelFromJson(hasil.body);
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

   Future<List<PendidikanModel>> conf_leveledu_all() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "conf_leveledu_all")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data masterpendidikan success");
        final data = pendidikanModelFromJson(hasil.body);
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

  Future<List<PendidikanModel>> tahun_kelulusan() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "tahun")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data masterpendidikan success");
        final data = pendidikanModelFromJson(hasil.body);
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

   Future<List> bahasa() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "bahasa")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data bahasa success");
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

   Future<List> keterampilan() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "keterampilan")),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data keterampilan success");
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


}
