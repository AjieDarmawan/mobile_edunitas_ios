import 'dart:convert';

AddMhsAgensiModel addMhsAgensiModelFromJson(String str) => AddMhsAgensiModel.fromJson(json.decode(str));

String addMhsAgensiModelToJson(AddMhsAgensiModel data) => json.encode(data.toJson());


class AddMhsAgensiModel {
  AddMhsAgensiModel({
    this.response,
    this.responsecode,
    this.statuscode,
    this.message,
  });

  String response, responsecode, statuscode, message;

  factory AddMhsAgensiModel.fromJson(Map<String, dynamic> json) => AddMhsAgensiModel(
    response: json["response"] == null ? null : json["response"],
    responsecode: json["responsecode"] == null ? null : json["responsecode"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "response": response == null ? null : response,
    "responsecode": responsecode == null ? null : responsecode,
    "statuscode": statuscode == null ? null : statuscode,
    "message": message == null ? null : message,
  };
}