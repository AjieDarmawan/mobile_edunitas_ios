// To parse this JSON data, do
//
//     final checkProdiSearchModel = checkProdiSearchModelFromJson(jsonString);

import 'dart:convert';

List<CheckProdiSearchModel> checkProdiSearchModelFromJson(String str) =>
    List<CheckProdiSearchModel>.from(
        json.decode(str).map((x) => CheckProdiSearchModel.fromJson(x)));

String checkProdiSearchModelToJson(List<CheckProdiSearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckProdiSearchModel {
  CheckProdiSearchModel({
    this.kampus,
    this.program,
    this.angkatan,
    this.tahun,
    this.wilayah,
    this.jurusan,
    this.lulusan,
    this.bulanan,
    this.kodeprg,
    this.kodejrs,
    this.kelompok,
    this.formulir,
    this.jaket,
    this.spb,
    this.spp,
    this.kmhsmaba,
    this.perpus,
    this.hereg,
    this.krs,
    this.dpm,
  });

  String kampus;
  String program;
  String angkatan;
  String tahun;
  String wilayah;
  String jurusan;
  String lulusan;
  String bulanan;
  String kodeprg;
  String kodejrs;
  String kelompok;
  String formulir;
  String jaket;
  int spb;
  int spp;
  int kmhsmaba;
  int perpus;
  int hereg;
  int krs;
  int dpm;

  factory CheckProdiSearchModel.fromJson(Map<String, dynamic> json) =>
      CheckProdiSearchModel(
        kampus: json["kampus"] == null ? null : json["kampus"],
        program: json["program"] == null ? null : json["program"],
        angkatan: json["angkatan"] == null ? null : json["angkatan"],
        tahun: json["tahun"] == null ? null : json["tahun"],
        wilayah: json["wilayah"] == null ? null : json["wilayah"],
        jurusan: json["jurusan"] == null ? null : json["jurusan"],
        lulusan: json["lulusan"] == null ? null : json["lulusan"],
        bulanan: json["bulanan"] == null ? null : json["bulanan"],
        kodeprg: json["kodeprg"] == null ? null : json["kodeprg"],
        kodejrs: json["kodejrs"] == null ? null : json["kodejrs"],
        kelompok: json["kelompok"] == null ? null : json["kelompok"],
        formulir: json["formulir"] == null ? null : json["formulir"],
        jaket: json["jaket"] == null ? null : json["jaket"],
        spb: json["spb"] == null ? null : json["spb"],
        spp: json["spp"] == null ? null : json["spp"],
        kmhsmaba: json["kmhsmaba"] == null ? null : json["kmhsmaba"],
        perpus: json["perpus"] == null ? null : json["perpus"],
        hereg: json["hereg"] == null ? null : json["hereg"],
        krs: json["krs"] == null ? null : json["krs"],
        dpm: json["dpm"] == null ? null : json["dpm"],
      );

  Map<String, dynamic> toJson() => {
        "kampus": kampus == null ? null : kampus,
        "program": program == null ? null : program,
        "angkatan": angkatan == null ? null : angkatan,
        "tahun": tahun == null ? null : tahun,
        "wilayah": wilayah == null ? null : wilayah,
        "jurusan": jurusan == null ? null : jurusan,
        "lulusan": lulusan == null ? null : lulusan,
        "bulanan": bulanan == null ? null : bulanan,
        "kodeprg": kodeprg == null ? null : kodeprg,
        "kodejrs": kodejrs == null ? null : kodejrs,
        "kelompok": kelompok == null ? null : kelompok,
        "formulir": formulir == null ? null : formulir,
        "jaket": jaket == null ? null : jaket,
        "spb": spb == null ? null : spb,
        "spp": spp == null ? null : spp,
        "kmhsmaba": kmhsmaba == null ? null : kmhsmaba,
        "perpus": perpus == null ? null : perpus,
        "hereg": hereg == null ? null : hereg,
        "krs": krs == null ? null : krs,
        "dpm": dpm == null ? null : dpm,
      };
}
