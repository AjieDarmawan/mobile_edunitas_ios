// To parse this JSON data, do
//
//     final searchProdiModel = searchProdiModelFromJson(jsonString);

import 'dart:convert';

List<SearchProdiModel> searchProdiModelFromJson(String str) => List<SearchProdiModel>.from(json.decode(str).map((x) => SearchProdiModel.fromJson(x)));

String searchProdiModelToJson(List<SearchProdiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchProdiModel {
    SearchProdiModel({
        this.data,
        this.campusProdi,
    });

    Data data;
    List<String> campusProdi;

    factory SearchProdiModel.fromJson(Map<String, dynamic> json) => SearchProdiModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        campusProdi: json["campusProdi"] == null ? null : List<String>.from(json["campusProdi"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "campusProdi": campusProdi == null ? null : List<dynamic>.from(campusProdi.map((x) => x)),
    };
}

class Data {
    Data({
        this.id,
        this.kode,
        this.nama,
        this.jenjang,
        this.gelar,
        this.karir,
    });

    int id;
    String kode;
    String nama;
    Jenjang jenjang;
    String gelar;
    String karir;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama"] == null ? null : json["nama"],
        jenjang: json["jenjang"] == null ? null : jenjangValues.map[json["jenjang"]],
        gelar: json["gelar"] == null ? null : json["gelar"],
        karir: json["karir"] == null ? null : json["karir"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "kode": kode == null ? null : kode,
        "nama": nama == null ? null : nama,
        "jenjang": jenjang == null ? null : jenjangValues.reverse[jenjang],
        "gelar": gelar == null ? null : gelar,
        "karir": karir == null ? null : karir,
    };
}

enum Jenjang { S1, D3 }

final jenjangValues = EnumValues({
    "D3": Jenjang.D3,
    "S1": Jenjang.S1
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
