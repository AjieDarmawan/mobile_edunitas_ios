// To parse this JSON data, do
//
//     final smbModel = smbModelFromJson(jsonString);

import 'dart:convert';

List<SmbModel> smbModelFromJson(String str) => List<SmbModel>.from(json.decode(str).map((x) => SmbModel.fromJson(x)));

String smbModelToJson(List<SmbModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SmbModel {
    SmbModel({
        this.name,
        this.initial,
    });

    String name;
    String initial;

    factory SmbModel.fromJson(Map<String, dynamic> json) => SmbModel(
        name: json["name"] == null ? null : json["name"],
        initial: json["initial"] == null ? null : json["initial"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "initial": initial == null ? null : initial,
    };
}
