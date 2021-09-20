// To parse this JSON data, do
//
//     final showKemampuanModel = showKemampuanModelFromJson(jsonString);

import 'dart:convert';

List<ShowKemampuanModel> showKemampuanModelFromJson(String str) =>
    List<ShowKemampuanModel>.from(
        json.decode(str).map((x) => ShowKemampuanModel.fromJson(x)));

String showKemampuanModelToJson(List<ShowKemampuanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowKemampuanModel {
  ShowKemampuanModel({
    this.id,
    this.kemampuan,
    this.tingkatan,
    this.keycode,
    this.crdt,
    this.mddt,
    this.kemampuan_kode,
    this.tingkatan_kode,
  });

  int id;
  String kemampuan;
  String tingkatan;
  String keycode;
  String crdt;
  String mddt;
  String kemampuan_kode;
  String tingkatan_kode;

  factory ShowKemampuanModel.fromJson(Map<String, dynamic> json) =>
      ShowKemampuanModel(
        id: json["id"] == null ? null : json["id"],
        kemampuan: json["kemampuan"] == null ? null : json["kemampuan"],
        tingkatan: json["tingkatan"] == null ? null : json["tingkatan"],
        keycode: json["keycode"] == null ? null : json["keycode"],
        crdt: json["crdt"] == null ? null : json["crdt"],
        mddt: json["mddt"] == null ? null : json["mddt"],
        kemampuan_kode:
            json["kemampuan_kode"] == null ? null : json["kemampuan_kode"],
        tingkatan_kode:
            json["tingkatan_kode"] == null ? null : json["tingkatan_kode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "kemampuan": kemampuan == null ? null : kemampuan,
        "tingkatan": tingkatan == null ? null : tingkatan,
        "keycode": keycode == null ? null : keycode,
        "crdt": crdt == null ? null : crdt,
        "mddt": mddt == null ? null : mddt,
        "kemampuan_kode": kemampuan_kode == null ? null : kemampuan_kode,
        "tingkatan_kode": tingkatan_kode == null ? null : tingkatan_kode,
      };
}
