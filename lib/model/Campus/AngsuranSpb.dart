// To parse this JSON data, do
//
//     final angsuranSpbModel = angsuranSpbModelFromJson(jsonString);

import 'dart:convert';

List<AngsuranSpbModel> angsuranSpbModelFromJson(String str) => List<AngsuranSpbModel>.from(
    json.decode(str).map((x) => AngsuranSpbModel.fromJson(x)));

String angsuranSpbModelToJson(List<AngsuranSpbModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AngsuranSpbModel {
    AngsuranSpbModel({
        this.angsuranSpb,
    });

    String angsuranSpb;

    factory AngsuranSpbModel.fromJson(Map<String, dynamic> json) => AngsuranSpbModel(
        angsuranSpb: json["angsuran_spb"] == null ? null : json["angsuran_spb"],
    );

    Map<String, dynamic> toJson() => {
        "angsuran_spb": angsuranSpb == null ? null : angsuranSpb,
    };
}
