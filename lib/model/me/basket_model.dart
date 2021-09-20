// To parse this JSON data, do
//
//     final basketModel = basketModelFromJson(jsonString);

import 'dart:convert';

BasketModel basketModelFromJson(String str) => BasketModel.fromJson(json.decode(str));

String basketModelToJson(BasketModel data) => json.encode(data.toJson());

class BasketModel {
    BasketModel({
        this.data,
        this.total,
    });

    List<Datum> data;
    int total;

    factory BasketModel.fromJson(Map<String, dynamic> json) => BasketModel(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total == null ? null : total,
    };
}

class Datum {
    Datum({
        this.nama,
        this.singkatan,
        this.nominal,
        this.total,
    });

    String nama;
    String singkatan;
    int nominal;
    int total;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nama: json["nama"] == null ? null : json["nama"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        nominal: json["nominal"] == null ? null : json["nominal"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama == null ? null : nama,
        "singkatan": singkatan == null ? null : singkatan,
        "nominal": nominal == null ? null : nominal,
        "total": total == null ? null : total,
    };
}
