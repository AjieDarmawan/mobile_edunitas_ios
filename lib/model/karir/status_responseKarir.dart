// To parse this JSON data, do
//
//     final statusResponseKarirModel = statusResponseKarirModelFromJson(jsonString);

import 'dart:convert';

StatusResponseKarirModel statusResponseKarirModelFromJson(String str) => StatusResponseKarirModel.fromJson(json.decode(str));

String statusResponseKarirModelToJson(StatusResponseKarirModel data) => json.encode(data.toJson());

class StatusResponseKarirModel {
    StatusResponseKarirModel({
        this.kode,
        this.message,
        this.listdata,
    });

    String kode;
    String message;
    Listdata listdata;

    factory StatusResponseKarirModel.fromJson(Map<String, dynamic> json) => StatusResponseKarirModel(
        kode: json["kode"] == null ? null : json["kode"],
        message: json["message"] == null ? null : json["message"],
        listdata: json["listdata"] == null ? null : Listdata.fromJson(json["listdata"]),
    );

    Map<String, dynamic> toJson() => {
        "kode": kode == null ? null : kode,
        "message": message == null ? null : message,
        "listdata": listdata == null ? null : listdata.toJson(),
    };
}

class Listdata {
    Listdata({
        this.email,
        this.password,
        this.codereff,
        this.userbaru,
        this.nama,
    });

    String email;
    String password;
    String codereff;
    String userbaru;
    String nama;

    factory Listdata.fromJson(Map<String, dynamic> json) => Listdata(
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        codereff: json["codereff"] == null ? null : json["codereff"],
        userbaru: json["userbaru"] == null ? null : json["userbaru"],
        nama: json["nama"] == null ? null : json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "codereff": codereff == null ? null : codereff,
        "userbaru": userbaru == null ? null : userbaru,
        "nama": nama == null ? null : nama,
    };
}
