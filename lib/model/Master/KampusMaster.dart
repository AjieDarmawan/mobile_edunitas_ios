// To parse this JSON data, do
//
//     final kampusMasterModel = kampusMasterModelFromJson(jsonString);

import 'dart:convert';

List<KampusMasterModel> kampusMasterModelFromJson(String str) => List<KampusMasterModel>.from(json.decode(str).map((x) => KampusMasterModel.fromJson(x)));

String kampusMasterModelToJson(List<KampusMasterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KampusMasterModel {
    KampusMasterModel({
        this.id,
        this.nama,
        this.kode,
        this.singkatan,
        this.logo,
    });

    int id;
    String nama;
    String kode;
    String singkatan;
    String logo;

    factory KampusMasterModel.fromJson(Map<String, dynamic> json) => KampusMasterModel(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        kode: json["kode"] == null ? null : json["kode"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        logo: json["logo"] == null ? null : json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "kode": kode == null ? null : kode,
        "singkatan": singkatan == null ? null : singkatan,
        "logo": logo == null ? null : logo,
    };
}
