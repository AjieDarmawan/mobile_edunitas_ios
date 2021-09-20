// To parse this JSON data, do
//
//     final prodiMultipeModel = prodiMultipeModelFromJson(jsonString);

import 'dart:convert';

List<ProdiMultipleModel> prodiMultipeModelFromJson(String str) =>
    List<ProdiMultipleModel>.from(
        json.decode(str).map((x) => ProdiMultipleModel.fromJson(x)));

String prodiMultipeModelToJson(List<ProdiMultipleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProdiMultipleModel {
  ProdiMultipleModel({
    this.id,
    this.kode,
    this.nama,
    this.jenjang,
  });

  int id;
  String kode;
  String nama;
  String jenjang;

  factory ProdiMultipleModel.fromJson(Map<String, dynamic> json) =>
      ProdiMultipleModel(
        id: json["id"] == null ? null : json["id"],
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama "] == null ? null : json["nama "],
        jenjang: json["jenjang"] == null ? null : json["jenjang"],
      );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "kode": kode == null ? null : kode,
    "nama ": nama == null ? null : nama,
    "jenjang": jenjang == null ? null : jenjang,
  };
}
