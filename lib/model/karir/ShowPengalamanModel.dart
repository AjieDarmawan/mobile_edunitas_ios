// To parse this JSON data, do
//
//     final showPengalamanModel = showPengalamanModelFromJson(jsonString);

import 'dart:convert';

List<ShowPengalamanModel> showPengalamanModelFromJson(String str) =>
    List<ShowPengalamanModel>.from(
        json.decode(str).map((x) => ShowPengalamanModel.fromJson(x)));

String showPengalamanModelToJson(List<ShowPengalamanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowPengalamanModel {
  ShowPengalamanModel({
    this.id,
    this.nama,
    this.dari,
    this.hingga,
    this.untilnow,
    this.bidang,
    this.spesialisasi,
    this.negara,
    this.provinsi,
    this.kota,
    this.kecamatan,
    this.kelurahan,
    this.alamat,
    this.kodepos,
    this.industri,
    this.jabatan,
    this.gaji,
    this.deskripsi,
    this.posisi,
    this.wilayahProv,
    this.wilayahKota,
    this.wilayahKec,
    this.wilayahDesa,
    this.jabatanNama,
    this.industriNama,
    this.bidangNama,
    this.spesialisasiNama,
    this.posisiNama,
  });

  String id;
  String nama;
  String dari;
  String hingga;
  String untilnow;
  String bidang;
  String spesialisasi;
  String negara;
  String provinsi;
  String kota;
  String kecamatan;
  String kelurahan;
  String alamat;
  String kodepos;
  String industri;
  String jabatan;
  int gaji;
  String deskripsi;
  int posisi;
  String wilayahProv;
  String wilayahKota;
  String wilayahKec;
  String wilayahDesa;
  String jabatanNama;
  String industriNama;
  String bidangNama;
  String spesialisasiNama;
  String posisiNama;

  factory ShowPengalamanModel.fromJson(Map<String, dynamic> json) =>
      ShowPengalamanModel(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        dari: json["dari"] == null ? null : json["dari"],
        hingga: json["hingga"] == null ? null : json["hingga"],
        untilnow: json["untilnow"] == null ? null : json["untilnow"],
        bidang: json["bidang"] == null ? null : json["bidang"],
        spesialisasi:
            json["spesialisasi"] == null ? null : json["spesialisasi"],
        negara: json["negara"] == null ? null : json["negara"],
        provinsi: json["provinsi"] == null ? null : json["provinsi"],
        kota: json["kota"] == null ? null : json["kota"],
        kecamatan: json["kecamatan"] == null ? null : json["kecamatan"],
        kelurahan: json["kelurahan"] == null ? null : json["kelurahan"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        kodepos: json["kodepos"] == null ? null : json["kodepos"],
        industri: json["industri"] == null ? null : json["industri"],
        jabatan: json["jabatan"] == null ? null : json["jabatan"],
        gaji: json["gaji"] == null ? null : json["gaji"],
        deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
        posisi: json["posisi"] == null ? null : json["posisi"],
        wilayahProv: json["wilayah_prov"] == null ? null : json["wilayah_prov"],
        wilayahKota: json["wilayah_kota"] == null ? null : json["wilayah_kota"],
        wilayahKec: json["wilayah_kec"] == null ? null : json["wilayah_kec"],
        wilayahDesa: json["wilayah_desa"] == null ? null : json["wilayah_desa"],
        jabatanNama: json["jabatan_nama"] == null ? null : json["jabatan_nama"],
        industriNama:
            json["industri_nama"] == null ? null : json["industri_nama"],
        bidangNama: json["bidang_nama"] == null ? null : json["bidang_nama"],
        spesialisasiNama: json["spesialisasi_nama"] == null
            ? null
            : json["spesialisasi_nama"],
        posisiNama: json["posisi_nama"] == null ? null : json["posisi_nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "dari": dari == null ? null : dari,
        "hingga": hingga == null ? null : hingga,
        "untilnow": untilnow == null ? null : untilnow,
        "bidang": bidang == null ? null : bidang,
        "spesialisasi": spesialisasi == null ? null : spesialisasi,
        "negara": negara == null ? null : negara,
        "provinsi": provinsi == null ? null : provinsi,
        "kota": kota == null ? null : kota,
        "kecamatan": kecamatan == null ? null : kecamatan,
        "kelurahan": kelurahan == null ? null : kelurahan,
        "alamat": alamat == null ? null : alamat,
        "kodepos": kodepos == null ? null : kodepos,
        "industri": industri == null ? null : industri,
        "jabatan": jabatan == null ? null : jabatan,
        "gaji": gaji == null ? null : gaji,
        "deskripsi": deskripsi == null ? null : deskripsi,
        "posisi": posisi == null ? null : posisi,
        "wilayah_prov": wilayahProv == null ? null : wilayahProv,
        "wilayah_kota": wilayahKota == null ? null : wilayahKota,
        "wilayah_kec": wilayahKec == null ? null : wilayahKec,
        "wilayah_desa": wilayahDesa == null ? null : wilayahDesa,
        "jabatan_nama": jabatanNama == null ? null : jabatanNama,
        "industri_nama": industriNama == null ? null : industriNama,
        "bidang_nama": bidangNama == null ? null : bidangNama,
        "spesialisasi_nama": spesialisasiNama == null ? null : spesialisasiNama,
        "posisi_nama": posisiNama == null ? null : posisiNama,
      };
}
