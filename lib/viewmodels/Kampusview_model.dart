part of 'viewmodel.dart';

class Kampusview_model {
  // Future<List> getKampus() async {
  //   try {
  //     http.Response hasil = await http.get(
  //       Uri.encodeFull(ConstanUrl().baseUrl + "list_campus"),
  //       // headers: {"Accept": "application/json"}
  //     );
  //     if (hasil.statusCode == 200) {
  //       print("data kampus success");
  //       // final data = lowonganModelFromJson(hasil.body);
  //       final data = listCampusModelFromJson(hasil.body);
  //       return data.campus;
  //     } else {
  //       print("error status " + hasil.statusCode.toString());
  //       return null;
  //     }
  //   } catch (e) {
  //     print("error catch $e");
  //     return null;
  //   }
  // }

  Future<List> getKampus() async {
    List<Photo> _photos = [];
    try {
      final response =
          await http.get("https://dev-api.edunitas.com/list_campus?page=1");
      List<Photo> fetchedPhotos = Photo.parseList(json.decode(response.body));
      _photos.addAll(fetchedPhotos);
      return _photos;
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  Future<List> SearchgetKampusFront(String search) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "search_campus_home", body: {
        'search': search.toString(),
      });

      print(hasil);
      if (hasil.statusCode == 200) {
        print("data search_campus success");
        // final data = lowonganModelFromJson(hasil.body);
        List<Photo> data = Photo.parseList(json.decode(hasil.body));
        return data;
      } else {
        print("data error status search_campus error");
        print("error status master" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch kampus $e");
      return null;
    }
  }

  Future<List> SearchgetKampus(
      String nilaiunitarea, String jurusan, String kelas) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "search_campus", body: {
        'unitarea': nilaiunitarea.toString(),
        'jurusan': jurusan.toString(),
        'kelas': kelas.toString(),
      });

      print("bodySearchgetKampus${hasil.body}");
      if (hasil.statusCode == 200) {
        print("data search_campus success");
        // final data = lowonganModelFromJson(hasil.body);
        List<Photo> data = Photo.parseList(json.decode(hasil.body));
        return data;
      } else {
        print("data error status search_campus error");
        print("error status master" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch kampus $e");
      return null;
    }
  }

  Future detailCampus(String kodekampus) async {
    try {
      final response =
          await http.post(ConstanUrl().baseUrl + "detail_campus", body: {
        'kode_kampus': kodekampus.toString(),
      });

      final jsondata = jsonDecode(response.body);
      DetailCampusModel listData = DetailCampusModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data detail_campus");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
    } catch (e) {
      print("error detail_campus $e");
      return null;
    }
  }

