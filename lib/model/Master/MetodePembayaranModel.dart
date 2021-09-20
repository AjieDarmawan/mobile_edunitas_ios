// To parse this JSON data, do
//
//     final metodePembayaranModel = metodePembayaranModelFromJson(jsonString);

import 'dart:convert';

List<MetodePembayaranModel> metodePembayaranModelFromJson(String str) => List<MetodePembayaranModel>.from(json.decode(str).map((x) => MetodePembayaranModel.fromJson(x)));

String metodePembayaranModelToJson(List<MetodePembayaranModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MetodePembayaranModel {
    MetodePembayaranModel({
        this.id,
        this.metode,
        this.kelompok,
        this.cara,
        this.pelayanan,
        this.nopembayaran,
        this.jenistagihan,
        this.jenisrek,
        this.logo,
        this.urutan,
        this.no_pembayaran_pev,
    });

    int id;
    String metode;
    String kelompok;
    String cara;
    int pelayanan;
    String nopembayaran;
    String jenistagihan;
    String jenisrek;
     String logo;
    dynamic urutan;
    String no_pembayaran_pev;

    factory MetodePembayaranModel.fromJson(Map<String, dynamic> json) => MetodePembayaranModel(
        id: json["id"] == null ? null : json["id"],
        metode: json["metode"] == null ? null : json["metode"],
        kelompok: json["kelompok"] == null ? null : json["kelompok"],
        cara: json["cara"] == null ? null : json["cara"],
        pelayanan: json["pelayanan"] == null ? null : json["pelayanan"],
        nopembayaran: json["nopembayaran"] == null ? null : json["nopembayaran"],
        jenistagihan: json["jenistagihan"] == null ? null : json["jenistagihan"],
        jenisrek: json["jenisrek"] == null ? null : json["jenisrek"],
         logo: json["logo"] == null ? null : json["logo"],
        urutan: json["urutan"] == null ? null : json["urutan"],
       
          no_pembayaran_pev: json["no_pembayaran_pev"] == null ? null : json["no_pembayaran_pev"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "metode": metode == null ? null : metode,
        "kelompok": kelompok == null ? null : kelompok,
        "cara": cara == null ? null : cara,
        "pelayanan": pelayanan == null ? null : pelayanan,
        "nopembayaran": nopembayaran == null ? null : nopembayaran,
        "jenistagihan": jenistagihan == null ? null : jenistagihan,
        "jenisrek": jenisrek == null ? null : jenisrek,
        "logo": logo == null ? null : logo,
        "urutan": urutan,
         "no_pembayaran_pev": no_pembayaran_pev == null ? null : no_pembayaran_pev,
    };
}
