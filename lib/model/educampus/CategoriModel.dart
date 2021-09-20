// To parse this JSON data, do
//
//     final categoriModel = categoriModelFromJson(jsonString);

import 'dart:convert';

List<CategoriModel> categoriModelFromJson(String str) => List<CategoriModel>.from(json.decode(str).map((x) => CategoriModel.fromJson(x)));

String categoriModelToJson(List<CategoriModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriModel {
    CategoriModel({
        this.kategori,
    });

    String kategori;

    factory CategoriModel.fromJson(Map<String, dynamic> json) => CategoriModel(
        kategori: json["kategori"] == null ? null : json["kategori"],
    );

    Map<String, dynamic> toJson() => {
        "kategori": kategori == null ? null : kategori,
    };
}
