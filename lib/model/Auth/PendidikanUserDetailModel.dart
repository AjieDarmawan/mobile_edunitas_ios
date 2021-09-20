// To parse this JSON data, do
//
//     final detailPendidikanModel = detailPendidikanModelFromJson(jsonString);

import 'dart:convert';

DetailPendidikanModel detailPendidikanModelFromJson(String str) =>
    DetailPendidikanModel.fromJson(json.decode(str));

String detailPendidikanModelToJson(DetailPendidikanModel data) =>
    json.encode(data.toJson());

class DetailPendidikanModel {
  DetailPendidikanModel({
    this.leveledu,
    this.jurusan,
    this.nama,
    this.thnlulus,
    this.provinsi,
    this.kota,
    this.kecamatan,
    this.kelurahan,
    this.nilaiakhir,
    this.dari,
    this.alamat,
    this.kodepos,
    this.keycode,
    this.wilayahProv,
    this.wilayahKota,
    this.wilayahKec,
    this.wilayahDesa,
    this.namaleveledu,
  });

  String leveledu;
  String jurusan;
  String nama;
  String thnlulus;
  String provinsi;
  String kota;
  String kecamatan;
  String kelurahan;
  String nilaiakhir;
  String dari;
  String alamat;
  String kodepos;
  String keycode;
  String namaleveledu;
  String wilayahProv;
  String wilayahKota;
  String wilayahKec;
  String wilayahDesa;

  factory DetailPendidikanModel.fromJson(Map<String, dynamic> json) =>
      DetailPendidikanModel(
        leveledu: json["leveledu"] == null ? null : json["leveledu"],
        namaleveledu:
            json["namaleveledu"] == null ? null : json["namaleveledu"],
        jurusan: json["jurusan"] == null ? null : json["jurusan"],
        nama: json["nama"] == null ? null : json["nama"],
        thnlulus: json["thnlulus"] == null ? null : json["thnlulus"],
        provinsi: json["provinsi"] == null ? null : json["provinsi"],
        kota: json["kota"] == null ? null : json["kota"],
        kecamatan: json["kecamatan"] == null ? null : json["kecamatan"],
        kelurahan: json["kelurahan"] == null ? null : json["kelurahan"],
        nilaiakhir: json["nilaiakhir"] == null ? null : json["nilaiakhir"],
        dari: json["dari"] == null ? null : json["dari"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        kodepos: json["kodepos"] == null ? null : json["kodepos"],
        keycode: json["keycode"] == null ? null : json["keycode"],
        wilayahProv: json["wilayah_prov"] == null ? null : json["wilayah_prov"],
        wilayahKota: json["wilayah_kota"] == null ? null : json["wilayah_kota"],
        wilayahKec: json["wilayah_kec"] == null ? null : json["wilayah_kec"],
        wilayahDesa: json["wilayah_desa"] == null ? null : json["wilayah_desa"],
      );

  Map<String, dynamic> toJson() => {
        "leveledu": leveledu == null ? null : leveledu,
        "namaleveledu": namaleveledu == null ? null : namaleveledu,
        "jurusan": jurusan == null ? null : jurusan,
        "nama": nama == null ? null : nama,
        "thnlulus": thnlulus == null ? null : thnlulus,
        "provinsi": provinsi == null ? null : provinsi,
        "kota": kota == null ? null : kota,
        "kecamatan": kecamatan == null ? null : kecamatan,
        "kelurahan": kelurahan == null ? null : kelurahan,
        "nilaiakhir": nilaiakhir == null ? null : nilaiakhir,
        "dari": dari == null ? null : dari,
        "alamat": alamat == null ? null : alamat,
        "kodepos": kodepos == null ? null : kodepos,
        "keycode": keycode == null ? null : keycode,
        "wilayah_prov": wilayahProv == null ? null : wilayahProv,
        "wilayah_kota": wilayahKota == null ? null : wilayahKota,
        "wilayah_kec": wilayahKec == null ? null : wilayahKec,
        "wilayah_desa": wilayahDesa == null ? null : wilayahDesa,
      };
}
