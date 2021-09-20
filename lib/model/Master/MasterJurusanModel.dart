// To parse this JSON data, do
//
//     final masterJurusanModel = masterJurusanModelFromJson(jsonString);

import 'dart:convert';

List<MasterJurusanModel> masterJurusanModelFromJson(String str) =>
    List<MasterJurusanModel>.from(
        json.decode(str).map((x) => MasterJurusanModel.fromJson(x)));

String masterJurusanModelToJson(List<MasterJurusanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterJurusanModel {
  MasterJurusanModel({
      this.id,
        this.kode,
        this.nama,
        this.jenjang,
        this.gelar,
        this.karir,
        this.komp,
    });

    int id;
    String kode;
    String nama;
    String jenjang;
    String gelar;
    String karir;
    String komp;

  factory MasterJurusanModel.fromJson(Map<String, dynamic> json) =>
      MasterJurusanModel(
        id: json["id"] == null ? null : json["id"],
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama"] == null ? null : json["nama"],
        jenjang: json["jenjang"] == null ? null : json["jenjang"],
        gelar: json["gelar"] == null ? null : json["gelar"],
        karir: json["karir"] == null ? null : json["karir"],
         komp: json["komp"] == null ? null : json["komp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "kode": kode == null ? null : kode,
        "nama": nama == null ? null : nama,
        "jenjang": jenjang == null ? null : jenjang,
        "gelar": gelar == null ? null : gelar,
        "karir": karir == null ? null : karir,
        "komp": komp == null ? null : komp,
      };
}

enum Jenjang { S1, SMK, D3, S2, SMA, D4, D1, MA }

final jenjangValues = EnumValues({
  "D1": Jenjang.D1,
  "D3": Jenjang.D3,
  "D4": Jenjang.D4,
  "MA": Jenjang.MA,
  "S1": Jenjang.S1,
  "S2": Jenjang.S2,
  "SMA": Jenjang.SMA,
  "SMK": Jenjang.SMK
});

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
