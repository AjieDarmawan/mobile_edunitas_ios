// To parse this JSON data, do
//
//     final showInfotambahanModel = showInfotambahanModelFromJson(jsonString);

import 'dart:convert';

List<ShowInfotambahanModel> showInfotambahanModelFromJson(String str) => List<ShowInfotambahanModel>.from(json.decode(str).map((x) => ShowInfotambahanModel.fromJson(x)));

String showInfotambahanModelToJson(List<ShowInfotambahanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowInfotambahanModel {
    ShowInfotambahanModel({
        this.id,
        this.wilayah,
        this.penghasilan,
        this.deskripsi,
        this.keycode,
        this.crdt,
        this.mddt,
    });

    int id;
    String wilayah;
    int penghasilan;
    String deskripsi;
    String keycode;
    DateTime crdt;
    dynamic mddt;

    factory ShowInfotambahanModel.fromJson(Map<String, dynamic> json) => ShowInfotambahanModel(
        id: json["id"] == null ? null : json["id"],
        wilayah: json["wilayah"] == null ? null : json["wilayah"],
        penghasilan: json["penghasilan"] == null ? null : json["penghasilan"],
        deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
        keycode: json["keycode"] == null ? null : json["keycode"],
        crdt: json["crdt"] == null ? null : DateTime.parse(json["crdt"]),
        mddt: json["mddt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "wilayah": wilayah == null ? null : wilayah,
        "penghasilan": penghasilan == null ? null : penghasilan,
        "deskripsi": deskripsi == null ? null : deskripsi,
        "keycode": keycode == null ? null : keycode,
        "crdt": crdt == null ? null : crdt.toIso8601String(),
        "mddt": mddt,
    };
}
