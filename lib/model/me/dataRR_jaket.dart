// To parse this JSON data, do
//
//     final InfoPJaket = InfoPJaketFromJson(jsonString);

import 'dart:convert';

InfoPJaket InfoPJaketFromJson(String str) => InfoPJaket.fromJson(json.decode(str));

String InfoPJaketToJson(InfoPJaket data) => json.encode(data.toJson());

class InfoPJaket {
    InfoPJaket({
        this.summarya,
        this.realita,
    });

    Summarya summarya;
    List<Realita> realita;

    factory InfoPJaket.fromJson(Map<String, dynamic> json) => InfoPJaket(
        summarya: json["summarya"] == null ? null : Summarya.fromJson(json["summarya"]),
        realita: json["realita"] == null ? null : List<Realita>.from(json["realita"].map((x) => Realita.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "summarya": summarya == null ? null : summarya.toJson(),
        "realita": realita == null ? null : List<dynamic>.from(realita.map((x) => x.toJson())),
    };
}

class Realita {
    Realita({
        this.ke,
        this.rp,
        this.tg,
    });

    String ke;
    String rp;
    String tg;

    factory Realita.fromJson(Map<String, dynamic> json) => Realita(
        ke: json["ke"] == null ? null : json["ke"],
        rp: json["rp"] == null ? null : json["rp"],
        tg: json["tg"] == null ? null : json["tg"],
    );

    Map<String, dynamic> toJson() => {
        "ke": ke == null ? null : ke,
        "rp": rp == null ? null : rp,
        "tg": tg == null ? null : tg,
    };
}

class Summarya {
    Summarya({
        this.juma,
    });

    int juma;

    factory Summarya.fromJson(Map<String, dynamic> json) => Summarya(
        juma: json["juma"] == null ? null : json["juma"],
    );

    Map<String, dynamic> toJson() => {
        "juma": juma == null ? null : juma,
    };
}
