// To parse this JSON data, do
//
//     final listEduModel = listEduModelFromJson(jsonString);

import 'dart:convert';

List<ListEduModel> listEduModelFromJson(String str) => List<ListEduModel>.from(
    json.decode(str).map((x) => ListEduModel.fromJson(x)));

String listEduModelToJson(List<ListEduModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListEduModel {
  ListEduModel({
    this.id,
    this.cid,
    this.title,
    this.sub_konten,
    this.konten,
    this.kategori,
    this.caradapat,
    this.poinreedem,//ll
    this.hingga,
    this.link,
    this.crdt,
    this.sumber
  });

  int id;
  String cid;
  String title;
  String konten;
  String kategori;
  String sub_konten;
  String caradapat;
  String poinreedem;
  String link;
   String hingga;
  String crdt;
  String sumber;


  factory ListEduModel.fromJson(Map<String, dynamic> json) => ListEduModel(
        id: json["id"] == null ? null : json["id"],
        cid: json["cid"] == null ? null : json["cid"],
        title: json["title"] == null ? null : json["title"],
         sub_konten: json["sub_konten"] == null ? null : json["sub_konten"],
        konten: json["konten"] == null ? null : json["konten"],
        kategori: json["kategori"] == null ? null : json["kategori"],
        caradapat: json["caradapat"] == null ? null : json["caradapat"],
        poinreedem: json["poinreedem"] == null ? null : json["poinreedem"],
        hingga: json["hingga"] == null ? null : json["hingga"],
         link: json["link"] == null ? null : json["link"],
        crdt: json["crdt"] == null ? null : json["crdt"],
        sumber: json["sumber"] == null ? null : json["sumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cid": cid == null ? null : cid,
        "title": title == null ? null : title,
        "konten": konten == null ? null : konten,
        "caradapat": caradapat == null ? null : caradapat,
        "konten": konten == null ? null : konten,
         "sub_konten": sub_konten == null ? null : sub_konten,
        "poinreedem": poinreedem == null ? null : poinreedem,
        "hingga": hingga == null ? null : hingga,
        "link": link == null ? null : link,
        "crdt": crdt == null ? null : crdt,
        "sumber": sumber == null ? null : sumber,
        
      };
}
