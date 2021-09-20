// To parse this JSON data, do
//
//     final login2Model = login2ModelFromJson(jsonString);

import 'dart:convert';

Login2Model login2ModelFromJson(String str) =>
    Login2Model.fromJson(json.decode(str));

String login2ModelToJson(Login2Model data) => json.encode(data.toJson());

class Login2Model {
  Login2Model({
    this.message,
    this.status,
    this.userId,
    this.idEmployee,
    this.firstName,
    this.email,
    this.password,
    this.picture,
    this.profilePower,
  });

  String message;
  int status;
  String userId;
  String idEmployee;
  String firstName;
  String email;
  String password;
  String picture;
  String profilePower;

  factory Login2Model.fromJson(Map<String, dynamic> json) => Login2Model(
        message: json["message"],
        status: json["status"],
        userId: json["user_id"],
        idEmployee: json["id_employee"],
        firstName: json["firstName"],
        email: json["email"],
        password: json["password"],
        picture: json["picture"],
        profilePower: json["profile_power"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "user_id": userId,
        "id_employee": idEmployee,
        "firstName": firstName,
        "email": email,
        "password": password,
        "picture": picture,
        "profile_power": profilePower,
      };
}
