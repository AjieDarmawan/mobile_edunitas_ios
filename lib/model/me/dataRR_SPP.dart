// To parse this JSON data, do
//
//     final infoPSPP = infoPSPPFromJson(jsonString);

import 'dart:convert';

InfoPSPP infoPSPPFromJson(String str) => InfoPSPP.fromJson(json.decode(str));

String infoPSPPToJson(InfoPSPP data) => json.encode(data.toJson());

class InfoPSPP {
    InfoPSPP({
        this.summaryr,
        this.rencana,
        this.summarya,
        this.realita,
    });

    Map<String, Summaryr> summaryr;
    Map<String, List<Rencana>> rencana;
    Summarya summarya;
    Realita realita;

    factory InfoPSPP.fromJson(Map<String, dynamic> json) => InfoPSPP(
        summaryr: json["summaryr"] == null ? null : Map.from(json["summaryr"]).map((k, v) => MapEntry<String, Summaryr>(k, Summaryr.fromJson(v))),
        rencana: json["rencana"] == null ? null : Map.from(json["rencana"]).map((k, v) => MapEntry<String, List<Rencana>>(k, List<Rencana>.from(v.map((x) => Rencana.fromJson(x))))),
        summarya: json["summarya"] == null ? null : Summarya.fromJson(json["summarya"]),
        realita: json["realita"] == null ? null : Realita.fromJson(json["realita"]),
    );

    Map<String, dynamic> toJson() => {
        "summaryr": summaryr == null ? null : Map.from(summaryr).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "rencana": rencana == null ? null : Map.from(rencana).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "summarya": summarya == null ? null : summarya.toJson(),
        "realita": realita == null ? null : realita.toJson(),
    };
}

class Realita {
    Realita({
        this.the1,
    });

    List<Rencana> the1;

    factory Realita.fromJson(Map<String, dynamic> json) => Realita(
        the1: json["1"] == null ? null : List<Rencana>.from(json["1"].map((x) => Rencana.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "1": the1 == null ? null : List<dynamic>.from(the1.map((x) => x.toJson())),
    };
}

class Rencana {
    Rencana({
        this.ke,
        this.rp,
        this.tg,
    });

    String ke;
    String rp;
    String tg;

    factory Rencana.fromJson(Map<String, dynamic> json) => Rencana(
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
        this.the1,
    });

    The1 the1;

    factory Summarya.fromJson(Map<String, dynamic> json) => Summarya(
        the1: json["1"] == null ? null : The1.fromJson(json["1"]),
    );

    Map<String, dynamic> toJson() => {
        "1": the1 == null ? null : the1.toJson(),
    };
}

class The1 {
    The1({
        this.juma,
        this.smt,
    });

    int juma;
    int smt;

    factory The1.fromJson(Map<String, dynamic> json) => The1(
        juma: json["juma"] == null ? null : json["juma"],
        smt: json["smt"] == null ? null : json["smt"],
    );

    Map<String, dynamic> toJson() => {
        "juma": juma == null ? null : juma,
        "smt": smt == null ? null : smt,
    };
}

class Summaryr {
    Summaryr({
        this.jumr,
        this.smt,
    });

    int jumr;
    int smt;

    factory Summaryr.fromJson(Map<String, dynamic> json) => Summaryr(
        jumr: json["jumr"] == null ? null : json["jumr"],
        smt: json["smt"] == null ? null : json["smt"],
    );

    Map<String, dynamic> toJson() => {
        "jumr": jumr == null ? null : jumr,
        "smt": smt == null ? null : smt,
    };
}
