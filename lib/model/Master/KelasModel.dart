// To parse this JSON data, do
//
//     final kelasModel = kelasModelFromJson(jsonString);

import 'dart:convert';

List<KelasModel> kelasModelFromJson(String str) => List<KelasModel>.from(json.decode(str).map((x) => KelasModel.fromJson(x)));

String kelasModelToJson(List<KelasModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KelasModel {
    KelasModel({
        this.id,
        this.jenis,
        this.kelompok,
        this.nama,
        this.singkatan,
        this.attr,
        this.keterangan,
        this.urutan,
    });

    int id;
    String jenis;
    String kelompok;
    String nama;
    String singkatan;
    String attr;
    String keterangan;
    int urutan;

    factory KelasModel.fromJson(Map<String, dynamic> json) => KelasModel(
        id: json["id"] == null ? null : json["id"],
        jenis: json["jenis"] == null ? null : json["jenis"],
        kelompok: json["kelompok"] == null ? null : json["kelompok"],
        nama: json["nama"] == null ? null : json["nama"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        attr: json["attr"] == null ? null : json["attr"],
        keterangan: json["keterangan"] == null ? null : json["keterangan"],
        urutan: json["urutan"] == null ? null : json["urutan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "jenis": jenis == null ? null : jenis,
        "kelompok": kelompok == null ? null : kelompok,
        "nama": nama == null ? null : nama,
        "singkatan": singkatan == null ? null : singkatan,
        "attr": attr == null ? null : attr,
        "keterangan": keterangan == null ? null : keterangan,
        "urutan": urutan == null ? null : urutan,
    };
}
