// To parse this JSON data, do
//
//     final listKarirModel = listKarirModelFromJson(jsonString);

import 'dart:convert';

List<ListKarirModel> listKarirModelFromJson(String str) =>
    List<ListKarirModel>.from(
        json.decode(str).map((x) => ListKarirModel.fromJson(x)));

String listKarirModelToJson(List<ListKarirModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListKarirModel {
  ListKarirModel(
      {this.no,
      this.cid,
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
      this.gambar1,
      this.keterangan,
      this.seolink,
      this.jumlahklik,
      this.totaltayang,
      this.status,
      this.pdf});

  int no;
  String cid;
  String namaPerusahaan;
  int alamatLink;
  String alamat;
  String gaji;
  String pendidikan;
  String lowongan;
  String dari;
  String hingga;
  String lokasiKerja;
  String tipeLowongan;
  String jenisLowongan;
  String gambar1;
  String keterangan;
  String seolink;
  String jumlahklik;
  String totaltayang;
  String pdf;
  String status;

  factory ListKarirModel.fromJson(Map<String, dynamic> json) => ListKarirModel(
        no: json["no"] == null ? null : json["no"],
        cid: json["cid"] == null ? null : json["cid"],
        namaPerusahaan:
            json["nama_perusahaan"] == null ? null : json["nama_perusahaan"],
        alamatLink: json["alamat_link"] == null ? null : json["alamat_link"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        gaji: json["gaji"] == null ? null : json["gaji"],
        pendidikan: json["pendidikan"] == null ? null : json["pendidikan"],
        lowongan: json["lowongan"] == null ? null : json["lowongan"],
        dari: json["dari"] == null ? null : json["dari"],
        hingga: json["hingga"] == null ? null : json["hingga"],
        lokasiKerja: json["lokasi_kerja"] == null ? null : json["lokasi_kerja"],
        tipeLowongan:
            json["tipe_lowongan"] == null ? null : json["tipe_lowongan"],
        jenisLowongan:
            json["jenis_lowongan"] == null ? null : json["jenis_lowongan"],
        gambar1: json["gambar1"] == null ? null : json["gambar1"],
        keterangan: json["keterangan"] == null ? null : json["keterangan"],
        seolink: json["seolink"] == null ? null : json["seolink"],
        jumlahklik: json["jumlahklik"] == null ? null : json["jumlahklik"],
        totaltayang: json["totaltayang"] == null ? null : json["totaltayang"],
          status: json["status"] == null ? null : json["status"],
           pdf: json["pdf"] == null ? null : json["pdf"],
       // pdf: "https://raw.githubusercontent.com/FlutterInThai/Dart-for-Flutter-Sheet-cheet/master/Dart-for-Flutter-Cheat-Sheet.pdf",
      );

  Map<String, dynamic> toJson() => {
        "no": no == null ? null : no,
        "cid": cid == null ? null : cid,
        "nama_perusahaan": namaPerusahaan == null ? null : namaPerusahaan,
        "alamat_link": alamatLink == null ? null : alamatLink,
        "alamat": alamat == null ? null : alamat,
        "gaji": gaji == null ? null : gaji,
        "pendidikan":
            pendidikan == null ? null : pendidikanValues.reverse[pendidikan],
        "lowongan": lowongan == null ? null : lowongan,
        "dari": dari == null ? null : dari,
        "hingga": hingga == null ? null : hingga,
        "lokasi_kerja": lokasiKerja == null ? null : lokasiKerja,
        "tipe_lowongan": tipeLowongan == null ? null : tipeLowongan,
        "jenis_lowongan": jenisLowongan == null
            ? null
            : jenisLowonganValues.reverse[jenisLowongan],
        "gambar1": gambar1 == null ? null : gambar1,
        "keterangan": keterangan == null ? null : keterangan,
        "seolink": seolink == null ? null : seolink,
        "jumlahklik": jumlahklik == null ? null : jumlahklik,
        "totaltayang": totaltayang == null ? null : totaltayang,
         "status": status == null ? null : status,
          "pdf": pdf == null ? null : pdf,
       // "pdf": "https://raw.githubusercontent.com/FlutterInThai/Dart-for-Flutter-Sheet-cheet/master/Dart-for-Flutter-Cheat-Sheet.pdf",
      };
}

enum JenisLowongan { LENGKAP }

final jenisLowonganValues = EnumValues({"lengkap": JenisLowongan.LENGKAP});

enum Pendidikan { D3_S1, S1, S1_S1 }

final pendidikanValues = EnumValues({
  "D3, S1": Pendidikan.D3_S1,
  "S1": Pendidikan.S1,
  "S1, S1": Pendidikan.S1_S1
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
