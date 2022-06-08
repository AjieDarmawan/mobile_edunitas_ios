// To parse this JSON data, do
//
//     final angsuranSpbModel = angsuranSpbModelFromJson(jsonString);

import 'dart:convert';

List<AngsuranMasterModel> angsuranSpbModelFromJson(String str) => List<AngsuranMasterModel>.from(
    json.decode(str).map((x) => AngsuranMasterModel.fromJson(x)));

String angsuranSpbModelToJson(List<AngsuranMasterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AngsuranMasterModel {
    AngsuranMasterModel({
        this.angsuranSpb,
    });

    String angsuranSpb;

    factory AngsuranMasterModel.fromJson(Map<String, dynamic> json) => AngsuranMasterModel(
        angsuranSpb: json["angsuran_spb"] == null ? null : json["angsuran_spb"],
    );

    Map<String, dynamic> toJson() => {
        "angsuran_spb": angsuranSpb == null ? null : angsuranSpb,
    };
}
