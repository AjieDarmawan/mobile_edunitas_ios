// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) =>
    StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  StatusModel({
    this.status,
    this.message,
    this.etc,
    this.etc2,
  });

  int status;
  String message;
  String etc;
  String etc2;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        etc: json["etc"] == null ? null : json["etc"],
        etc2: json["etc2"] == null ? null : json["etc2"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "etc": etc == null ? null : etc,
        "etc2": etc2 == null ? null : etc2,
      };
}
