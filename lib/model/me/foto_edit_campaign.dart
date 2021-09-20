import 'dart:convert';

FotoEditCampaignModel detailFotoEditCampaignModelFromJson(String str) => FotoEditCampaignModel.fromJson(json.decode(str));

String detailFotoEditCampaignModelToJson(FotoEditCampaignModel data) => json.encode(data.toJson());

class FotoEditCampaignModel{

  FotoEditCampaignModel({
    this.ktp,
    this.pict,
  });

  String ktp, pict;

  factory FotoEditCampaignModel.fromJson(Map<String, dynamic> json) => FotoEditCampaignModel(
    ktp: json["ktp"] == null ? null : json["ktp"],
    pict: json["pict"] == null ? null : json["pict"],
  );

  Map<String, dynamic> toJson() => {
    "ktp": ktp == null ? null : ktp,
    "pict": pict == null ? null : pict,
  };

  static List<FotoEditCampaignModel> parseList(List<dynamic> list) {
    return list.map((i) => FotoEditCampaignModel.fromJson(i)).toList();
  }
}