import 'dart:convert';

DataBankModel detailDataBankModelFromJson(String str) => DataBankModel.fromJson(json.decode(str));

String detailDataBankModelToJson(DataBankModel data) => json.encode(data.toJson());

class DataBankModel{

  DataBankModel({
    this.id,
    this.code,
    this.name,
    this.alias,
    this.crdt,
    this.crur,
    this.mddt,
    this.mdur,
  });

  int id;
  String code, name, alias, crdt, crur, mddt, mdur;

  factory DataBankModel.fromJson(Map<String, dynamic> json) => DataBankModel(
    id: json["id"] == null ? null : json["id"],
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    alias: json["alias"] == null ? null : json["alias"],
    mddt: json["mddt"] == null ? null : json["mddt"],
    mdur: json["mdur"] == null ? null : json["mdur"],
    crur: json["crur"] == null ? null : json["crur"],
    crdt: json["crdt"] == null ? null : json["crdt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : code,
    "name": code == null ? null : code,
    "alias": code == null ? null : code,
    "mddt": code == null ? null : code,
    "mdur": code == null ? null : code,
    "crur": code == null ? null : code,
    "crdt": crdt == null ? null : crdt,
  };

  static List<DataBankModel> parseList(List<dynamic> list) {
    return list.map((i) => DataBankModel.fromJson(i)).toList();
  }
}