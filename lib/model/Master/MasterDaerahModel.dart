// To parse this JSON data, do
//
//     final masterDaerahModel = masterDaerahModelFromJson(jsonString);

import 'dart:convert';

List<MasterDaerahModel> masterDaerahModelFromJson(String str) =>
    List<MasterDaerahModel>.from(
        json.decode(str).map((x) => MasterDaerahModel.fromJson(x)));

String masterDaerahModelToJson(List<MasterDaerahModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterDaerahModel {
  MasterDaerahModel({
    this.id,
    this.parent,
    this.kode,
    this.nama,
    this.fmod,
  });

  int id;
  String parent;
  String kode;
  String nama;
  Fmod fmod;

  factory MasterDaerahModel.fromJson(Map<String, dynamic> json) =>
      MasterDaerahModel(
        id: json["id"] == null ? null : json["id"],
        parent: json["parent"] == null ? null : json["parent"],
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama"] == null ? null : json["nama"],
        fmod: json["fmod"] == null ? null : fmodValues.map[json["fmod"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parent": parent == null ? null : parent,
        "kode": kode == null ? null : kode,
        "nama": nama == null ? null : nama,
        "fmod": fmod == null ? null : fmodValues.reverse[fmod],
      };
}

enum Fmod { PROVINSI }

final fmodValues = EnumValues({"Provinsi": Fmod.PROVINSI});

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
