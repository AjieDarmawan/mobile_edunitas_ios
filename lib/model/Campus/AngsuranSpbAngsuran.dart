// To parse this JSON data, do
//
//     final angsuranSpbAngsuranModel = angsuranSpbAngsuranModelFromJson(jsonString);

import 'dart:convert';

List<AngsuranModel> angsuranSpbAngsuranModelFromJson(String str) => List<AngsuranModel>.from(json.decode(str).map((x) => AngsuranModel.fromJson(x)));

String angsuranSpbAngsuranModelToJson(List<AngsuranModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AngsuranModel {
    AngsuranModel({
        this.waktuAngsuran,
        this.biayaAngsuran,
    });

    String waktuAngsuran;
    int biayaAngsuran;

    factory AngsuranModel.fromJson(Map<String, dynamic> json) => AngsuranModel(
        waktuAngsuran: json["waktu_angsuran"] == null ? null : json["waktu_angsuran"],
        biayaAngsuran: json["biaya_angsuran"] == null ? null : json["biaya_angsuran"],
    );

    Map<String, dynamic> toJson() => {
        "waktu_angsuran": waktuAngsuran == null ? null : waktuAngsuran,
        "biaya_angsuran": biayaAngsuran == null ? null : biayaAngsuran,
    };
}
