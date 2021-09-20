import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_edunitas/constant/constant.dart';
import 'package:flutter_app_edunitas/model/Master/SmbModel.dart';
import 'package:flutter_app_edunitas/model/Master/StatusModel.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_bukti_bayar.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_detail.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_donatur.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_kabar.dart';

import 'package:flutter_app_edunitas/model/donasi/donasi_kirim_model.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_mepartner_detail.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_mepatner.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_mydesk.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_list.dart';
import 'package:flutter_app_edunitas/model/donasi/list_donasi.dart';
import 'package:flutter_app_edunitas/model/educampus/listedu.dart';
import 'package:flutter_app_edunitas/model/me/foto_edit_campaign.dart';
import 'package:flutter_app_edunitas/pages/Home/widget_home/donasi/widget_donasi.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

class Donasiview_model {
  Future listDonasi(String kategori, String kendala) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "listdonation", body: {
        'kategori': kategori,
        'kendala': kendala,
      });

      if (hasil.statusCode == 200) {
        final data = listDonasiModelFromJson(hasil.body);
        return data;
      } else {
        print("error_donasi: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donasi $e");
      return null;
    }
  }

  Future<DonasiDetailModel> getDetail(seolink) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "detailDonasi", body: {
        'seolink': seolink,
      });

      if (hasil.statusCode == 200) {
        final data = detailDonasiDetailModelFromJson(hasil.body);
        return data;
      } else {
        print("error_donasi: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donasi $e");
      return null;
    }
  }

  Future<FotoEditCampaignModel> getFotoCampaign(keycode) async {
    try {
      final hasil =
      await http.post("https://dev-api.edunitas.com/edit_campaign", body: {
        'keycode': keycode,
      });

      if (hasil.statusCode == 200) {
        final data = detailFotoEditCampaignModelFromJson(hasil.body.replaceAll("<pre>", ""));
        return data;
      } else {
        print("error_edit_camp: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_edit_camp $e");
      return null;
    }
  }

  Future<List<DonaturListModel>> getDonaturList(String cid) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "loaddonatur", body: {
        'cid': cid,
      });

      if (hasil.statusCode == 200) {
        print("hasil "+hasil.body);
         print("hasil "+cid);
        final data = detailDonaturListModelFromJson(hasil.body);
        return data;
      } else {
        print("error_donasi: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donatur $e");
      return null;
    }
  }

  Future<List<DonasiMydesk>> getDonasiMydesk(String keycode) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "me_mydesk", body: {
        'keycode': keycode,
      });

      if (hasil.statusCode == 200) {
        final data = donasiMydeskFromJson(hasil.body);
        return data;
      } else {
        print("error_donasi: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donatur $e");
      return null;
    }
  }

  Future<List<DonasiKabarModel>> getKabarList(String cid) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "loadkabar", body: {
        'cid': cid,
      });

      if (hasil.statusCode == 200) {
        final data = detailDonasiKabarModelFromJson(hasil.body);
        return data;
      } else {
        print("error_donasi: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donatur $e");
      return null;
    }
  }

  Future<List<DonasiMePatner>> me_patner(String keycode) async {
    try {
      final hasil = await http.post(ConstanUrl().baseUrl + "me_patner", body: {
        'keycode': keycode,


      });

      if (hasil.statusCode == 200) {
        final data = donasiMePatnerFromJson(hasil.body);
        return data;
      } else {
        print("error_donasi: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donatur $e");
      return null;
    }
  }

  Future<DonasiMePatnerDetail> me_patner_detail(String cid) async {
    try {
      final hasil = await http
          .post("https://api.edunitas.com/mod/edun-donation-g", body: {
        'format': 'json',
        'formdata_cid': cid,
        'formdata_getlist': 'listdonatur',
        'formdata_origin': 'list',
        'setdata_mod': 'get-data',
        'formdata_m': '1'
      });

      if (hasil.statusCode == 200) {
        final data = DonasiMePatnerDetailFromJson(hasil.body);
        return data;
      } else {
        print("error_partner_donasi_me: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_partner_donasi_me $e");
      return null;
    }
  }

  Future<DonasiMePatnerDetail> me_patner_campaign_edit(String cid, seolink) async {
    try {
      final hasil = await http
          .post("https://api.edunitas.com/mod/edun-donation-g", body: {
        'format': 'json',
        'formdata_apikey': cid,
        'formdata_getlist': 'listdonatur',
        'formdata_origin': 'list',
        'formdata_seolink': seolink,
        'setdata_mod': 'get-data'
      });

      if (hasil.statusCode == 200) {
        final data = DonasiMePatnerDetailFromJson(hasil.body);
        return data;
      } else {
        print("error_partner_donasi_me: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_partner_donasi_me $e");
      return null;
    }
  }

  Future<List<SmbModel>> search_semua_kategori() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull(ConstanUrl().baseUrl + "search_semua_kategori"),
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

  Future<List<SmbModel>> search_semua_kendala() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull(ConstanUrl().baseUrl + "search_semua_kendala"),
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

  // Future<String> sendDonasi(
  Future<DonasiKirimModel> sendDonasi(
      String formdata_dntrdonaturname,
      formdata_dntrisanonim,
      formdata_dntremail,
      formdata_dntrnotlp,
      formdata_dntrnowa,
      formdata_dntrprice,
      formdata_dntrtextmessage,
      formdata_dntrmethod,
      formdata_dntrchannel,
      formdata_apikey,
      setdata_mod,
      formdata_origin,
      formdata_cid,
      formdata_postlist) async {
    try {
      final hasil =
          await http.post(ConstanUrl().baseUrl + "people_donasi", body: {
        'formdata_dntrdonaturname': formdata_dntrdonaturname,
        'formdata_dntrisanonim': formdata_dntrisanonim,
        'formdata_dntremail': formdata_dntremail,
        'formdata_dntrnotlp': formdata_dntrnotlp,
        'formdata_dntrnowa': formdata_dntrnowa,
        'formdata_dntrprice': formdata_dntrprice,
        'formdata_dntrtextmessage': formdata_dntrtextmessage,
        'formdata_dntrmethod': formdata_dntrmethod,
        'formdata_dntrchannel': formdata_dntrchannel,
        'formdata_apikey': formdata_apikey,
        'setdata_mod': setdata_mod,
        'formdata_origin': formdata_origin,
        'formdata_cid': formdata_cid,
        'formdata_postlist': formdata_postlist,
      });

      if (hasil.statusCode == 200) {
        print("hasil_donasi_donasi_send: " + hasil.body.toString());
        final data = donasiKirimModelFromJson(hasil.body);
        return data;
      } else {
        print("error_donasi_donasi_send: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donasi_send $e");
      return null;
    }
  }

  // Future<String> sendDonasi(
  Future sendBuktiBayar(
      String formdata_metode,
      formdata_bank,
      formdata_norekening,
      formdata_date,
      datep,
      formdata_time,
      setdata_mod,
      formdata_putlist,
      formdata_origin,
      formdata_apikey,
      formdata_mod,
      formdata_cid,
      File formdata_imginv) async {
    try {
      //imgoth1
      // var stream = formdata_imginv != null ? new http.ByteStream(
      //     DelegatingStream.typed(formdata_imginv.openRead())) : "";

      var stream = new http.ByteStream(
          DelegatingStream.typed(formdata_imginv.openRead()));
      //read size image
      var length = await formdata_imginv.length();
      //multipart
      var multipart = http.MultipartFile('formdata_imginv', stream, length,
          filename: formdata_imginv.path);

      var request = http.MultipartRequest(
          'POST', Uri.parse("https://api.edunitas.com/mod/edun-donation-g"));

      request.fields['formdata_metode'] = formdata_metode;
      request.fields['formdata_bank'] = formdata_bank;
      request.fields['formdata_norekening'] = formdata_norekening;
      request.fields['formdata_date'] = formdata_date;
      request.fields['datep'] = datep;
      request.fields['formdata_time'] = formdata_time;
      request.fields['setdata_mod'] = setdata_mod;
      request.fields['formdata_putlist'] = formdata_putlist;
      request.fields['formdata_origin'] = formdata_origin;
      request.fields['formdata_apikey'] = formdata_apikey;
      request.fields['formdata_mod'] = formdata_mod;
      request.fields['formdata_cid'] = formdata_cid;

      request.files.add(multipart);

      final response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      request.send().then((onValue) {
        print("supeeeeeeerrrr" + onValue.statusCode.toString());

        print(onValue.headers);
        print(onValue.contentLength);
      });

      if (response.statusCode == 200) {
        print("hasil_donasi_donasi_send: " + response.toString());
        //final data = buktiBayarDonasiModelFromJson(response);
        return 200;
      } else {
        print("error_donasi_donasi_send: " + request.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donasi_send $e");
      return null;
    }
  }

  Future postGalangDana(
    String formdata_donnama,
    String formdata_donmedsos,
    String formdata_dondesk,
    File formdata_donimgktp,
    String formdata_donkategori,
    String formdata_donpermasalahan,
    String formdata_doninstansi,
    String formdata_donatasnama,
    String formdata_donchampaigner,
    File formdata_donimgnpwp,
    String formdata_donpenerima,
    String formdata_donhubpenerima,
    String formdata_donnamapenerima,
    String formdata_donidpenerima,
    String formdata_donjudul,
    String formdata_donseolink,
    String formdata_doncerita,
    String formdata_dontarget,
    String formdata_donhingga,
    String formdata_donrincian,
    String formdata_donpencairan,
    String formdata_donpenyaluran,
    String formdata_donbank,
    String formdata_donnorek,
    String formdata_donnamarek,
    String formdata_donajakan,
    File formdata_donimgchampaign,
    String formdata_apikey,
    String setdata_mod,
    String formdata_origin,
    String formdata_seolink,
    String formdata_cid,
    String formdata_postlist,
  ) async {
    try {

      var stream_ktp;
      var length_ktp;
      var multipart_ktp;

      if(formdata_donimgktp!=null){
        stream_ktp = new http.ByteStream(
            DelegatingStream.typed(formdata_donimgktp.openRead()));
        length_ktp = await formdata_donimgktp.length();
        multipart_ktp = http.MultipartFile(
            'formdata_donimgktp', stream_ktp, length_ktp,
            filename: formdata_donimgktp.path);
      }

      var stream_campaign;
      var length_champ;
      var multipart_champ;

      if(formdata_donimgchampaign!=null){
        stream_campaign = new http.ByteStream(
            DelegatingStream.typed(formdata_donimgchampaign.openRead()));
        length_champ = await formdata_donimgchampaign.length();
         multipart_champ = http.MultipartFile(
            'formdata_donimgchampaign', stream_campaign, length_champ,
            filename: formdata_donimgchampaign.path);
      }

      var request = http.MultipartRequest(
          'POST', Uri.parse("https://api.edunitas.com/mod/edun-donation-g"));

      request.fields['formdata_donnama'] = formdata_donnama;
      request.fields['formdata_donmedsos'] = formdata_donmedsos;
      request.fields['formdata_dondesk'] = formdata_dondesk;
      request.fields['formdata_donkategori'] = formdata_donkategori;
      request.fields['formdata_donpermasalahan'] = formdata_donpermasalahan;
      request.fields['formdata_doninstansi'] = formdata_doninstansi;
      request.fields['formdata_donatasnama'] = formdata_donatasnama;
      request.fields['formdata_donchampaigner'] = formdata_donchampaigner;
      request.fields['formdata_donpenerima'] = formdata_donpenerima;
      request.fields['formdata_donhubpenerima'] = formdata_donhubpenerima;
      request.fields['formdata_donnamapenerima'] = formdata_donnamapenerima;
      request.fields['formdata_donidpenerima'] = formdata_donidpenerima;
      request.fields['formdata_donjudul'] = formdata_donjudul;
      request.fields['formdata_donseolink'] = formdata_donseolink;
      request.fields['formdata_doncerita'] = formdata_doncerita;
      request.fields['formdata_dontarget'] = formdata_dontarget;
      request.fields['formdata_donhingga'] = formdata_donhingga;
      request.fields['formdata_donrincian'] = formdata_donrincian;
      request.fields['formdata_donpencairan'] = formdata_donpencairan;
      request.fields['formdata_donpenyaluran'] = formdata_donpenyaluran;
      request.fields['formdata_donbank'] = formdata_donbank;
      request.fields['formdata_donnorek'] = formdata_donnorek;
      request.fields['formdata_donnamarek'] = formdata_donnamarek;
      request.fields['formdata_donajakan'] = formdata_donajakan;
      request.fields['formdata_apikey'] = formdata_apikey;
      request.fields['setdata_mod'] = setdata_mod;
      request.fields['formdata_origin'] = formdata_origin;
      request.fields['formdata_seolink'] = formdata_seolink;
      request.fields['formdata_cid'] = formdata_cid;
      request.fields['formdata_postlist'] = formdata_postlist;

      print('formdata_donnama:$formdata_donnama');
      print('formdata_donmedsos:$formdata_donmedsos');
      print('formdata_dondesk:$formdata_dondesk');
      print('formdata_donkategori:$formdata_donkategori');
      print('formdata_donpermasalahan:$formdata_donpermasalahan');
      print('formdata_doninstansi:$formdata_doninstansi');
      print('formdata_donatasnama:$formdata_donatasnama');
      print('formdata_donchampaigner:$formdata_donchampaigner');
      print('formdata_donpenerima:$formdata_donpenerima');
      print('formdata_donhubpenerima:$formdata_donhubpenerima');
      print('formdata_donnamapenerima:$formdata_donnamapenerima');
      print('formdata_donidpenerima:$formdata_donidpenerima');
      print('formdata_donjudul:$formdata_donjudul');
      print('formdata_donseolink:$formdata_donseolink');
      print('formdata_doncerita:$formdata_doncerita');
      print('formdata_dontarget:$formdata_dontarget');
      print('formdata_donhingga:$formdata_donhingga');
      print('formdata_donrincian:$formdata_donrincian');
      print('formdata_donpencairan:$formdata_donpencairan');
      print('formdata_donpenyaluran:$formdata_donpenyaluran');
      print('formdata_donbank:$formdata_donbank');
      print('formdata_donnorek:$formdata_donnorek');
      print('formdata_donnamarek:$formdata_donnamarek');
      print('formdata_donajakan:$formdata_donajakan');
      print('formdata_apikey:$formdata_apikey');
      print('setdata_mod:$setdata_mod');
      print('formdata_origin:$formdata_origin');
      print('formdata_seolink:$formdata_seolink');
      print('formdata_cid:$formdata_cid');
      print('formdata_postlist:$formdata_postlist');

    // formdata_donnama:dym test#8 jovb
    // formdata_donmedsos:@dimns
    // formdata_dondesk:dym test#8 jovb
    // formdata_donkategori:Kuliah
    // formdata_donpermasalahan:Daftar Sekolah/kuliah
    // formdata_doninstansi:dym test#8 jovb
    // formdata_donatasnama:personal
    // formdata_donchampaigner:dym test#8 jovb
    // formdata_donpenerima:Diri Sendiri
    // formdata_donhubpenerima:Diri Sendiri
    // formdata_donnamapenerima:dym test#8 jovb
    // formdata_donidpenerima:8844556699
    // formdata_donjudul:dym test#8 jovb
    // formdata_donseolink:dym-test#8-jovb
    // formdata_doncerita:dym test#8 jovb
    // formdata_dontarget:1000000
    // formdata_donhingga:2021-9-17
    // formdata_donrincian:dym test#8 jovb
    // formdata_donpencairan:1
    // formdata_donpenyaluran:1
    // formdata_donbank:002
    // formdata_donnorek:1019101901910
    // formdata_donnamarek:dym test#8 jovb
    // formdata_donajakan:dym test#8 jovb
    // formdata_apikey:421fb8edf19461b0eb375da1c4f58332717d0f95
    // setdata_mod:post-data
    // formdata_origin:me
    // formdata_seolink:dym-test#8-jovb
    // formdata_cid:
    // formdata_putlist:donation

      if(formdata_donimgktp==null){request.files.add(multipart_ktp);}
      //request.files.add(multipart_npwp);
      if(formdata_donimgchampaign==null){request.files.add(multipart_champ);}

      final response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("suapperrrr: "+ responseString);

      request.send().then((onValue) {
        print(onValue.headers);
        print(onValue.contentLength);
      });

      if (response.statusCode == 200) {
        print("hasil_donasi_post_send: " + response.toString());
        //final data = buktiBayarDonasiModelFromJson(response);
        return 200;
      } else {
        print("error_donasi_post_send: " + request.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donasi_post_send $e");
      return null;
    }
  }

  Future editGalangDana(
      String formdata_donnama,
      String formdata_donmedsos,
      String formdata_dondesk,
      File formdata_donimgktp,
      String formdata_donkategori,
      String formdata_donpermasalahan,
      String formdata_doninstansi,
      String formdata_donatasnama,
      String formdata_donchampaigner,
      File formdata_donimgnpwp,
      String formdata_donpenerima,
      String formdata_donhubpenerima,
      String formdata_donnamapenerima,
      String formdata_donidpenerima,
      String formdata_donjudul,
      String formdata_donseolink,
      String formdata_doncerita,
      String formdata_dontarget,
      String formdata_donhingga,
      String formdata_donrincian,
      String formdata_donpencairan,
      String formdata_donpenyaluran,
      String formdata_donbank,
      String formdata_donnorek,
      String formdata_donnamarek,
      String formdata_donajakan,
      File formdata_donimgchampaign,
      String formdata_apikey,
      String setdata_mod,
      String formdata_origin,
      String formdata_seolink,
      String formdata_cid,
      String formdata_putlist,
      ) async {
    try {
      //imgoth1
      // var stream = formdata_imginv != null ? new http.ByteStream(
      //     DelegatingStream.typed(formdata_imginv.openRead())) : "";

      var stream_ktp = new http.ByteStream(
          DelegatingStream.typed(formdata_donimgktp.openRead()));

      // var stream_npwp = new http.ByteStream(
      //     DelegatingStream.typed(formdata_donimgnpwp.openRead()));

      var stream_campaign = new http.ByteStream(
          DelegatingStream.typed(formdata_donimgchampaign.openRead()));

      //read size image
      var length_ktp = await formdata_donimgktp.length();
      //var length_npwp = await formdata_donimgnpwp.length();
      var length_champ = await formdata_donimgchampaign.length();

      //multipart
      var multipart_ktp = http.MultipartFile(
          'formdata_donimgktp', stream_ktp, length_ktp,
          filename: formdata_donimgktp.path);
      // var multipart_npwp = http.MultipartFile(
      //     'formdata_donimgnpwp', stream_npwp, length_npwp,
      //     filename: formdata_donimgnpwp.path);
      var multipart_champ = http.MultipartFile(
          'formdata_donimgchampaign', stream_campaign, length_champ,
          filename: formdata_donimgchampaign.path);

      var request = http.MultipartRequest(
          'POST', Uri.parse("https://api.edunitas.com/mod/edun-donation-g"));

      request.fields['formdata_donnama'] = formdata_donnama;
      request.fields['formdata_donmedsos'] = formdata_donmedsos;
      request.fields['formdata_dondesk'] = formdata_dondesk;
      request.fields['formdata_donkategori'] = formdata_donkategori;
      request.fields['formdata_donpermasalahan'] = formdata_donpermasalahan;
      request.fields['formdata_doninstansi'] = formdata_doninstansi;
      request.fields['formdata_donatasnama'] = formdata_donatasnama;
      request.fields['formdata_donchampaigner'] = formdata_donchampaigner;
      request.fields['formdata_donpenerima'] = formdata_donpenerima;
      request.fields['formdata_donhubpenerima'] = formdata_donhubpenerima;
      request.fields['formdata_donnamapenerima'] = formdata_donnamapenerima;
      request.fields['formdata_donidpenerima'] = formdata_donidpenerima;
      request.fields['formdata_donjudul'] = formdata_donjudul;
      request.fields['formdata_donseolink'] = formdata_donseolink;
      request.fields['formdata_doncerita'] = formdata_doncerita;
      request.fields['formdata_dontarget'] = formdata_dontarget;
      request.fields['formdata_donhingga'] = formdata_donhingga;
      request.fields['formdata_donrincian'] = formdata_donrincian;
      request.fields['formdata_donpencairan'] = formdata_donpencairan;
      request.fields['formdata_donpenyaluran'] = formdata_donpenyaluran;
      request.fields['formdata_donbank'] = formdata_donbank;
      request.fields['formdata_donnorek'] = formdata_donnorek;
      request.fields['formdata_donnamarek'] = formdata_donnamarek;
      request.fields['formdata_donajakan'] = formdata_donajakan;
      request.fields['formdata_apikey'] = formdata_apikey;
      request.fields['setdata_mod'] = setdata_mod;
      request.fields['formdata_origin'] = formdata_origin;
      request.fields['formdata_seolink'] = formdata_seolink;
      request.fields['formdata_cid'] = formdata_cid;
      request.fields['formdata_putlist'] = formdata_putlist;

      print('formdata_donnama:$formdata_donnama');
      print('formdata_donmedsos:$formdata_donmedsos');
      print('formdata_dondesk:$formdata_dondesk');
      print('formdata_donkategori:$formdata_donkategori');
      print('formdata_donpermasalahan:$formdata_donpermasalahan');
      print('formdata_doninstansi:$formdata_doninstansi');
      print('formdata_donatasnama:$formdata_donatasnama');
      print('formdata_donchampaigner:$formdata_donchampaigner');
      print('formdata_donpenerima:$formdata_donpenerima');
      print('formdata_donhubpenerima:$formdata_donhubpenerima');
      print('formdata_donnamapenerima:$formdata_donnamapenerima');
      print('formdata_donidpenerima:$formdata_donidpenerima');
      print('formdata_donjudul:$formdata_donjudul');
      print('formdata_donseolink:$formdata_donseolink');
      print('formdata_doncerita:$formdata_doncerita');
      print('formdata_dontarget:$formdata_dontarget');
      print('formdata_donhingga:$formdata_donhingga');
      print('formdata_donrincian:$formdata_donrincian');
      print('formdata_donpencairan:$formdata_donpencairan');
      print('formdata_donpenyaluran:$formdata_donpenyaluran');
      print('formdata_donbank:$formdata_donbank');
      print('formdata_donnorek:$formdata_donnorek');
      print('formdata_donnamarek:$formdata_donnamarek');
      print('formdata_donajakan:$formdata_donajakan');
      print('formdata_apikey:$formdata_apikey');
      print('setdata_mod:$setdata_mod');
      print('formdata_origin:$formdata_origin');
      print('formdata_seolink:$formdata_seolink');
      print('formdata_cid:$formdata_cid');
      print('formdata_putlist:$formdata_putlist');

      // formdata_donnama:dym test#8 jovb
      // formdata_donmedsos:@dimns
      // formdata_dondesk:dym test#8 jovb
      // formdata_donkategori:Kuliah
      // formdata_donpermasalahan:Daftar Sekolah/kuliah
      // formdata_doninstansi:dym test#8 jovb
      // formdata_donatasnama:personal
      // formdata_donchampaigner:dym test#8 jovb
      // formdata_donpenerima:Diri Sendiri
      // formdata_donhubpenerima:Diri Sendiri
      // formdata_donnamapenerima:dym test#8 jovb
      // formdata_donidpenerima:8844556699
      // formdata_donjudul:dym test#8 jovb
      // formdata_donseolink:dym-test#8-jovb
      // formdata_doncerita:dym test#8 jovb
      // formdata_dontarget:1000000
      // formdata_donhingga:2021-9-17
      // formdata_donrincian:dym test#8 jovb
      // formdata_donpencairan:1
      // formdata_donpenyaluran:1
      // formdata_donbank:002
      // formdata_donnorek:1019101901910
      // formdata_donnamarek:dym test#8 jovb
      // formdata_donajakan:dym test#8 jovb
      // formdata_apikey:421fb8edf19461b0eb375da1c4f58332717d0f95
      // setdata_mod:post-data
      // formdata_origin:me
      // formdata_seolink:dym-test#8-jovb
      // formdata_cid:
      // formdata_putlist:donation

      request.files.add(multipart_ktp);
      //request.files.add(multipart_npwp);
      request.files.add(multipart_champ);

      final response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("suapperrrr: "+ responseString);

      request.send().then((onValue) {
        print(onValue.headers);
        print(onValue.contentLength);
      });

      if (response.statusCode == 200) {
        print("hasil_donasi_post_send: " + response.toString());
        //final data = buktiBayarDonasiModelFromJson(response);
        return 200;
      } else {
        print("error_donasi_post_send: " + request.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donasi_post_send $e");
      return null;
    }
  }

  Future pengajuanPencairanDana(
      String formdata_pencairanprice,
      String formdata_pencairanbank,
      String formdata_pencairannorek,
      String formdata_pencairannamarek,
      String formdata_pencairantextmessage,
      String formdata_pencairansetuju,
      String formdata_apikey,
      String setdata_mod,
      String formdata_origin,
      String formdata_cid,
      String formdata_postlist,
      ) async {
    try{
      final hasil =
      await http.post(ConstanUrl().baseUrl + "cairkan_dana", body: {
        'formdata_pencairanprice': formdata_pencairanprice,
        'formdata_pencairanbank': formdata_pencairanbank,
        'formdata_pencairannorek': formdata_pencairannorek,
        'formdata_pencairannamarek': formdata_pencairannamarek,
        'formdata_pencairantextmessage': formdata_pencairantextmessage,
        'formdata_pencairansetuju': formdata_pencairansetuju,
        'formdata_apikey': formdata_apikey,
        'setdata_mod': setdata_mod,
        'formdata_origin': formdata_origin,
        'formdata_cid': formdata_cid,
        'formdata_postlist': formdata_postlist,
      });

      if (hasil.statusCode == 200) {
            final jsondata = jsonDecode(hasil.body);
            StatusModel listData = StatusModel.fromJson(jsondata);

            if (listData.status == 200) {
              return listData;
            } else if (listData.status == 402) {
              return listData;
            } else if (listData.status == 500) {
              return listData;
            } else {
              print("gagal");
              return null;
            }
      } else {
        print("error_pengajuanPencairanDana_send: " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_pengajuanPencairanDana_send $e");
      return null;
    }
    }



  Future sendKabar(
      String formdata_kabarjudul,
      formdata_kabartextmessage,
      formdata_kabarwaktu,
      formdata_apikey,
      setdata_mod,
      formdata_origin,
      formdata_cid,
      formdata_ccid,
      formdata_postlist,
      File formdata_kabarimg) async {

    print("sendkabar: \n"+
        "formdata_kabarjudul: "+formdata_kabarjudul.toString()+"\n"+
        "formdata_kabartextmessage: "+formdata_kabartextmessage.toString()+"\n"+
        "formdata_kabarwaktu: "+formdata_kabarwaktu.toString()+"\n"+
        "formdata_apikey: "+formdata_apikey.toString()+"\n"+
        "setdata_mod: "+setdata_mod.toString()+"\n"+
        "formdata_origin: "+formdata_origin.toString()+"\n"+
        "formdata_cid: "+formdata_cid.toString()+"\n"+
        "formdata_ccid: "+formdata_ccid.toString()+"\n"+
        "formdata_postlist: "+formdata_postlist.toString());

    try {
      //imgoth1
      // var stream = formdata_imginv != null ? new http.ByteStream(
      //     DelegatingStream.typed(formdata_imginv.openRead())) : "";

      var stream = new http.ByteStream(
          DelegatingStream.typed(formdata_kabarimg.openRead()));
      //read size image
      var length = await formdata_kabarimg.length();
      //multipart
      var multipart = http.MultipartFile('formdata_kabarimg', stream, length,
          filename: formdata_kabarimg.path);

      var request = http.MultipartRequest(
          'POST', Uri.parse("https://api.edunitas.com/mod/edun-donation-g"));

      request.fields['formdata_kabarjudul'] = formdata_kabarjudul;
      request.fields['formdata_kabartextmessage'] = formdata_kabartextmessage;
      request.fields['formdata_kabarwaktu'] = formdata_kabarwaktu;
      request.fields['formdata_apikey'] = formdata_apikey;
      request.fields['setdata_mod'] = setdata_mod;
      request.fields['formdata_origin'] = formdata_origin;
      request.fields['formdata_cid'] = formdata_cid;
      request.fields['formdata_ccid'] = formdata_ccid;
      request.fields['formdata_postlist'] = formdata_postlist;

      request.files.add(multipart);

      final response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      request.send().then((onValue) {
        print("SUPERNENECHIII!!!" + onValue.statusCode.toString());

        print(onValue.headers);
        print(onValue.contentLength);
      });

      if (response.statusCode == 200) {
        print("hasil_donasi_donasi_send: " + response.toString());
        //final data = buktiBayarDonasiModelFromJson(response);
        return response.statusCode;
      } else {
        print("error_donasi_donasi_send: " + request.toString());
        return null;
      }
    } catch (e) {
      print("error_catch_donasi_send $e");
      return null;
    }
  }
}
