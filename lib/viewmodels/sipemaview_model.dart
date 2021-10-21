part of 'viewmodel.dart';

class sipemaview_model {
  Future getBiayaSipema(String kodekampus) async {
    final response =
    await http.post(Uri.parse(ConstanUrl().baseUrl + "biayasipema"), body: {
      'kode_kampus': kodekampus.toString(),
    });

    if (response.statusCode == 200) {
      print("data sipema success");
      return SipemaModel.fromJson(jsonDecode(response.body)).sipema;
    }
  }


  Future getBiayaSipema_web(String kodekampus,String kodeacid) async {
    final response =
    await http.post(Uri.parse(ConstanUrl().baseUrl + "biayasipema_baru"), body: {
      'kode_kampus': kodekampus.toString(),
      'kode_acid':kodeacid.toString(),
    });

    if (response.statusCode == 200) {
      print("data sipema success");
      return SipemaWebModel.fromJson(jsonDecode(response.body)).sipema;
    }
  }

  Future<List<AngsuranSpbModel>> getBiayaSipemaAngsuran(
      String kodekampus, String kodejrs, String kodeprg,String kelompok) async {
    try {
      final response =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "biayasipemaangsuran"), body: {
        'kode_kampus': kodekampus.toString(),
        'kodejrs': kodejrs.toString(),
        'kodeprg': kodeprg.toString(),
        'kelompok': kelompok.toString(),
      });

      if (response.statusCode == 200) {
        print("data biayasipemaangsuran success");
        final data = angsuranSpbModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("error status biayasipemaangsuran $e");
      return null;
    }
  }

  Future<List<AngsuranSpbModel>> getBiayaSipemaAngsuranSpp(
      String kodekampus, String kodejrs, String kodeprg,String kelompok) async {
    try {
      final response = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "masterbiayasipemaangsuranSpp"), body: {
        'kode_kampus': kodekampus.toString(),
        'kodejrs': kodejrs.toString(),
        'kodeprg': kodeprg.toString(),
         'kelompok': kelompok.toString(),
        
      });

      if (response.statusCode == 200) {
        print("data masterbiayasipemaangsuranSpp success");
        final data = angsuranSpbModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("error status masterbiayasipemaangsuranSpp $e");
      return null;
    }
  }

  Future<List<AngsuranSpbAngsuranModel>> getBiayaSipemaAngsuranSpb(
      String kodekampus, String kodejrs, String kodeprg, String waktu, String kelompok) async {
    try {
      final response = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "biayasipemaangsuranSpb"), body: {
        'kode_kampus': kodekampus.toString(),
        'kodejrs': kodejrs.toString(),
        'kodeprg': kodeprg.toString(),
        'waktu': waktu.toString(),
        'kelompok': kelompok.toString(),
      });

      if (response.statusCode == 200) {
        print("wkwkwkwkk"+response.body);
        print("wkwkwkwkk_kodekampus"+kodekampus);
        print("wkwkwkwkk_kodejrs"+kodejrs);
        print("wkwkwkwkk_kodeprg"+kodeprg);
         print("wkwkwkwkk_kelompok"+kelompok);
        print("data biayasipemaangsuranSpb success");
        final data = angsuranSpbAngsuranModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("error status biayasipemaangsuranSpb $e");
      return null;
    }
  }

  Future<List<AngsuranSpbAngsuranModel>> angsurangetBiayaSipemaSpp(
      String kodekampus, String kodejrs, String kodeprg, String waktu,String kelompok) async {
    try {
      final response = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "biayasipemaangsuranSpp"), body: {
        'kode_kampus': kodekampus.toString(),
        'kodejrs': kodejrs.toString(),
        'kodeprg': kodeprg.toString(),
        'waktu': waktu.toString(),
         'kelompok': kelompok.toString(),
      });

      if (response.statusCode == 200) {
        print("data biayasipemaangsuranSpp success");
        final data = angsuranSpbAngsuranModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("error status biayasipemaangsuranSpp $e");
      return null;
    }
  }

   Future<List<AngsuranSpbAngsuranModel>> daftarangsuranspp(
      String kodekampus, String kodejrs, String kodeprg) async {
    try {
      final response = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "angsuranspp"), body: {
        'kode_kampus': kodekampus.toString(),
        'kodejrs': kodejrs.toString(),
        'kodeprg': kodeprg.toString(),
       // 'waktu': waktu.toString(),
      });

      if (response.statusCode == 200) {
        print("data daftarangsuranspp success");
        final data = angsuranSpbAngsuranModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("error status daftarangsuranspp $e");
      return null;
    }
  }

    Future<List<AngsuranSpbAngsuranModel>> daftarangsuranspb(
      String kodekampus, String kodejrs, String kodeprg,String kelompok) async {
    try {
      final response = await http
          .post(Uri.parse(ConstanUrl().baseUrl + "angsuranspb"), body: {
        'kode_kampus': kodekampus.toString(),
        'kodejrs': kodejrs.toString(),
        'kodeprg': kodeprg.toString(),
        'kelompok':kelompok.toString(),
       // 'waktu': waktu.toString(),
      });

      if (response.statusCode == 200) {
        print("data daftarangsuranspb success");
        final data = angsuranSpbAngsuranModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("error status daftarangsuranspb $e");
      return null;
    }
  }

 Future<List<CheckProdiSearchModel>> check_prodi_search(
      String kodekampus, String kodejrs) async {
    try {
      final response =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "check_prodi_search"), body: {
        'kode_kampus': kodekampus.toString(),
        'kode_jurusan': kodejrs.toString(),
       
      });

      print("prodi${response.body}");
      if (response.statusCode == 200) {
        print("data check_prodi_search success");
        final data = checkProdiSearchModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("error status check_prodi_search $e");
      return null;
    }
  }
}
