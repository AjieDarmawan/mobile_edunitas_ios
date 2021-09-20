import 'dart:convert';

List<DonasiKabarModel> detailDonasiKabarModelFromJson(String str) =>
    List<DonasiKabarModel>.from(
        json.decode(str).map((x) => DonasiKabarModel.fromJson(x)));

String detailDonasiKabarModelToJson(List<DonasiKabarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonasiKabarModel {
  DonasiKabarModel({
    this.judul,
    this.textmessage,
    this.waktu,
    this.crdt,
    this.crur,
    this.statuskabar,
    this.cover,
    this.cid,
  });

  String judul;
  String textmessage;
  String waktu;
  String crdt;
  String crur;
  String statuskabar;
  String cover;
  String cid;

  factory DonasiKabarModel.fromJson(Map<String, dynamic> json) =>
      DonasiKabarModel(
        judul: json["judul"] == null ? null : json["judul"],
        textmessage: json["textmessage"] == null ? null : json["textmessage"],
        waktu: json["waktu"] == null ? null : json["waktu"],
        crdt: json["crdt"] == null ? null : json["crdt"],
        crur: json["crur"] == null ? null : json["crur"],
        statuskabar: json["statuskabar"] == null ? null : json["statuskabar"],
        cover: json["cover"] == null ? null : json["cover"],
        cid: json["cid"] == null ? null : json["cid"],
      );

  Map<String, dynamic> toJson() => {
    "judul": judul== null ? null : judul,
    "textmessage": textmessage == null ? null : textmessage,
    "waktu": waktu == null ? null : waktu,
    "crdt": crdt == null ? null : crdt,
    "crur": crur == null ? null : crur,
    "statuskabar": statuskabar == null ? null : statuskabar,
    "cover": cover == null ? null : cover,
    "cid": cid == null ? null : cid,
  };
}
