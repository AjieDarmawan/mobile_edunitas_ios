// To parse this JSON data, do
//
//     final riwayatLamaranModel = riwayatLamaranModelFromJson(jsonString);

import 'dart:convert';

List<RiwayatLamaranModel> riwayatLamaranModelFromJson(String str) => List<RiwayatLamaranModel>.from(json.decode(str).map((x) => RiwayatLamaranModel.fromJson(x)));

String riwayatLamaranModelToJson(List<RiwayatLamaranModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RiwayatLamaranModel {
    RiwayatLamaranModel({
        this.no,
        this.cid,
        this.ccid,
        this.namaPerusahaan,
        this.lowongan,
        this.tipeLowongan,
        this.status,
        this.tanggal,
    });

    int no;
    String cid;
    String ccid;
    String namaPerusahaan;
    String lowongan;
    String tipeLowongan;
    String status;
    String tanggal;

    factory RiwayatLamaranModel.fromJson(Map<String, dynamic> json) => RiwayatLamaranModel(
        no: json["no"] == null ? null : json["no"],
        cid: json["cid"] == null ? null : json["cid"],
        ccid: json["ccid"] == null ? null : json["ccid"],
        namaPerusahaan: json["nama_perusahaan"] == null ? null : json["nama_perusahaan"],
        lowongan: json["lowongan"] == null ? null : json["lowongan"],
        tipeLowongan: json["tipe_lowongan"] == null ? null : json["tipe_lowongan"],
        status: json["status"] == null ? null : json["status"],
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
    );

    Map<String, dynamic> toJson() => {
        "no": no == null ? null : no,
        "cid": cid == null ? null : cid,
        "ccid": ccid == null ? null : ccid,
        "nama_perusahaan": namaPerusahaan == null ? null : namaPerusahaan,
        "lowongan": lowongan == null ? null : lowongan,
        "tipe_lowongan": tipeLowongan == null ? null : tipeLowongan,
        "status": status == null ? null : status,
        "tanggal": tanggal == null ? null : tanggal,
    };
}
