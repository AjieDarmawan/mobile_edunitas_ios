// To parse this JSON data, do
//
//     final angsuranSpbAngsuranModel = angsuranSpbAngsuranModelFromJson(jsonString);

import 'dart:convert';

List<AngsuranSpbAngsuranModel> angsuranSpbAngsuranModelFromJson(String str) => List<AngsuranSpbAngsuranModel>.from(json.decode(str).map((x) => AngsuranSpbAngsuranModel.fromJson(x)));

String angsuranSpbAngsuranModelToJson(List<AngsuranSpbAngsuranModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AngsuranSpbAngsuranModel {
    AngsuranSpbAngsuranModel({
        this.waktuAngsuran,
        this.biayaAngsuran,
    });

    String waktuAngsuran;
    int biayaAngsuran;

    factory AngsuranSpbAngsuranModel.fromJson(Map<String, dynamic> json) => AngsuranSpbAngsuranModel(
        waktuAngsuran: json["waktu_angsuran"] == null ? null : json["waktu_angsuran"],
        biayaAngsuran: json["biaya_angsuran"] == null ? null : json["biaya_angsuran"],
    );

    Map<String, dynamic> toJson() => {
        "waktu_angsuran": waktuAngsuran == null ? null : waktuAngsuran,
        "biaya_angsuran": biayaAngsuran == null ? null : biayaAngsuran,
    };
}
