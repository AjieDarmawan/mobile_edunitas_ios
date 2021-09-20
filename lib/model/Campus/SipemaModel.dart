// To parse this JSON data, do
//
//     final sipemaModel = sipemaModelFromJson(jsonString);

import 'dart:convert';

SipemaModel sipemaModelFromJson(String str) =>
    SipemaModel.fromJson(json.decode(str));

String sipemaModelToJson(SipemaModel data) => json.encode(data.toJson());

class SipemaModel {
  SipemaModel({
    this.status,
    this.message,
    this.sipema,
  });

  int status;
  String message;
  Map<String, Map<String, Sipema>> sipema;

  factory SipemaModel.fromJson(Map<String, dynamic> json) => SipemaModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        sipema: json["sipema"] == null
            ? null
            : Map.from(json["sipema"]).map((k, v) =>
                MapEntry<String, Map<String, Sipema>>(
                    k,
                    Map.from(v).map((k, v) =>
                        MapEntry<String, Sipema>(k, Sipema.fromJson(v))))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "sipema": sipema == null
            ? null
            : Map.from(sipema).map((k, v) => MapEntry<String, dynamic>(
                k,
                Map.from(v)
                    .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
      };
}

class Sipema {
  Sipema({
    this.detail,
    this.itembayar,
    this.angsur,
    this.bulanan,
  });

  Detail detail;
  Itembayar itembayar;
  Angsur angsur;
  String bulanan;

  factory Sipema.fromJson(Map<String, dynamic> json) => Sipema(
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
        itembayar: json["itembayar"] == null
            ? null
            : Itembayar.fromJson(json["itembayar"]),
        angsur: json["angsur"] == null ? null : Angsur.fromJson(json["angsur"]),
        bulanan: json["bulanan"] == null ? null : json["bulanan"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail.toJson(),
        "itembayar": itembayar == null ? null : itembayar.toJson(),
        "angsur": angsur == null ? null : angsur.toJson(),
        "bulanan": bulanan == null ? null : bulanan,
      };
}

class Angsur {
  Angsur({
    this.spb,
    this.spp,
  });

  Spb spb;
  Spp spp;

  factory Angsur.fromJson(Map<String, dynamic> json) => Angsur(
        spb: json["spb"] == null ? null : Spb.fromJson(json["spb"]),
        spp: json["spp"] == null ? null : Spp.fromJson(json["spp"]),
      );

  Map<String, dynamic> toJson() => {
        "spb": spb == null ? null : spb.toJson(),
        "spp": spp == null ? null : spp.toJson(),
      };
}

class Spb {
  Spb({
    this.angs36,
    this.angs12,
    this.angs7,
    this.angs4,
    this.angs1,
  });

  Map<String, int> angs36;
  Map<String, int> angs12;
  Angs7 angs7;
  Angs4 angs4;
  Angs1 angs1;

  factory Spb.fromJson(Map<String, dynamic> json) => Spb(
        angs36: json["angs36"] == null
            ? null
            : Map.from(json["angs36"])
                .map((k, v) => MapEntry<String, int>(k, v)),
        angs12: json["angs12"] == null
            ? null
            : Map.from(json["angs12"])
                .map((k, v) => MapEntry<String, int>(k, v)),
        angs7: json["angs7"] == null ? null : Angs7.fromJson(json["angs7"]),
        angs4: json["angs4"] == null ? null : Angs4.fromJson(json["angs4"]),
        angs1: json["angs1"] == null ? null : Angs1.fromJson(json["angs1"]),
      );

  Map<String, dynamic> toJson() => {
        "angs36": angs36 == null
            ? null
            : Map.from(angs36).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "angs12": angs12 == null
            ? null
            : Map.from(angs12).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "angs7": angs7 == null ? null : angs7.toJson(),
        "angs4": angs4 == null ? null : angs4.toJson(),
        "angs1": angs1 == null ? null : angs1.toJson(),
      };
}

class Angs1 {
  Angs1({
    this.angs1,
  });

  int angs1;

  factory Angs1.fromJson(Map<String, dynamic> json) => Angs1(
        angs1: json["angs1"] == null ? null : json["angs1"],
      );

  Map<String, dynamic> toJson() => {
        "angs1": angs1 == null ? null : angs1,
      };
}

class Angs4 {
  Angs4({
    this.angs18,
    this.angs13,
    this.angs7,
    this.angs1,
  });

  int angs18;
  int angs13;
  int angs7;
  int angs1;

  factory Angs4.fromJson(Map<String, dynamic> json) => Angs4(
        angs18: json["angs18"] == null ? null : json["angs18"],
        angs13: json["angs13"] == null ? null : json["angs13"],
        angs7: json["angs7"] == null ? null : json["angs7"],
        angs1: json["angs1"] == null ? null : json["angs1"],
      );

  Map<String, dynamic> toJson() => {
        "angs18": angs18 == null ? null : angs18,
        "angs13": angs13 == null ? null : angs13,
        "angs7": angs7 == null ? null : angs7,
        "angs1": angs1 == null ? null : angs1,
      };
}

class Angs7 {
  Angs7({
    this.angs18,
    this.angs16,
    this.angs13,
    this.angs10,
    this.angs7,
    this.angs4,
    this.angs1,
  });

  int angs18;
  int angs16;
  int angs13;
  int angs10;
  int angs7;
  int angs4;
  int angs1;

  factory Angs7.fromJson(Map<String, dynamic> json) => Angs7(
        angs18: json["angs18"] == null ? null : json["angs18"],
        angs16: json["angs16"] == null ? null : json["angs16"],
        angs13: json["angs13"] == null ? null : json["angs13"],
        angs10: json["angs10"] == null ? null : json["angs10"],
        angs7: json["angs7"] == null ? null : json["angs7"],
        angs4: json["angs4"] == null ? null : json["angs4"],
        angs1: json["angs1"] == null ? null : json["angs1"],
      );

  Map<String, dynamic> toJson() => {
        "angs18": angs18 == null ? null : angs18,
        "angs16": angs16 == null ? null : angs16,
        "angs13": angs13 == null ? null : angs13,
        "angs10": angs10 == null ? null : angs10,
        "angs7": angs7 == null ? null : angs7,
        "angs4": angs4 == null ? null : angs4,
        "angs1": angs1 == null ? null : angs1,
      };
}

class Spp {
  Spp({
    this.angs6,
    this.angs5,
    this.angs4,
    this.angs3,
    this.angs1,
  });

  Angs angs6;
  Angs angs5;
  Angs angs4;
  Angs3 angs3;
  Angs1 angs1;

  factory Spp.fromJson(Map<String, dynamic> json) => Spp(
        angs6: json["angs6"] == null ? null : Angs.fromJson(json["angs6"]),
        angs5: json["angs5"] == null ? null : Angs.fromJson(json["angs5"]),
        angs4: json["angs4"] == null ? null : Angs.fromJson(json["angs4"]),
        angs3: json["angs3"] == null ? null : Angs3.fromJson(json["angs3"]),
        angs1: json["angs1"] == null ? null : Angs1.fromJson(json["angs1"]),
      );

  Map<String, dynamic> toJson() => {
        "angs6": angs6 == null ? null : angs6.toJson(),
        "angs5": angs5 == null ? null : angs5.toJson(),
        "angs4": angs4 == null ? null : angs4.toJson(),
        "angs3": angs3 == null ? null : angs3.toJson(),
        "angs1": angs1 == null ? null : angs1.toJson(),
      };
}

class Angs3 {
  Angs3({
    this.angs5,
    this.angs3,
    this.angs1,
  });

  int angs5;
  int angs3;
  int angs1;

  factory Angs3.fromJson(Map<String, dynamic> json) => Angs3(
        angs5: json["angs5"] == null ? null : json["angs5"],
        angs3: json["angs3"] == null ? null : json["angs3"],
        angs1: json["angs1"] == null ? null : json["angs1"],
      );

  Map<String, dynamic> toJson() => {
        "angs5": angs5 == null ? null : angs5,
        "angs3": angs3 == null ? null : angs3,
        "angs1": angs1 == null ? null : angs1,
      };
}

class Angs {
  Angs({
    this.angs5,
    this.angs4,
    this.angs2,
    this.angs1,
    this.angs3,
    this.angs6,
  });

  int angs5;
  int angs4;
  int angs2;
  int angs1;
  int angs3;
  int angs6;

  factory Angs.fromJson(Map<String, dynamic> json) => Angs(
        angs5: json["angs5"] == null ? null : json["angs5"],
        angs4: json["angs4"] == null ? null : json["angs4"],
        angs2: json["angs2"] == null ? null : json["angs2"],
        angs1: json["angs1"] == null ? null : json["angs1"],
        angs3: json["angs3"] == null ? null : json["angs3"],
        angs6: json["angs6"] == null ? null : json["angs6"],
      );

  Map<String, dynamic> toJson() => {
        "angs5": angs5 == null ? null : angs5,
        "angs4": angs4 == null ? null : angs4,
        "angs2": angs2 == null ? null : angs2,
        "angs1": angs1 == null ? null : angs1,
        "angs3": angs3 == null ? null : angs3,
        "angs6": angs6 == null ? null : angs6,
      };
}

class Detail {
  Detail({
    this.kampus,
    this.program,
    this.angkatan,
    this.tahun,
    this.jurusan,
    this.lulusan,
    this.wilayah,
    this.bulanan,
    this.kodeprg,
    this.kodejrs,
    this.kelompok,
    this.hereg,
  });

  String kampus;
  String program;
  String angkatan;
  String tahun;
  String jurusan;
  String lulusan;
  String wilayah;
  String bulanan;
  String kodeprg;
  String kodejrs;
  String kelompok;
  int hereg;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        kampus: json["kampus"] == null ? null : json["kampus"],
        program: json["program"] == null ? null : json["program"],
        angkatan: json["angkatan"] == null ? null : json["angkatan"],
        tahun: json["tahun"] == null ? null : json["tahun"],
        jurusan: json["jurusan"] == null ? null : json["jurusan"],
        lulusan: json["lulusan"] == null ? null : json["lulusan"],
        wilayah: json["wilayah"] == null ? null : json["wilayah"],
        bulanan: json["bulanan"] == null ? null : json["bulanan"],
        kodeprg: json["kodeprg"] == null ? null : json["kodeprg"],
        kodejrs: json["kodejrs"] == null ? null : json["kodejrs"],
        kelompok: json["kelompok"] == null ? null : json["kelompok"],
        hereg: json["hereg"] == null ? null : json["hereg"],
      );

  Map<String, dynamic> toJson() => {
        "kampus": kampus == null ? null : kampus,
        "program": program == null ? null : program,
        "jurusan": jurusan == null ? null : jurusan,
        "lulusan": lulusan == null ? null : lulusan,
        "bulanan": bulanan == null ? null : bulanan,
        "kodeprg": kodeprg == null ? null : kodeprg,
        "kodejrs": kodejrs == null ? null : kodejrs,
        "kelompok": kelompok == null ? null : kelompok,
        "hereg": hereg == null ? null : hereg,
      };
}

class Itembayar {
  Itembayar({
    this.formulir,
    this.jaket,
    this.spb,
    this.spp,
    this.kmhsmaba,
    this.perpus,
    this.krs,
    this.dpm,
    this.empty,
    this.itembayar,
  });

  String formulir;
  String jaket;
  int spb;
  int spp;
  int kmhsmaba;
  int perpus;
  int empty;
  int krs;
  int dpm;
  int itembayar;

  factory Itembayar.fromJson(Map<String, dynamic> json) => Itembayar(
        formulir: json["formulir"] == null ? null : json["formulir"],
        jaket: json["jaket"] == null ? null : json["jaket"],
        spb: json["spb"] == null ? null : json["spb"],
        spp: json["spp"] == null ? null : json["spp"],
        kmhsmaba: json["kmhsmaba"] == null ? null : json["kmhsmaba"],
        perpus: json["perpus"] == null ? null : json["perpus"],
        krs: json["krs"] == null ? null : json["krs"],
        dpm: json["dpm"] == null ? null : json["dpm"],
        empty: json[""] == null ? null : json[""],
        itembayar: json[" ()"] == null ? null : json[" ()"],
      );

  Map<String, dynamic> toJson() => {
        "formulir": formulir == null ? null : formulir,
        "jaket": jaket == null ? null : jaket,
        "spb": spb == null ? null : spb,
        "spp": spp == null ? null : spp,
        "kmhsmaba": kmhsmaba == null ? null : kmhsmaba,
        "perpus": perpus == null ? null : perpus,
        "krs": krs == null ? null : krs,
        "dpm": dpm == null ? null : dpm,
        "": empty == null ? null : empty,
        " ()": itembayar == null ? null : itembayar,
      };
}
