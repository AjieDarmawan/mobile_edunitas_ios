// To parse this JSON data, do
//
//     final campuskelasModel = campuskelasModelFromJson(jsonString);

import 'dart:convert';

CampuskelasModel campuskelasModelFromJson(String str) => CampuskelasModel.fromJson(json.decode(str));

String campuskelasModelToJson(CampuskelasModel data) => json.encode(data.toJson());

class CampuskelasModel {
    CampuskelasModel({
        this.kelompok,
        this.kodeprg,
        this.kodejrs,
        this.kelas,
    });

    String kelompok;
    String kodeprg;
    String kodejrs;
    List<Kela> kelas;

    factory CampuskelasModel.fromJson(Map<String, dynamic> json) => CampuskelasModel(
        kelompok: json["kelompok"] == null ? null : json["kelompok"],
        kodeprg: json["kodeprg"] == null ? null : json["kodeprg"],
        kodejrs: json["kodejrs"] == null ? null : json["kodejrs"],
        kelas: json["kelas"] == null ? null : List<Kela>.from(json["kelas"].map((x) => Kela.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kelompok": kelompok == null ? null : kelompok,
        "kodeprg": kodeprg == null ? null : kodeprg,
        "kodejrs": kodejrs == null ? null : kodejrs,
        "kelas": kelas == null ? null : List<dynamic>.from(kelas.map((x) => x.toJson())),
    };
}

class Kela {
    Kela({
        this.title,
        this.singkatan,
    });

    String title;
    String singkatan;

    factory Kela.fromJson(Map<String, dynamic> json) => Kela(
        title: json["title"] == null ? null : json["title"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "singkatan": singkatan == null ? null : singkatan,
    };
}
