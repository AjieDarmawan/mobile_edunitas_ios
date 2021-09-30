part of 'viewmodel.dart';

class HomeViewModel {

  Future<List> getTerpopuler() async {
    http.Response hasil = await http.get(
      Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "list_campus_logo")),
      // headers: {"Accept": "application/json"}
    );
    if (hasil.statusCode == 200) {
      //print("data kampus pop success: "+hasil.toString());
      // final data = lowonganModelFromJson(hasil.body);
      // final data = listLogoGambarModelFromJson(hasil.body);

      // return data.populer;

      List<Photo> data = Photo.parseList(json.decode(hasil.body));
      return data;
    } else {
      print("error status " + hasil.statusCode.toString());
      return null;
    }
  }

  Future<void> getSipema() async {
    try {
      http.Response hasil = await http.get(
        Uri.parse(Uri.encodeFull(ConstanUrl().baseUrl + "biayasipema")),
        // headers: {"Accept": "application/json"}
      );
      if (hasil.statusCode == 200) {
        print("data getSipema success");
        // final data = lowonganModelFromJson(hasil.body);
        // final data = sipemaModelFromJson(hasil.body);
        // return data;

        final fetchedPhotos = sipemaModelFromJson(json.decode(hasil.body));
        return fetchedPhotos;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  // pendaftaran online
  Future pendaftaran_online(
      String nama,
      String email,
      String notlp,
      String nowa,
      String lulusan,
      String wilayah,
      String prodi,
      String kelas,
      String kampus) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "form_insert"), body: {
      'nama': nama,
      'email': email,
      'notlp': notlp,
      'nowa': nowa,
      'lulusan': lulusan,
      'wilayah': wilayah,
      'prodi': prodi,
      'kelas': kelas,
      'kampus': kampus,
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

  //patner kampus
  Future patner_kampus(
    String etnamalengkap,
    String etemailpenanggungjawab,
    String etnohp,
    String etnowa,
    String etnamakampus,
    String etemailresmikampus,
    String etjabatanpenanggungjawab,
    String ettlpnkampus,
    String wilayah,
  ) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"
    final response =
        await http.post(Uri.parse(ConstanUrl().baseUrl + "form_insert_patner"), body: {
      'nama': etnamalengkap,
      'emailpenanggungjawab': etemailpenanggungjawab,
      'nohp': etnohp,
      'nowa': etnowa,
      'namakampus': etnamakampus,
      'emailresmikampus': etemailresmikampus,
      'jabatanpenanggungjawab': etjabatanpenanggungjawab,
      'tlpnkampus': ettlpnkampus,
      'wilayah': wilayah,
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

  // Future patner_kampus_me(
  //     String nama,
  //     String email,
  //     String notlp,
  //     String nowa,
  //     String jabatan,
  //     String partnernama,
  //     String partneremail,
  //     String partnernotlp
  // ) async {
  //   //http.post(NetworkConfig().baseUrl + "loginUser"
  //   final response =
  //       await http.post(ConstanUrl().baseUrl + "form_insert_patner_me", body: {
  //     'nama': nama,
  //     'email': email,
  //     'notlp': notlp,
  //     'nowa': nowa,
  //     'jabatan': jabatan,
  //     'partnernama': partnernama,
  //     'partneremail': partneremail,
  //     'partnernotlp': partnernotlp,
  //   });

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
  Future patner_kampus_me(
      String formdata_nama,
      String formdata_thnberdiri,
      String formdata_akreditasi,
      String formdata_banpt,
      String formdata_website, //5
      String formdata_rektor,
      String formdata_email,
      String formdata_telepon,
      String formdata_propinsi,
      String formdata_kota, //10
      String formdata_kecamatan,
      String formdata_kelurahan,
      String formdata_alamat,
      String formdata_kodepos,
      String formdata_namap, //15
      String formdata_emailp,
      String formdata_teleponp,
      String formdata_jabatanp,
      File formdata_imglogo,
      File formdata_imgcover, //20
      File formdata_imgoth1,
      File formdata_imgoth2,
      File formdata_filebiaya,
      String formdata_apikey,
      String formdata_prodi, //25
      String formdata_prodilain,
      String formdata_pmb, // 27
      String formdata_kelas,
      context) async {
   
    var stream = formdata_imglogo != null ? new http.ByteStream(
        DelegatingStream.typed(formdata_imglogo.openRead())) : "";
    //read size image
    var length = await formdata_imglogo.length();
    //multipart
    var multipart = http.MultipartFile('formdata_imglogo', stream, length,
        filename: formdata_imglogo.path);
   

    var streamcover = formdata_imgcover != null ? new http.ByteStream(
        DelegatingStream.typed(formdata_imgcover.openRead())) : "";
    //read size image
    var lengthcover =  formdata_imgcover != null ? await formdata_imgcover.length() : "";
    //multipart
    var multipartcover =  formdata_imgcover != null ? http.MultipartFile(
        'formdata_imgcover', streamcover, lengthcover,
        filename: formdata_imgcover.path) : "";

        

    //imgoth1
    var streamimgoth1 = formdata_imgoth1 != null ? new http.ByteStream(
        DelegatingStream.typed(formdata_imgoth1.openRead())) : "";
    //read size image
    var lengthimgoth1 = formdata_imgoth1 != null ? await formdata_imgoth1.length() : "";
    //multipart
    var multipartimgoth1 =  formdata_imgoth1 != null ? http.MultipartFile(
        'formdata_imgoth1', streamimgoth1, lengthimgoth1,
        filename: formdata_imgoth1.path) : File;

    // imgoth2
    var streamimgoth2 =  formdata_imgoth2 != null ?  new http.ByteStream(
        DelegatingStream.typed(formdata_imgoth2.openRead())) : "";
    //read size image
    var lengthimgoth2 =  formdata_imgoth2 != null ?  await formdata_imgoth2.length() : "";
    //multipart
    var multipartimgoth2 =  formdata_imgoth2 != null ?  http.MultipartFile(
        'formdata_imgoth2', streamimgoth2, lengthimgoth2,
        filename: formdata_imgoth2.path) : "";

    //file biaya
    var streamfilebiaya =  formdata_filebiaya != null ?   new http.ByteStream(
        DelegatingStream.typed(formdata_filebiaya.openRead())) : "";
    //read size image
    var lengthfilebiaya =  formdata_filebiaya != null ? await formdata_filebiaya.length() : "";
    //multipart
    var multipartfilebiaya = formdata_filebiaya != null ? http.MultipartFile(
        'formdata_filebiaya', streamfilebiaya, lengthfilebiaya,
        filename: formdata_filebiaya.path) : "";

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://api.edunitas.com/mod/edun-kampus-g"));

    if (formdata_imglogo != null || formdata_imglogo != "null") {
      request.files.add(multipart);
    }
     
     formdata_imgcover == null ? '' :  request.files.add(multipartcover);
      print("formdata_imgcover${formdata_imgcover == null ? 'tes' : 'cek'}"); 

   
  
     formdata_imgoth1 == null ? '' :  request.files.add(multipartimgoth1);

      formdata_imgoth2 == null ? '' :  request.files.add(multipartimgoth2);

      formdata_filebiaya == null ? '' :  request.files.add(multipartfilebiaya); 
    

   


    request.fields['formdata_nama'] = formdata_nama;
    request.fields['formdata_thnberdiri'] = formdata_thnberdiri;
    request.fields['formdata_akreditasi'] = formdata_akreditasi;

    request.fields['formdata_banpt'] = formdata_banpt;
    request.fields['formdata_website'] = formdata_website; // 10
    request.fields['formdata_rektor'] = formdata_rektor;
    request.fields['formdata_email'] = formdata_email;
    request.fields['formdata_telepon'] = formdata_telepon;
    request.fields['formdata_propinsi'] = formdata_propinsi;
    request.fields['formdata_kota'] = formdata_kota; //15
    request.fields['formdata_kecamatan'] = formdata_kecamatan;
    request.fields['formdata_kelurahan'] = formdata_kelurahan;
    request.fields['formdata_alamat'] = formdata_alamat;
    request.fields['formdata_kodepos'] = formdata_kodepos;
    request.fields['formdata_namap'] = formdata_namap; //20

    request.fields['formdata_emailp'] = formdata_emailp;
    request.fields['formdata_teleponp'] = formdata_teleponp;
    request.fields['formdata_jabatanp'] = formdata_jabatanp;

    request.fields['formdata_apikey'] = formdata_apikey;
    request.fields['formdata_prodi'] = formdata_prodi; // 25
    request.fields['formdata_prodilain'] = formdata_prodilain;
    request.fields['formdata_pmb'] = formdata_pmb; // 27
    request.fields['formdata_kelas'] = formdata_kelas; // 28

    // udh ya

    request.fields['formdata_origin'] = "me";
    request.fields['formdata_postlist'] = "campus";
    request.fields['setdata_mod'] = "post-data";
     

   
    final response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");

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
}
