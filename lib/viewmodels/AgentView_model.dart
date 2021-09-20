part of 'viewmodel.dart';

class Agentview_model {

  Future getRekening(keycode) async {
    print("key_sebenarnya: "+keycode);
    try {
      final response =
          await http.post(ConstanUrl().baseUrl + "get_rekening", body: {
        'format': 'json',
        'keycode': keycode,
        'setdata_mod': 'get-data-agen',
      });

      final jsondata = jsonDecode(response.body);
      CheckRekeningAgentModel listData =
          CheckRekeningAgentModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data_detail_rekening");
        print(response.body.toString());
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
    } catch (e) {
      print("error_detail_rekening $e");
      return null;
    }
  }

  Future editRekening(norekening, kodebank, namarekening, imgbuku, keycode, cid, ccid, context) async {

    print("editrek:: "
        "norekening $norekening, kodebank $kodebank, namarekening $namarekening, cid $cid, ccid $ccid");

    //formdata_logo
    var stream = imgbuku != null
        ? new http.ByteStream(DelegatingStream.typed(imgbuku.openRead()))
        : "";
    //read size image
    var length = imgbuku != null ? await imgbuku.length() : "";
    //multipart
    var multipart = imgbuku != null
        ? http.MultipartFile('formdata_imgbuku', stream, length,
        filename: imgbuku.path)
        : File;

    //post
    var request = http.MultipartRequest(
      //'POST', Uri.parse(ConstanUrl().baseUrl + "edun-meagen-g"));
        'POST', Uri.parse("https://api.edunitas.com/mod/edun-meagen-g"));

    request.files.add(multipart);
    request.fields["formdata_norekening"] = norekening.toString();
    request.fields["formdata_kodebank"] = kodebank.toString();
    request.fields["formdata_namarekening"] = namarekening.toString();
    request.fields["formdata_apikey"] = keycode;
    request.fields["setdata_mod"] = 'put-data-agen';
    request.fields["formdata_cid"] = cid.toString();
    request.fields["formdata_ccid"] = ccid.toString();

    final response = await request.send();

    //var responseData = await response.stream.toBytes();
    //var responseString = String.fromCharCodes(responseData);

    // request.send().then((onValue) {
    //   print("result_edit_rekening_agent" + onValue.statusCode.toString());
    //
    //   print(onValue.headers);
    //   print(onValue.contentLength);
    // });

    if (response.statusCode == 200) {
      print("Edit Rekening: Image Uploaded");
      print("Edit Rekening: "+response.toString());
      return response.statusCode;
    } else {
      print("Edit Rekening: Upload Failed");
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
      return null;
    }
  }

  Future newRekening(norekening, kodebank, namarekening, imgbuku, keycode, context) async {

    print("editrek:: "
        "norekening $norekening, kodebank $kodebank, namarekening $namarekening");

    //formdata_logo
    var stream = imgbuku != null
        ? new http.ByteStream(DelegatingStream.typed(imgbuku.openRead()))
        : "";
    //read size image
    var length = imgbuku != null ? await imgbuku.length() : "";
    //multipart
    var multipart = imgbuku != null
        ? http.MultipartFile('formdata_imgbuku', stream, length,
        filename: imgbuku.path)
        : File;

    //post
    var request = http.MultipartRequest(
      //'POST', Uri.parse(ConstanUrl().baseUrl + "edun-meagen-g"));
        'POST', Uri.parse("https://api.edunitas.com/mod/edun-meagen-g"));

    request.files.add(multipart);
    request.fields["formdata_norekening"] = norekening.toString();
    request.fields["formdata_kodebank"] = kodebank.toString();
    request.fields["formdata_namarekening"] = namarekening.toString();
    request.fields["formdata_apikey"] = keycode;
    request.fields["setdata_mod"] = 'post-data-agen';
    //request.fields["formdata_cid"] = cid.toString();
    //request.fields["formdata_ccid"] = ccid.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      print("New Rekening: Image Uploaded");
      print("New Rekening: "+response.toString());
      return response.statusCode;
    } else {
      print("New Rekening: Upload Failed");
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
      return null;
    }
  }

  Future daftarkan_mhs(
      nama, email, no_tlp, no_wa, cid, imgselfie, api_key, context) async {
    //formdata_logo
    var stream = imgselfie != null
        ? new http.ByteStream(DelegatingStream.typed(imgselfie.openRead()))
        : "";
    //read size image
    var length = imgselfie != null ? await imgselfie.length() : "";
    //multipart
    var multipart = imgselfie != null
        ? http.MultipartFile('formdata_imgselfie', stream, length,
            filename: imgselfie.path)
        : File;
    //post
    var request = http.MultipartRequest(
        //'POST', Uri.parse(ConstanUrl().baseUrl + "edun-meagen-g"));
        'POST', Uri.parse("https://api.edunitas.com/mod/edun-meagen-g"));

    print("Why_oh_why: \n"
        "request.files.add($multipart);\n"
        "request.fields[formdata_nama] = $nama;\n"
        "request.fields[formdata_email] = $email;\n"
        "request.fields[formdata_notlp] = $no_tlp;\n"
        "request.fields[formdata_nowa] = $no_wa;\n"
        "request.fields[formdata_cid] = $cid;\n"
        "request.fields[formdata_apikey] = $api_key;\n");

    request.files.add(multipart);
    request.fields["formdata_nama"] = nama;
    request.fields["formdata_email"] = email;
    request.fields["formdata_notlp"] = no_tlp.toString();
    request.fields["formdata_nowa"] = no_wa.toString();
    request.fields["formdata_cid"] = cid;
    request.fields["formdata_origin"] = 'eduCampus';
    request.fields["formdata_apikey"] = api_key;
    request.fields["setdata_mod"] = "post-data-rekomen";

    final response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    request.send().then((onValue) {
      print("result_daftar_mhs_agent" + onValue.statusCode.toString());

      print(onValue.headers);
      print(onValue.contentLength);
    });

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(responseString);
      AddMhsAgensiModel listData =
      AddMhsAgensiModel.fromJson(jsondata);

      if (response.statusCode == 200) {
        print("data mhs dikirim");
        return listData;
      }
      print("Daftar mhs f agent: Image Uploaded");
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
      print("Daftar mhs f agent: Upload Failed");
      return null;
    }
    return response.statusCode;
  }

  Future<List> get_mhs_rekomend_agent(keycode) async {
    try {
      final response =
      await http.post(ConstanUrl().baseUrl + "get_agent", body: {
        'keycode': keycode,
      });

      List<DaftarMhsRekomenModel> listData =
      DaftarMhsRekomenModel.parseList(json.decode(response.body));

      if (response.statusCode == 200) {

        return listData;
      }
    } catch (e) {
      print("error_detail_mhs_agent $e");
      return null;
    }
  }


   Future check_agent(String keycode) async {
    //http.post(NetworkConfig().baseUrl + "loginUser"

      try {
      final response =
          await http.post(ConstanUrl().baseUrl + "check_agent", body: {
        'keycode': keycode.toString(),
        //'keycode': "df218b75dd2a4a00b88ca95acc32e91eaac77f58",
      });
       

       print("nama_agent_json${response.body}");
      final jsondata = jsonDecode(response.body);
      StatusModel listData = StatusModel.fromJson(jsondata);
         
      if (response.statusCode == 200) {
        print("data check_agent");
        //return DetailCampusModel.fromJson(jsonDecode(response.body));
        return listData;
      }
    } catch (e) {
      print("error check_agent $e");
      return null;
    }


    
  }
}
