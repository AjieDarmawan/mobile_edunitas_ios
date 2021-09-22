// To parse this JSON data, do
//
//     final listKarirPatnerModel = listKarirPatnerModelFromJson(jsonString);

import 'dart:convert';

List<ListKarirPatnerModel> listKarirPatnerModelFromJson(String str) => List<ListKarirPatnerModel>.from(json.decode(str).map((x) => ListKarirPatnerModel.fromJson(x)));

String listKarirPatnerModelToJson(List<ListKarirPatnerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListKarirPatnerModel {
    ListKarirPatnerModel({
        this.no,
        this.cid,
        this.ccid,
        this.namaPerusahaan,
        this.alamatLink,
        this.alamat,
        this.gaji,
        this.pendidikan,
        this.lowongan,
        this.dari,
        this.hingga,
        this.lokasiKerja,
        this.tipeLowongan,
        this.jenisLowongan,
        this.gambar,
        this.keterangan,
        this.status,
        this.totalview,
        this.totalapply,
        this.seolink,
    });

    int no;
    String cid;
    String ccid;
    String namaPerusahaan;
    int alamatLink;
    dynamic alamat;
    String gaji;
    String pendidikan;
    String lowongan;
    String dari;
    String hingga;
    String lokasiKerja;
    String tipeLowongan;
    String jenisLowongan;
    String gambar;
    String keterangan;
    dynamic status;
    String totalview;
    int totalapply;
    String seolink;

    factory ListKarirPatnerModel.fromJson(Map<String, dynamic> json) => ListKarirPatnerModel(
        no: json["no"] == null ? null : json["no"],
        cid: json["cid"] == null ? null : json["cid"],
        ccid: json["ccid"] == null ? null : json["ccid"],
        namaPerusahaan: json["nama_perusahaan"] == null ? null : json["nama_perusahaan"],
        alamatLink: json["alamat_link"] == null ? null : json["alamat_link"],
        alamat: json["alamat"],
        gaji: json["gaji"] == null ? null : json["gaji"],
        pendidikan: json["pendidikan"] == null ? null : json["pendidikan"],
        lowongan: json["lowongan"] == null ? null : json["lowongan"],
        dari: json["dari"] == null ? null : json["dari"],
        hingga: json["hingga"] == null ? null : json["hingga"],
        lokasiKerja: json["lokasi_kerja"] == null ? null : json["lokasi_kerja"],
        tipeLowongan: json["tipe_lowongan"] == null ? null : json["tipe_lowongan"],
        jenisLowongan: json["jenis_lowongan"] == null ? null : json["jenis_lowongan"],
        gambar: json["gambar"] == null ? null : json["gambar"],
        keterangan: json["keterangan"] == null ? null : json["keterangan"],
        status: json["status"],
        totalview: json["totalview"] == null ? null : json["totalview"],
        totalapply: json["totalapply"] == null ? null : json["totalapply"],
        seolink: json["seolink"] == null ? null : json["seolink"],
    );

    Map<String, dynamic> toJson() => {
        "no": no == null ? null : no,
        "cid": cid == null ? null : cid,
        "ccid": ccid == null ? null : ccid,
        "nama_perusahaan": namaPerusahaan == null ? null : namaPerusahaan,
        "alamat_link": alamatLink == null ? null : alamatLink,
        "alamat": alamat,
        "gaji": gaji == null ? null : gaji,
        "pendidikan": pendidikan == null ? null : pendidikan,
        "lowongan": lowongan == null ? null : lowongan,
        "dari": dari == null ? null : dari,
        "hingga": hingga == null ? null : hingga,
        "lokasi_kerja": lokasiKerja == null ? null : lokasiKerja,
        "tipe_lowongan": tipeLowongan == null ? null : tipeLowongan,
        "jenis_lowongan": jenisLowongan == null ? null : jenisLowongan,
        "gambar": gambar == null ? null : gambar,
        "keterangan": keterangan == null ? null : keterangan,
        "status": status,
        "totalview": totalview == null ? null : totalview,
        "totalapply": totalapply == null ? null : totalapply,
        "seolink": seolink == null ? null : seolink,
    };
}
