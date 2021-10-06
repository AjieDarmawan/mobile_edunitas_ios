// To parse this JSON data, do
//
//     final detailCampusModel = detailCampusModelFromJson(jsonString);

import 'dart:convert';

DetailCampusModel2 detailCampusModel2FromJson(String str) => DetailCampusModel2.fromJson(json.decode(str));

String detailCampusModel2ToJson(DetailCampusModel2 data) => json.encode(data.toJson());

class DetailCampusModel2 {
    DetailCampusModel2({
        this.link_youtube_pendek,
        this.rektor,
        this.angkutan,
        this.alamat,
    });

    String link_youtube_pendek;
    String rektor;
    Angkutan angkutan;
    String alamat;

    factory DetailCampusModel2.fromJson(Map<String, dynamic> json) => DetailCampusModel2(
        link_youtube_pendek: json["link_youtube_pendek"] == null ? null : json["link_youtube_pendek"],
        rektor: json["rektor"] == null ? null : json["rektor"],
        angkutan: Angkutan.fromJson(json['angkutan']),
        alamat: json["alamat_1"] == null ? null : json["alamat_1"],
    );

    Map<String, dynamic> toJson() => {
        "link_youtube_pendek": link_youtube_pendek == null ? null : link_youtube_pendek,
        "rektor": rektor == null ? null : rektor,
        //"angkutan": angkutan == null ? null : angkutan.toJson(),
        "alamat": alamat == null ? null : alamat,
    };
}

class Angkutan {
    Angkutan({
        this.kampus1,
    });

    Kampus1 kampus1;
    factory Angkutan.fromJson(Map<String, dynamic> json) {
        return Angkutan(
            kampus1: Kampus1.fromJson(json['kampus_1'])
        );
    }
    Map<String, dynamic> toJson() => {
        "kampus_1": kampus1 == null ? null : kampus1.toJson(),
    };
}

class Kampus1 {
    Kampus1({
        this.mikrolet1,
        this.mikrolet2,
        this.mikrolet3,
        this.mikrolet4,
        this.mikrolet5,
    });

    String mikrolet1;
    String mikrolet2;
    String mikrolet3;
    String mikrolet4;
    String mikrolet5;
    factory Kampus1.fromJson(Map<String, dynamic> json) {
        return Kampus1(
            mikrolet1: json['Mikrolet M 04 Cililitan - Rawasari'],
            mikrolet2: json['Mikrolet M 06 Kampung Melayu - Gandaria'],
            mikrolet3: json['Mikrolet M16 Pasar Minggu - Kampung Melayu'],
            mikrolet4: json['Mikrolet M29 Cililitan - Perumnas Klender Bekasi'],
            mikrolet5: json['dan sebagainya']
        );
    }
    Map<String, dynamic> toJson() => {
    "mikrolet1": mikrolet1 == null ? null : mikrolet1,
    "mikrolet2": mikrolet2 == null ? null : mikrolet2,
    "mikrolet3": mikrolet3 == null ? null : mikrolet3,
    "mikrolet4": mikrolet4 == null ? null : mikrolet4,
    "mikrolet5": mikrolet5 == null ? null : mikrolet5,
};
}