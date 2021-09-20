// To parse this JSON data, do
//
//     final listCampusModel = listCampusModelFromJson(jsonString);

import 'dart:convert';

ListCampusModel listCampusModelFromJson(String str) =>
    ListCampusModel.fromJson(json.decode(str));

String listCampusModelToJson(ListCampusModel data) =>
    json.encode(data.toJson());

class ListCampusModel {
  ListCampusModel({
    this.status,
    this.message,
    this.campus,
  });

  int status;
  String message;
  List<Campus> campus;

  factory ListCampusModel.fromJson(Map<String, dynamic> json) =>
      ListCampusModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        campus: json["Campus"] == null
            ? null
            : List<Campus>.from(json["Campus"].map((x) => Campus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "Campus": campus == null
            ? null
            : List<dynamic>.from(campus.map((x) => x.toJson())),
      };
}

class Campus {
  Campus({
    this.id,
    this.nama,
    this.logo,
    this.cover,
    this.singkatan,
    this.website,
    this.webacid,
    this.kota,
    this.rektor,
    this.strlat,
    this.strlong,
    this.akreditasi,
    this.alamat,
    this.email,
    this.banpt,
    this.totaljurusan,
    this.color,
    this.biaya,
    this.biayaDicoret,
    this.fileFlyer,
    this.fileBrosur,
    this.filePath,
    this.picnik,
    this.picname,
    this.keterangan,
    this.visi,
    this.misi,
    this.youtube,
    this.transportasi,
    this.slogan,
    this.fileCampus,
    this.jurusan,
  });

  int id;
  String nama;
  String logo;
  String cover;
  String singkatan;
  String website;
  String webacid;
  String kota;
  String rektor;
  String strlat;
  String strlong;
  String akreditasi;
  String alamat;
  String email;
  String banpt;
  int totaljurusan;
  String color;
  String biaya;
  String biayaDicoret;
  String fileFlyer;
  String fileBrosur;
  String filePath;
  String picnik;
  String picname;
  String keterangan;
  String visi;
  String misi;
  String youtube;
  List<String> transportasi;
  String slogan;
  FileCampus fileCampus;
  List<String> jurusan;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        logo: json["logo"] == null ? null : json["logo"],
        cover: json["cover"] == null ? null : json["cover"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        website: json["website"] == null ? null : json["website"],
        webacid: json["webacid"] == null ? null : json["webacid"],
        kota: json["kota"] == null ? null : json["kota"],
        rektor: json["rektor"] == null ? null : json["rektor"],
        strlat: json["strlat"] == null ? null : json["strlat"],
        strlong: json["strlong"] == null ? null : json["strlong"],
        akreditasi: json["akreditasi"] == null ? null : json["akreditasi"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        email: json["email"] == null ? null : json["email"],
        banpt: json["banpt"] == null ? null : json["banpt"],
        totaljurusan:
            json["totaljurusan"] == null ? null : json["totaljurusan"],
        color: json["color"] == null ? null : json["color"],
        biaya: json["biaya"] == null ? null : json["biaya"],
        biayaDicoret:
            json["biaya_dicoret"] == null ? null : json["biaya_dicoret"],
        fileFlyer: json["file_flyer"] == null ? null : json["file_flyer"],
        fileBrosur: json["file_brosur"] == null ? null : json["file_brosur"],
        filePath: json["file_path"] == null ? null : json["file_path"],
        picnik: json["picnik"] == null ? null : json["picnik"],
        picname: json["picname"] == null ? null : json["picname"],
        keterangan: json["keterangan"] == null ? null : json["keterangan"],
        visi: json["visi"] == null ? null : json["visi"],
        misi: json["misi"] == null ? null : json["misi"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        transportasi: json["transportasi"] == null
            ? null
            : List<String>.from(json["transportasi"].map((x) => x)),
        slogan: json["slogan"] == null ? null : json["slogan"],
        fileCampus: json["file_campus"] == null
            ? null
            : FileCampus.fromJson(json["file_campus"]),
        jurusan: json["jurusan"] == null
            ? null
            : List<String>.from(json["jurusan"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "logo": logo == null ? null : logo,
        "cover": cover == null ? null : cover,
        "singkatan": singkatan == null ? null : singkatan,
        "website": website == null ? null : website,
        "webacid": webacid == null ? null : webacid,
        "kota": kota == null ? null : kota,
        "rektor": rektor == null ? null : rektor,
        "strlat": strlat == null ? null : strlat,
        "strlong": strlong == null ? null : strlong,
        "akreditasi": akreditasi == null ? null : akreditasi,
        "alamat": alamat == null ? null : alamat,
        "email": email == null ? null : email,
        "banpt": banpt == null ? null : banpt,
        "totaljurusan": totaljurusan == null ? null : totaljurusan,
        "color": color == null ? null : color,
        "biaya": biaya == null ? null : biaya,
        "biaya_dicoret": biayaDicoret == null ? null : biayaDicoret,
        "file_flyer": fileFlyer == null ? null : fileFlyer,
        "file_brosur": fileBrosur == null ? null : fileBrosur,
        "file_path": filePath == null ? null : filePath,
        "picnik": picnik == null ? null : picnik,
        "picname": picname == null ? null : picname,
        "keterangan": keterangan == null ? null : keterangan,
        "visi": visi == null ? null : visi,
        "misi": misi == null ? null : misi,
        "youtube": youtube == null ? null : youtube,
        "transportasi": transportasi == null
            ? null
            : List<dynamic>.from(transportasi.map((x) => x)),
        "slogan": slogan == null ? null : slogan,
        "file_campus": fileCampus == null ? null : fileCampus.toJson(),
        "jurusan":
            jurusan == null ? null : List<dynamic>.from(jurusan.map((x) => x)),
      };
}

class FileCampus {
  FileCampus({
    this.imglogo,
    this.imgcover,
    this.imgoth1,
    this.imgoth2,
    this.filebiaya,
    this.imgrektor,
  });

  String imglogo;
  String imgcover;
  String imgoth1;
  String imgoth2;
  String filebiaya;
  String imgrektor;

  factory FileCampus.fromJson(Map<String, dynamic> json) => FileCampus(
        imglogo: json["imglogo"] == null ? null : json["imglogo"],
        imgcover: json["imgcover"] == null ? null : json["imgcover"],
        imgoth1: json["imgoth1"] == null ? null : json["imgoth1"],
        imgoth2: json["imgoth2"] == null ? null : json["imgoth2"],
        filebiaya: json["filebiaya"] == null ? null : json["filebiaya"],
        imgrektor: json["imgrektor"] == null ? null : json["imgrektor"],
      );

  Map<String, dynamic> toJson() => {
        "imglogo": imglogo == null ? null : imglogo,
        "imgcover": imgcover == null ? null : imgcover,
        "imgoth1": imgoth1 == null ? null : imgoth1,
        "imgoth2": imgoth2 == null ? null : imgoth2,
        "filebiaya": filebiaya == null ? null : filebiaya,
        "imgrektor": imgrektor == null ? null : imgrektor,
      };
}
