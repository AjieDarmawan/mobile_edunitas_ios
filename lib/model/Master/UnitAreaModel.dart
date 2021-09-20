// To parse this JSON data, do
//
//     final unitAreaModel = unitAreaModelFromJson(jsonString);

import 'dart:convert';

List<UnitAreaModel> unitAreaModelFromJson(String str) => List<UnitAreaModel>.from(json.decode(str).map((x) => UnitAreaModel.fromJson(x)));

String unitAreaModelToJson(List<UnitAreaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitAreaModel {
    UnitAreaModel({
        this.id,
        this.nama,
        this.prop,
        this.wilId,
        this.provinsi,
        this.kabupaten,
        this.kota,
    });

    int id;
    String nama;
    String prop;
    dynamic wilId;
    String provinsi;
    String kabupaten;
    dynamic kota;

    factory UnitAreaModel.fromJson(Map<String, dynamic> json) => UnitAreaModel(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        prop: json["prop"] == null ? null : json["prop"],
        wilId: json["wil_id"],
        provinsi: json["provinsi"] == null ? null : json["provinsi"],
        kabupaten: json["kabupaten"] == null ? null : json["kabupaten"],
        kota: json["kota"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "prop": prop == null ? null : prop,
        "wil_id": wilId,
        "provinsi": provinsi == null ? null : provinsi,
        "kabupaten": kabupaten == null ? null : kabupaten,
        "kota": kota,
    };
}
