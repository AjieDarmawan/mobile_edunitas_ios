// To parse this JSON data, do
//
//     final sipemaWebModel = sipemaWebModelFromJson(jsonString);

import 'dart:convert';

SipemaWebModel sipemaWebModelFromJson(String str) =>
    SipemaWebModel.fromJson(json.decode(str));

String sipemaWebModelToJson(SipemaWebModel data) => json.encode(data.toJson());

class SipemaWebModel {
  SipemaWebModel({
    this.status,
    this.message,
    this.sipema,
  });

  int status;
  String message;
  List<Sipema> sipema;

  factory SipemaWebModel.fromJson(Map<String, dynamic> json) => SipemaWebModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        sipema: json["sipema"] == null
            ? null
            : List<Sipema>.from(json["sipema"].map((x) => Sipema.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "sipema": sipema == null
            ? null
            : List<dynamic>.from(sipema.map((x) => x.toJson())),
      };
}

class Sipema {
  Sipema({
    this.kode,
    this.jenjang,
    this.label,
    this.program,
    this.kelompok,
  });

  String kode;
  String jenjang;
  String label;
  String program;
  String kelompok;

  factory Sipema.fromJson(Map<String, dynamic> json) => Sipema(
        kode: json["kode"] == null ? null : json["kode"],
        jenjang: json["jenjang"] == null ? null : json["jenjang"],
        label: json["label"] == null ? null : json["label"],
        program: json["program"] == null ? null : json["program"],
        kelompok: json["kelompok"] == null ? null : json["kelompok"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode == null ? null : kode,
        "jenjang": jenjang == null ? null : jenjang,
        "label": label == null ? null : label,
        "program": program == null ? null : program,
        "kelompok": kelompok == null ? null : kelompok,
      };
}
