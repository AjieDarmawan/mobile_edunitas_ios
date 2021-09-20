// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.status,
        this.message,
        this.key,
        this.email,
        this.tmpdataKampus,
        this.tmpdataProdi,
    });

    int status;
    String message;
    String key;
    String email;
    String tmpdataKampus;
    String tmpdataProdi;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        key: json["key"] == null ? null : json["key"],
        email: json["email"] == null ? null : json["email"],
        tmpdataKampus: json["tmpdata_kampus"] == null ? null : json["tmpdata_kampus"],
        tmpdataProdi: json["tmpdata_prodi"] == null ? null : json["tmpdata_prodi"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "key": key == null ? null : key,
        "email": email == null ? null : email,
        "tmpdata_kampus": tmpdataKampus == null ? null : tmpdataKampus,
        "tmpdata_prodi": tmpdataProdi == null ? null : tmpdataProdi,
    };
}
