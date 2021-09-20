// To parse this JSON data, do
//
//     final spesialisasiModel = spesialisasiModelFromJson(jsonString);

import 'dart:convert';

List<SpesialisasiModel> spesialisasiModelFromJson(String str) => List<SpesialisasiModel>.from(json.decode(str).map((x) => SpesialisasiModel.fromJson(x)));

String spesialisasiModelToJson(List<SpesialisasiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpesialisasiModel {
    SpesialisasiModel({
        this.id,
        this.parent,
        this.kode,
        this.nama,
    });

    int id;
    String parent;
    String kode;
    String nama;

    factory SpesialisasiModel.fromJson(Map<String, dynamic> json) => SpesialisasiModel(
        id: json["id"] == null ? null : json["id"],
        parent: json["parent"] == null ? null : json["parent"],
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama"] == null ? null : json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parent": parent == null ? null : parent,
        "kode": kode == null ? null : kode,
        "nama": nama == null ? null : nama,
    };
}
