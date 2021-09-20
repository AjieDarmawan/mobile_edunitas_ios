// To parse this JSON data, do
//
//     final showBahasaModel = showBahasaModelFromJson(jsonString);

import 'dart:convert';

List<ShowBahasaModel> showBahasaModelFromJson(String str) => List<ShowBahasaModel>.from(json.decode(str).map((x) => ShowBahasaModel.fromJson(x)));

String showBahasaModelToJson(List<ShowBahasaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowBahasaModel {
    ShowBahasaModel({
        this.id,
        this.bahasa,
        this.lisan,
        this.tulisan,
        this.keycode,
        this.crdt,
        this.mddt,
        this.tulisan_kode,
        this.lisan_kode,
        this.bahasa_kode,
    });

    int id;
    String bahasa;
    String lisan;
    String tulisan;
    String keycode;
     String crdt;
    String mddt;
    String tulisan_kode;
    String lisan_kode;
    String bahasa_kode;

    factory ShowBahasaModel.fromJson(Map<String, dynamic> json) => ShowBahasaModel(
        id: json["id"] == null ? null : json["id"],
        bahasa: json["bahasa"] == null ? null : json["bahasa"],
        lisan: json["lisan"] == null ? null : json["lisan"],
        tulisan: json["tulisan"] == null ? null : json["tulisan"],
        keycode: json["keycode"] == null ? null : json["keycode"],
        crdt: json["crdt"] == null ? null : json["crdt"],
        mddt: json["mddt"] == null ? null : json["mddt"],

          bahasa_kode: json["bahasa_kode"] == null ? null : json["bahasa_kode"],
            lisan_kode: json["lisan_kode"] == null ? null : json["lisan_kode"],
              tulisan_kode: json["tulisan_kode"] == null ? null : json["tulisan_kode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "bahasa": bahasa == null ? null : bahasa,
        "lisan": lisan == null ? null : lisan,
        "tulisan": tulisan == null ? null : tulisan,
        "keycode": keycode == null ? null : keycode,
        "crdt": crdt == null ? null : crdt,
        "mddt": mddt == null ? null : mddt,
         "bahasa_kode": bahasa_kode == null ? null : bahasa_kode,
          "lisan_kode": lisan_kode == null ? null : lisan_kode,
           "tulisan_kode": tulisan_kode == null ? null : tulisan_kode,
    };
}
