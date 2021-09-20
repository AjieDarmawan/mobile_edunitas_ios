import 'dart:convert';

CheckRekeningAgentModel detailCheckRekeningAgentFromJson(String str) => CheckRekeningAgentModel.fromJson(json.decode(str));

String detailCheckRekeningAgentToJson(CheckRekeningAgentModel data) => json.encode(data.toJson());

class CheckRekeningAgentModel{
  CheckRekeningAgentModel({
    this.cid,
    this.kodebank,
    this.norekening,
    this.namarekening,
    this.label_bank,
    this.ccid,
    this.imgbuku,
  });

  String cid;
  String kodebank;
  String norekening;
  String namarekening;
  String label_bank;
  String ccid;
  String imgbuku;

  factory CheckRekeningAgentModel.fromJson(Map<String, dynamic> json) => CheckRekeningAgentModel(
    cid: json["cid"] == null ? null : json["cid"],
    kodebank: json["kodebank"] == null ? null : json["kodebank"],
    norekening: json["norekening"] == null ? null : json["norekening"],
    namarekening: json["namarekening"] == null ? null : json["namarekening"],
    label_bank: json["label_bank"] == null ? null : json["label_bank"],
    ccid: json["ccid"] == null ? null : json["ccid"],
    imgbuku: json["imgbuku"] == null ? null : json["imgbuku"],
  );

  Map<String, dynamic> toJson() => {
    "cid": cid == null ? null : cid,
    "kodebank": kodebank == null ? null : kodebank,
    "norekening": norekening == null ? null : norekening,
    "namarekening": namarekening == null ? null : namarekening,
    "label_bank": label_bank == null ? null : label_bank,
    "ccid": ccid == null ? null : ccid,
    "imgbuku": imgbuku == null ? null : imgbuku,
  };
}