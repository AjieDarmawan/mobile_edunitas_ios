// To parse this JSON data, do
//
//     final detailKarirModel = detailKarirModelFromJson(jsonString);

import 'dart:convert';

DetailKarirModel detailKarirModelFromJson(String str) => DetailKarirModel.fromJson(json.decode(str));

String detailKarirModelToJson(DetailKarirModel data) => json.encode(data.toJson());

class DetailKarirModel {
    DetailKarirModel({
        this.no,
        this.cid,
        this.namaPerusahaan,
        this.tentang,
        this.alamatLink,
        this.alamat,
        this.gaji,
        this.pendidikan,
        this.lowongan,
        this.persyaratan,
        this.dari,
        this.hingga,
        this.lokasiKerja,
        this.tipeLowongan,
        this.jenisLowongan,
        this.gambar,
        this.gambar1,
        this.gambar2,
        this.gambar3,
        this.gambar4,
        this.pdf,
        this.keterangan,
        this.seolink,
    });

    int no;
    String cid;
    String namaPerusahaan;
    String tentang;
    int alamatLink;
    String alamat;
    dynamic gaji;
    String pendidikan;
    String lowongan;
    String persyaratan;
    String dari;
    String hingga;
    String lokasiKerja;
    dynamic tipeLowongan;
    String jenisLowongan;
    String gambar;
    String gambar1;
    String gambar2;
    String gambar3;
    String gambar4;
    String pdf;
    String keterangan;
    String seolink;

    factory DetailKarirModel.fromJson(Map<String, dynamic> json) => DetailKarirModel(
        no: json["no"] == null ? null : json["no"],
        cid: json["cid"] == null ? null : json["cid"],
        namaPerusahaan: json["nama_perusahaan"] == null ? null : json["nama_perusahaan"],
        tentang: json["tentang"] == null ? null : json["tentang"],
        alamatLink: json["alamat_link"] == null ? null : json["alamat_link"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        gaji: json["gaji"],
        pendidikan: json["pendidikan"] == null ? null : json["pendidikan"],
        lowongan: json["lowongan"] == null ? null : json["lowongan"],
        persyaratan: json["persyaratan"] == null ? null : json["persyaratan"],
        dari: json["dari"] == null ? null : json["dari"],
        hingga: json["hingga"] == null ? null : json["hingga"],
        lokasiKerja: json["lokasi_kerja"] == null ? null : json["lokasi_kerja"],
        tipeLowongan: json["tipe_lowongan"],
        jenisLowongan: json["jenis_lowongan"] == null ? null : json["jenis_lowongan"],
        gambar: json["gambar"] == null ? null : json["gambar"],
        gambar1: json["gambar1"] == null ? null : json["gambar1"],
        gambar2: json["gambar2"] == null ? null : json["gambar2"],
        gambar3: json["gambar3"] == null ? null : json["gambar3"],
        gambar4: json["gambar4"] == null ? null : json["gambar4"],
        pdf: json["pdf"] == null ? null : json["pdf"],
        keterangan: json["keterangan"] == null ? null : json["keterangan"],
        seolink: json["seolink"] == null ? null : json["seolink"],
    );

    Map<String, dynamic> toJson() => {
        "no": no == null ? null : no,
        "cid": cid == null ? null : cid,
        "nama_perusahaan": namaPerusahaan == null ? null : namaPerusahaan,
        "tentang": tentang == null ? null : tentang,
        "alamat_link": alamatLink == null ? null : alamatLink,
        "alamat": alamat == null ? null : alamat,
        "gaji": gaji,
        "pendidikan": pendidikan == null ? null : pendidikan,
        "lowongan": lowongan == null ? null : lowongan,
        "persyaratan": persyaratan == null ? null : persyaratan,
        "dari": dari == null ? null : dari,
        "hingga": hingga == null ? null : hingga,
        "lokasi_kerja": lokasiKerja == null ? null : lokasiKerja,
        "tipe_lowongan": tipeLowongan,
        "jenis_lowongan": jenisLowongan == null ? null : jenisLowongan,
        "gambar": gambar == null ? null : gambar,
        "gambar1": gambar1 == null ? null : gambar1,
        "gambar2": gambar2 == null ? null : gambar2,
        "gambar3": gambar3 == null ? null : gambar3,
        "gambar4": gambar4 == null ? null : gambar4,
        "pdf": pdf == null ? null : pdf,
        "keterangan": keterangan == null ? null : keterangan,
        "seolink": seolink == null ? null : seolink,
    };
}
