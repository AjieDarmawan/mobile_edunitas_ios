// To parse this JSON data, do
//
//     final gantiPpModel = gantiPpModelFromJson(jsonString);

import 'dart:convert';

GantiPpModel gantiPpModelFromJson(String str) => GantiPpModel.fromJson(json.decode(str));

String gantiPpModelToJson(GantiPpModel data) => json.encode(data.toJson());

class GantiPpModel {
    GantiPpModel({
        this.response,
        this.responsecode,
        this.statuscode,
        this.message,
        this.data,
    });

    String response;
    String responsecode;
    String statuscode;
    String message;
    Data data;

    factory GantiPpModel.fromJson(Map<String, dynamic> json) => GantiPpModel(
        response: json["response"] == null ? null : json["response"],
        responsecode: json["responsecode"] == null ? null : json["responsecode"],
        statuscode: json["statuscode"] == null ? null : json["statuscode"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? null : response,
        "responsecode": responsecode == null ? null : responsecode,
        "statuscode": statuscode == null ? null : statuscode,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.normal,
        this.dataDefault,
        this.base64,
    });

    String normal;
    String dataDefault;
    String base64;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        normal: json["normal"] == null ? null : json["normal"],
        dataDefault: json["default"] == null ? null : json["default"],
        base64: json["base64"] == null ? null : json["base64"],
    );

    Map<String, dynamic> toJson() => {
        "normal": normal == null ? null : normal,
        "default": dataDefault == null ? null : dataDefault,
        "base64": base64 == null ? null : base64,
    };
}
