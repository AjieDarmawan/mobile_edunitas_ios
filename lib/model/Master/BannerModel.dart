// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  BannerModel({
    this.id,
    this.metaTitle,
    this.file,
  });

  int id;
  String metaTitle;
  String file;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        metaTitle: json["meta_title"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meta_title": metaTitle,
        "file": file,
      };
}