  Future<List> search_prodi(String nilaiarea) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "search_prodi", body: {
        'unitarea': nilaiarea.toString(),
      });
      if (hasil.statusCode == 200) {
        print("data SearchProdimasterjurusan success");
        final data = searchProdiModelFromJson(hasil.body);
        return data;

        // final jsondata = jsonDecode(hasil.body);
        // SearchProdiModel listData = SearchProdiModel.fromJson(jsondata);
        // return listData;

      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  Future<List> search_prodi_listcampus(
      String nilaiunitarea, String jurusan) async {
    try {
      final hasil = await http
          .post(ConstanUrl().baseUrl + "search_prodi_listcampus", body: {
        'unitarea': nilaiunitarea.toString(),
        'jurusan': jurusan.toString(),
      });

      print(hasil);
      if (hasil.statusCode == 200) {
        print("data search_campus success");
        // final data = lowonganModelFromJson(hasil.body);
        List<Photo> data = Photo.parseList(json.decode(hasil.body));
        return data;
      } else {
        print("data error status search_campus error");
        print("error status master" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch kampus $e");
      return null;
    }
  }

  Future campuskelas(String kodekampus, String kodejrs, String kodeprg) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "campuskelas", body: {
        'kode_kampus': kodekampus.toString(),
        'kodejrs': kodejrs.toString(),
        'kodeprg': kodeprg.toString(),
      });
      if (hasil.statusCode == 200) {
        print("data SearchProdimasterjurusan success");

        final jsondata = jsonDecode(hasil.body);
        CampuskelasModel data = CampuskelasModel.fromJson(jsondata);

        //final data = campuskelasModelFromJson(hasil.body);
        return data;

        // final jsondata = jsonDecode(hasil.body);
        // SearchProdiModel listData = SearchProdiModel.fromJson(jsondata);
        // return listData;

      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  Future pendaftaran(
    String keycode,
    String kodecampus,
    String prodi,
    String kelas,
    String pendidikan,
    String kelompok,
    String item, //5
    String total,
    String tahun,
    String angkatan,
    String waktu,
    String smb, //10
    String label_kampus,
    String label_kelas,
    String label_waktu,
    String label_prodi,
    String label_wilayah, //15
    String nama,
    String tem_lahir,
    String tgl_lahir,
    String gender,
    String email, //20
    String no_hp,
    String no_wa,
    String nikktp,
    String ayahkandung,
    String ibukandung, //25
    String alamat1,
    String kodepos,
    String kota,
    String kecamatan,
    String kelurahan, //30
    String kodejrs,
    String wkt_kul,
    String smb_informasi,
    String kode_gsf,
    String konversi, //35
    String formulir,
    String jaket,
    String spb,
    String spp,
    String pengalaman,
    String pengalaman_dari,
    String pengalaman_hingga,
    String namaperusahaan,
    String posisi,
    //pendidikan
    String jurusan,
    String thnlulus,
    String nilaiakhir,
    String daripendidikan,
    String poin_redeem,
    String diskon_redeem,
    String key_redeem,
    String status_agent,
    String keycode_agent,
  ) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "integrasi_sipema", body: {
      'keycode': keycode.toString(),
      'kodecampus': kodecampus.toString(), // zzz
      'prodi': prodi.toString(), //s1k1
      'kelas': kelas.toString(), //bl
      'pendidikan': pendidikan.toString(), //
      'kelompok': kelompok.toString(), //S
      'item': item.toString(), //formu
      'total': total.toString(), //'9500
      'tahun': tahun.toString(), //1.202
      'angkatan': angkatan.toString(), //'4
      'waktu': waktu.toString(), //'SE'
      'smb': smb.toString(), //'Brosur
      'label_kampus': label_kampus.toString(),
      'label_kelas': label_kelas.toString(),
      'label_waktu': label_waktu.toString(),
      'label_prodi': label_prodi.toString(),
      'label_wilayah': label_wilayah.toString(),
      'nama': nama.toString(), //Coba
      'tem_lahir': tem_lahir.toString(), //
      'tgl_lahir': tgl_lahir.toString(), //
      'gender': gender.toString(), //L
      'email': email.toString(), //dani
      'no_hp': no_hp.toString(), //0812
      'no_wa': no_wa.toString(), //0812
      'nikktp': nikktp.toString(), //101
      'ayahkandung': ayahkandung.toString(),
      'ibukandung': ibukandung.toString(),
      'alamat1': alamat1.toString(), //Jl
      'kodepos': kodepos.toString(),
      'kota': kota.toString(), //Kota
      'kecamatan': kecamatan.toString(), //
      'kelurahan': kelurahan.toString(), //
      'tahun': tahun.toString(), //1.20
      // 'angkatan':angkatan.toString(), //4
      'kodejrs': kodejrs.toString(), //S1
      'kelompok': kelompok.toString(), //S
      'wkt_kul': wkt_kul.toString(), //SE
      'smb_informasi': smb_informasi.toString(),
      'kode_gsf': kode_gsf.toString(),
      'formulir': formulir.toString(), //1
      'jaket': jaket.toString(), //1:15
      'spb': spb.toString(), //46:100
      'spp': spp.toString(), //6:5000
      'konversi': konversi.toString(), //1

      //pengalaman
      'pengalaman': pengalaman.toString(),
      'pengalaman_dari': pengalaman_dari.toString(),
      'pengalaman_hingga': pengalaman_hingga.toString(),
      'namaperusahaan': namaperusahaan.toString(),
      'posisi': posisi.toString(),

      //pendidikan
      'jurusan': jurusan.toString(),
      'thnlulus': thnlulus.toString(),
      'nilaiakhir': nilaiakhir.toString(),
      'daripendidikan': daripendidikan.toString(),

      //promo
      'poin_redeem': poin_redeem.toString(),
      'diskon_redeem': diskon_redeem.toString(),
      'key_redeem': key_redeem.toString(),
      'status_agent': status_agent.toString(),
      'keycode_agent': keycode_agent.toString(),
    });

    final jsondata = jsonDecode(response.body);
    print("q1${jsondata}");
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

  Future pendaftaran_nonregistrasi(
    String keycode,
    String kodecampus,
    String prodi,
    String kelas,
    String pendidikan,
    String kelompok,
    String item, //5
    String total,
    String tahun,
    String angkatan,
    String waktu,
    String smb, //10
    String label_kampus,
    String label_kelas,
    String label_waktu,
    String label_prodi,
    String label_wilayah, //15
    String nama,
    String tem_lahir,
    String tgl_lahir,
    String gender,
    String email, //20
    String no_hp,
    String no_wa,
    String nikktp,
    String ayahkandung,
    String ibukandung, //25
    String alamat1,
    String kodepos,
    String kota,
    String kecamatan,
    String kelurahan, //30
    String kodejrs,
    String wkt_kul,
    String smb_informasi,
    String kode_gsf,
    String konversi, //35
    String formulir,
    String jaket,
    String spb,
    String spp,
    String pengalaman,
    String pengalaman_dari,
    String pengalaman_hingga,
    String namaperusahaan,
    String posisi,
    //pendidikan
    String jurusan,
    String thnlulus,
    String nilaiakhir,
    String daripendidikan,
    String poin_redeem,
    String diskon_redeem,
    String key_redeem,
  ) async {
    final response = await http.post(
        ConstanUrl().baseUrl + "integrasi_sipema_pendaftaran_nonlogin",
        body: {
          'keycode': keycode.toString(),
          'kodecampus': kodecampus.toString(), // zzz
          'prodi': prodi.toString(), //s1k1
          'kelas': kelas.toString(), //bl
          'pendidikan': pendidikan.toString(), //
          'kelompok': kelompok.toString(), //S
          'item': item.toString(), //formu
          'total': total.toString(), //'9500
          'tahun': tahun.toString(), //1.202
          'angkatan': angkatan.toString(), //'4
          'waktu': waktu.toString(), //'SE'
          'smb': smb.toString(), //'Brosur
          'label_kampus': label_kampus.toString(),
          'label_kelas': label_kelas.toString(),
          'label_waktu': label_waktu.toString(),
          'label_prodi': label_prodi.toString(),
          'label_wilayah': label_wilayah.toString(),
          'nama': nama.toString(), //Coba
          'tem_lahir': tem_lahir.toString(), //
          'tgl_lahir': tgl_lahir.toString(), //
          'gender': gender.toString(), //L
          'email': email.toString(), //dani
          'no_hp': no_hp.toString(), //0812
          'no_wa': no_wa.toString(), //0812
          'nikktp': nikktp.toString(), //101
          'ayahkandung': ayahkandung.toString(),
          'ibukandung': ibukandung.toString(),
          'alamat1': alamat1.toString(), //Jl
          'kodepos': kodepos.toString(),
          'kota': kota.toString(), //Kota
          'kecamatan': kecamatan.toString(), //
          'kelurahan': kelurahan.toString(), //
          'tahun': tahun.toString(), //1.20
          // 'angkatan':angkatan.toString(), //4
          'kodejrs': kodejrs.toString(), //S1
          'kelompok': kelompok.toString(), //S
          'wkt_kul': wkt_kul.toString(), //SE
          'smb_informasi': smb_informasi.toString(),
          'kode_gsf': kode_gsf.toString(),
          'formulir': formulir.toString(), //1
          'jaket': jaket.toString(), //1:15
          'spb': spb.toString(), //46:100
          'spp': spp.toString(), //6:5000
          'konversi': konversi.toString(), //1

          //pengalaman
          'pengalaman': pengalaman.toString(),
          'pengalaman_dari': pengalaman_dari.toString(),
          'pengalaman_hingga': pengalaman_hingga.toString(),
          'namaperusahaan': namaperusahaan.toString(),
          'posisi': posisi.toString(),

          //pendidikan
          'jurusan': jurusan.toString(),
          'thnlulus': thnlulus.toString(),
          'nilaiakhir': nilaiakhir.toString(),
          'daripendidikan': daripendidikan.toString(),

          //promo
          'poin_redeem': poin_redeem.toString(),
          'diskon_redeem': diskon_redeem.toString(),
          'key_redeem': key_redeem.toString(),
        });

    final jsondata = jsonDecode(response.body);
    print("q1${jsondata}");
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 400) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else if (listData.status == 405) {
      return listData;
    } else if (listData.status == 500) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future<List> getinbox(String keycode) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "message", body: {
        'keycode': keycode.toString()
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      // print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        final data = messageModelFromJson(hasil.body);
        return data.data.list;
      } else {
        print("data error status message error");
        print("error status message" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction tes $e");
      return null;
    }
  }

  Future read_message(String id) async {
    final response = await http.post(ConstanUrl().baseUrl + "read", body: {
      'id': id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future count_read(String keycode) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "count_read", body: {
      'keycode': keycode,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future delete_message(String id) async {
    final response =
        await http.post(ConstanUrl().baseUrl + "delete_message", body: {
      'id': id,
    });

    final jsondata = jsonDecode(response.body);
    StatusModel listData = StatusModel.fromJson(jsondata);

    if (listData.status == 200) {
      return listData;
    } else if (listData.status == 404) {
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }

  Future<List> searchCampusjurusan(String nilaiunitarea, String jurusan) async {
    try {
      final hasil = await http
          .post(ConstanUrl().baseUrl + "search_kampus_jurusan", body: {
        'unitarea': nilaiunitarea.toString(),
        'kode_jurusan': jurusan.toString(),
      });

      print("hasil campus ${hasil}");
      if (hasil.statusCode == 200) {
        print("data search_campus success");
        // final data = lowonganModelFromJson(hasil.body);
        List<Photo> data = Photo.parseList(json.decode(hasil.body));
        return data;
      } else {
        print("data error status search_campus error");
        print("error status master" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch kampus $e");
      return null;
    }
  }
}
