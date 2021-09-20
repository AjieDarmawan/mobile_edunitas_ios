// To parse this JSON data, do
//
//     final infoPsppJumlahSemesterRencana = infoPsppJumlahSemesterRencanaFromJson(jsonString);

import 'dart:convert';

List<InfoPsppJumlahSemesterRencana> infoPsppJumlahSemesterRencanaFromJson(String str) => List<InfoPsppJumlahSemesterRencana>.from(json.decode(str).map((x) => InfoPsppJumlahSemesterRencana.fromJson(x)));

String infoPsppJumlahSemesterRencanaToJson(List<InfoPsppJumlahSemesterRencana> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoPsppJumlahSemesterRencana {
    InfoPsppJumlahSemesterRencana({
        this.jumr,
        this.smt,
    });

    int jumr;
    int smt;

    factory InfoPsppJumlahSemesterRencana.fromJson(Map<String, dynamic> json) => InfoPsppJumlahSemesterRencana(
        jumr: json["jumr"] == null ? null : json["jumr"],
        smt: json["smt"] == null ? null : json["smt"],
    );

    Map<String, dynamic> toJson() => {
        "jumr": jumr == null ? null : jumr,
        "smt": smt == null ? null : smt,
    };
}
