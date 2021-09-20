// To parse this JSON data, do
//
//     final InfoPSPB = InfoPSPBFromJson(jsonString);

import 'dart:convert';

InfoPSPB InfoPSPBFromJson(String str) => InfoPSPB.fromJson(json.decode(str));

String InfoPSPBToJson(InfoPSPB data) => json.encode(data.toJson());

class InfoPSPB {
    InfoPSPB({
        this.summaryr,
        this.rencana,
        this.summarya,
        this.realita,
    });

    Summaryr summaryr;
    List<Realita> rencana;
    Summarya summarya;
    List<Realita> realita;

    factory InfoPSPB.fromJson(Map<String, dynamic> json) => InfoPSPB(
        summaryr: json["summaryr"] == null ? null : Summaryr.fromJson(json["summaryr"]),
        rencana: json["rencana"] == null ? null : List<Realita>.from(json["rencana"].map((x) => Realita.fromJson(x))),
        summarya: json["summarya"] == null ? null : Summarya.fromJson(json["summarya"]),
        realita: json["realita"] == null ? null : List<Realita>.from(json["realita"].map((x) => Realita.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "summaryr": summaryr == null ? null : summaryr.toJson(),
        "rencana": rencana == null ? null : List<dynamic>.from(rencana.map((x) => x.toJson())),
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

class Summaryr {
    Summaryr({
        this.jumr,
    });

    int jumr;

    factory Summaryr.fromJson(Map<String, dynamic> json) => Summaryr(
        jumr: json["jumr"] == null ? null : json["jumr"],
    );

    Map<String, dynamic> toJson() => {
        "jumr": jumr == null ? null : jumr,
    };
}
