// To parse this JSON data, do
//
//     final listLogoGambarModel = listLogoGambarModelFromJson(jsonString);

import 'dart:convert';

ListLogoGambarModel listLogoGambarModelFromJson(String str) =>
    ListLogoGambarModel.fromJson(json.decode(str));

String listLogoGambarModelToJson(ListLogoGambarModel data) =>
    json.encode(data.toJson());

class ListLogoGambarModel {
  ListLogoGambarModel({
    this.status,
    this.message,
    this.populer,
  });

  String status;
  String message;
  List<Populer> populer;

  factory ListLogoGambarModel.fromJson(Map<String, dynamic> json) =>
      ListLogoGambarModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        populer: json["Populer"] == null
            ? null
            : List<Populer>.from(
                json["Populer"].map((x) => Populer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "Populer": populer == null
            ? null
            : List<dynamic>.from(populer.map((x) => x.toJson())),
      };
}

class Populer {
  Populer({
    this.id,
    this.nama,
    this.kode,
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
  String kode;
  String logo;
  String cover;
  String singkatan;
  String website;
  String webacid;
  String kota;
  String rektor;
  String strlat;
  String strlong;
  Akreditasi akreditasi;
  String alamat;
  Email email;
  Banpt banpt;
  int totaljurusan;
  String color;
  String biaya;
  String biayaDicoret;
  String fileFlyer;
  String fileBrosur;
  String filePath;
  Picn picnik;
  Picn picname;
  String keterangan;
  String visi;
  String misi;
  String youtube;
  List<String> transportasi;
  String slogan;
  FileCampus fileCampus;
  List<String> jurusan;

  factory Populer.fromJson(Map<String, dynamic> json) => Populer(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        kode: json["kode"] == null ? null : json["kode"],
        logo: json["logo"] == null ? null : json["logo"],
        cover: json["cover"] == null ? null : json["cover"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        website: json["website"] == null ? null : json["website"],
        webacid: json["webacid"] == null ? null : json["webacid"],
        kota: json["kota"] == null ? null : json["kota"],
        rektor: json["rektor"] == null ? null : json["rektor"],
        strlat: json["strlat"] == null ? null : json["strlat"],
        strlong: json["strlong"] == null ? null : json["strlong"],
        akreditasi: json["akreditasi"] == null
            ? null
            : akreditasiValues.map[json["akreditasi"]],
        alamat: json["alamat"] == null ? null : json["alamat"],
        email: json["email"] == null ? null : emailValues.map[json["email"]],
        banpt: json["banpt"] == null ? null : banptValues.map[json["banpt"]],
        totaljurusan:
            json["totaljurusan"] == null ? null : json["totaljurusan"],
        color: json["color"] == null ? null : json["color"],
        biaya: json["biaya"] == null ? null : json["biaya"],
        biayaDicoret:
            json["biaya_dicoret"] == null ? null : json["biaya_dicoret"],
        fileFlyer: json["file_flyer"] == null ? null : json["file_flyer"],
        fileBrosur: json["file_brosur"] == null ? null : json["file_brosur"],
        filePath: json["file_path"] == null ? null : json["file_path"],
        picnik: json["picnik"] == null ? null : picnValues.map[json["picnik"]],
        picname:
            json["picname"] == null ? null : picnValues.map[json["picname"]],
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
        "kode": kode == null ? null : kode,
        "logo": logo == null ? null : logo,
        "cover": cover == null ? null : cover,
        "singkatan": singkatan == null ? null : singkatan,
        "website": website == null ? null : website,
        "webacid": webacid == null ? null : webacid,
        "kota": kota == null ? null : kota,
        "rektor": rektor == null ? null : rektor,
        "strlat": strlat == null ? null : strlat,
        "strlong": strlong == null ? null : strlong,
        "akreditasi":
            akreditasi == null ? null : akreditasiValues.reverse[akreditasi],
        "alamat": alamat == null ? null : alamat,
        "email": email == null ? null : emailValues.reverse[email],
        "banpt": banpt == null ? null : banptValues.reverse[banpt],
        "totaljurusan": totaljurusan == null ? null : totaljurusan,
        "color": color == null ? null : color,
        "biaya": biaya == null ? null : biaya,
        "biaya_dicoret": biayaDicoret == null ? null : biayaDicoret,
        "file_flyer": fileFlyer == null ? null : fileFlyer,
        "file_brosur": fileBrosur == null ? null : fileBrosur,
        "file_path": filePath == null ? null : filePath,
        "picnik": picnik == null ? null : picnValues.reverse[picnik],
        "picname": picname == null ? null : picnValues.reverse[picname],
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

enum Akreditasi { EMPTY, B }

final akreditasiValues = EnumValues({"B": Akreditasi.B, "": Akreditasi.EMPTY});

enum Banpt { EMPTY, THE_599_SK_BAN_PT_AK_SURV_PT_VI_2015, A }

final banptValues = EnumValues({
  "A": Banpt.A,
  "": Banpt.EMPTY,
  "599/SK/BAN-PT/Ak-SURV/PT/VI/2015": Banpt.THE_599_SK_BAN_PT_AK_SURV_PT_VI_2015
});

// enum Color { BLUE }

// final colorValues = EnumValues({
//     "blue": Color.BLUE
// });

enum Email { EMPTY, REKTORAT_UM_SURABAYA_AC_ID, FISIPFTAN_GGKLIK_GMAIL_COM }

final emailValues = EnumValues({
  "": Email.EMPTY,
  "fisipftan.ggklik@gmail.com": Email.FISIPFTAN_GGKLIK_GMAIL_COM,
  "rektorat@um-surabaya.ac.id": Email.REKTORAT_UM_SURABAYA_AC_ID
});

class FileCampus {
  FileCampus({
    this.imglogo,
    this.imgcover,
    this.imgoth1,
    this.imgoth2,
    this.filebiaya,
    this.imgrektor,
  });

  Imglogo imglogo;
  Imgcover imgcover;
  Imgoth1 imgoth1;
  Imgoth2 imgoth2;
  String filebiaya;
  String imgrektor;

  factory FileCampus.fromJson(Map<String, dynamic> json) => FileCampus(
        imglogo:
            json["imglogo"] == null ? null : imglogoValues.map[json["imglogo"]],
        imgcover: json["imgcover"] == null
            ? null
            : imgcoverValues.map[json["imgcover"]],
        imgoth1:
            json["imgoth1"] == null ? null : imgoth1Values.map[json["imgoth1"]],
        imgoth2:
            json["imgoth2"] == null ? null : imgoth2Values.map[json["imgoth2"]],
        filebiaya: json["filebiaya"] == null ? null : json["filebiaya"],
        imgrektor: json["imgrektor"] == null ? null : json["imgrektor"],
      );

  Map<String, dynamic> toJson() => {
        "imglogo": imglogo == null ? null : imglogoValues.reverse[imglogo],
        "imgcover": imgcover == null ? null : imgcoverValues.reverse[imgcover],
        "imgoth1": imgoth1 == null ? null : imgoth1Values.reverse[imgoth1],
        "imgoth2": imgoth2 == null ? null : imgoth2Values.reverse[imgoth2],
        "filebiaya": filebiaya == null ? null : filebiaya,
        "imgrektor": imgrektor == null ? null : imgrektor,
      };
}

enum Imgcover { COVER_PNG }

final imgcoverValues = EnumValues({"cover.png": Imgcover.COVER_PNG});

enum Imglogo { LOGO_PNG }

final imglogoValues = EnumValues({"logo.png": Imglogo.LOGO_PNG});

enum Imgoth1 { OTH1_JPG }

final imgoth1Values = EnumValues({"oth1.jpg": Imgoth1.OTH1_JPG});

enum Imgoth2 { OTH2_JPG }

final imgoth2Values = EnumValues({"oth2.jpg": Imgoth2.OTH2_JPG});

enum Picn { PICNIK }

final picnValues = EnumValues({"picnik": Picn.PICNIK});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
