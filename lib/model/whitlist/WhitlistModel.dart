// To parse this JSON data, do
//
//     final whitlistModel = whitlistModelFromJson(jsonString);

import 'dart:convert';

List<WhitlistModel> whitlistModelFromJson(String str) => List<WhitlistModel>.from(json.decode(str).map((x) => WhitlistModel.fromJson(x)));

String whitlistModelToJson(List<WhitlistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WhitlistModel {
    WhitlistModel({
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
        this.akreditasi,
        this.alamat,
        this.campuswhitlist,
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
    String akreditasi;
    String alamat;
    WhitlistModel campuswhitlist;

    factory WhitlistModel.fromJson(Map<String, dynamic> json) => WhitlistModel(
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
        akreditasi: json["akreditasi"] == null ? null : json["akreditasi"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        campuswhitlist: json["campuswhitlist"] == null ? null : WhitlistModel.fromJson(json["campuswhitlist"]),
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
        "akreditasi": akreditasi == null ? null : akreditasi,
        "alamat": alamat == null ? null : alamat,
        "campuswhitlist": campuswhitlist == null ? null : campuswhitlist.toJson(),
    };
}
