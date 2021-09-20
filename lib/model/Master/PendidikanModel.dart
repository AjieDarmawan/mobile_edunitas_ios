// To parse this JSON data, do
//
//     final pendidikanModel = pendidikanModelFromJson(jsonString);

import 'dart:convert';

List<PendidikanModel> pendidikanModelFromJson(String str) => List<PendidikanModel>.from(json.decode(str).map((x) => PendidikanModel.fromJson(x)));

String pendidikanModelToJson(List<PendidikanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendidikanModel {
    PendidikanModel({
        this.id,
        this.kode,
        this.nama,
        this.kelompok,
        this.kodelulusan,
        this.urutan,
        this.minurutan,
        this.minluluan,
        this.errorNotif,
    });

    int id;
    String kode;
    String nama;
    String kelompok;
    String kodelulusan;
    int urutan;
    String minurutan;
    String minluluan;
    String errorNotif;

    factory PendidikanModel.fromJson(Map<String, dynamic> json) => PendidikanModel(
        id: json["id"] == null ? null : json["id"],
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama"] == null ? null : json["nama"],
        kelompok: json["kelompok"] == null ? null : json["kelompok"],
        kodelulusan: json["kodelulusan"] == null ? null : json["kodelulusan"],
        urutan: json["urutan"] == null ? null : json["urutan"],
        minurutan: json["minurutan"] == null ? null : json["minurutan"],
        minluluan: json["minluluan"] == null ? null : json["minluluan"],
        errorNotif: json["error_notif"] == null ? null : json["error_notif"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "kode": kode == null ? null : kode,
        "nama": nama == null ? null : nama,
        "kelompok": kelompok == null ? null : kelompok,
        "kodelulusan": kodelulusan == null ? null : kodelulusan,
        "urutan": urutan == null ? null : urutan,
        "minurutan": minurutan == null ? null : minurutan,
        "minluluan": minluluan == null ? null : minluluan,
        "error_notif": errorNotif == null ? null : errorNotif,
    };
}
