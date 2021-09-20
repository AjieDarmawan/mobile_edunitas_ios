// To parse this JSON data, do
//
//     final infoPsppR = infoPsppRFromJson(jsonString);

import 'dart:convert';

List<InfoPsppR> infoPsppRFromJson(String str) => List<InfoPsppR>.from(json.decode(str).map((x) => InfoPsppR.fromJson(x)));

String infoPsppRToJson(List<InfoPsppR> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoPsppR {
    InfoPsppR({
        this.ke,
        this.rp,
        this.tg,
    });

    String ke;
    String rp;
    String tg;

    factory InfoPsppR.fromJson(Map<String, dynamic> json) => InfoPsppR(
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
