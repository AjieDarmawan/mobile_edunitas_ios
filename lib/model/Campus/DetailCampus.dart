// To parse this JSON data, do
//
//     final detailCampusModel = detailCampusModelFromJson(jsonString);

import 'dart:convert';

DetailCampusModel detailCampusModelFromJson(String str) => DetailCampusModel.fromJson(json.decode(str));

String detailCampusModelToJson(DetailCampusModel data) => json.encode(data.toJson());

class DetailCampusModel {
    DetailCampusModel({
        this.youtube,
        this.rektor,
        this.tran,
        this.transportasi,
        this.fileCampusDetail,
    });

    String youtube;
    String rektor;
    List<Tran> tran;
    List<String> transportasi;
    List<String> fileCampusDetail;

    factory DetailCampusModel.fromJson(Map<String, dynamic> json) => DetailCampusModel(
        youtube: json["youtube"] == null ? null : json["youtube"],
        rektor: json["rektor"] == null ? null : json["rektor"],
        tran: json["tran"] == null ? null : List<Tran>.from(json["tran"].map((x) => Tran.fromJson(x))),
        transportasi: json["transportasi"] == null ? null : List<String>.from(json["transportasi"].map((x) => x)),
        fileCampusDetail: json["file_campus_detail"] == null ? null : List<String>.from(json["file_campus_detail"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "youtube": youtube == null ? null : youtube,
        "rektor": rektor == null ? null : rektor,
        "tran": tran == null ? null : List<dynamic>.from(tran.map((x) => x.toJson())),
        "transportasi": transportasi == null ? null : List<dynamic>.from(transportasi.map((x) => x)),
        "file_campus_detail": fileCampusDetail == null ? null : List<dynamic>.from(fileCampusDetail.map((x) => x)),
    };
}

class Tran {
    Tran({
        this.kendaraan,
        this.jalan,
    });

    String kendaraan;
    String jalan;

    factory Tran.fromJson(Map<String, dynamic> json) => Tran(
        kendaraan: json["kendaraan"] == null ? null : json["kendaraan"],
        jalan: json["jalan"] == null ? null : json["jalan"],
    );

    Map<String, dynamic> toJson() => {
        "kendaraan": kendaraan == null ? null : kendaraan,
        "jalan": jalan == null ? null : jalan,
    };
}
