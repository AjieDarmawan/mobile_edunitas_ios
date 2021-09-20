// To parse this JSON data, do
//
//     final detailKarirMeModel = detailKarirMeModelFromJson(jsonString);

import 'dart:convert';

DetailKarirMeModel detailKarirMeModelFromJson(String str) =>
    DetailKarirMeModel.fromJson(json.decode(str));

String detailKarirMeModelToJson(DetailKarirMeModel data) =>
    json.encode(data.toJson());

class DetailKarirMeModel {
  DetailKarirMeModel({
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
    this.agency,
    this.skala,
    this.namaPerusahaan2,
    this.bidang,
    this.email,
    this.notlp,
    this.nofax,
    this.website,
    this.cpnama,
    this.cpemail,
    this.cpjabatan,
    this.cpnotlp,
    this.kataKunci,
    this.kelurahan,
    this.kecamatan,
    this.kota,
    this.provinsi,
    this.negara,
    this.kodepos,
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
  String gaji;
  String pendidikan;
  String lowongan;
  String persyaratan;
  String dari;
  String hingga;
  String lokasiKerja;
  String tipeLowongan;
  String jenisLowongan;
  String agency;
  String skala;
  String namaPerusahaan2;
  String bidang;
  String email;
  String notlp;
  String nofax;
  String website;
  String cpnama;
  String cpemail;
  String cpjabatan;
  String cpnotlp;
  String kataKunci;
  String kelurahan;
  String kecamatan;
  String kota;
  String provinsi;
  String negara;
  String kodepos;
  String gambar;
  String gambar1;
  String gambar2;
  String gambar3;
  String gambar4;
  String pdf;
  String keterangan;
  String seolink;

  factory DetailKarirMeModel.fromJson(Map<String, dynamic> json) =>
      DetailKarirMeModel(
        no: json["no"] == null ? null : json["no"],
        cid: json["cid"] == null ? null : json["cid"],
        namaPerusahaan:
            json["nama_perusahaan"] == null ? null : json["nama_perusahaan"],
        tentang: json["tentang"] == null ? null : json["tentang"],
        alamatLink: json["alamat_link"] == null ? null : json["alamat_link"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        gaji: json["gaji"] == null ? null : json["gaji"],
        pendidikan: json["pendidikan"] == null ? null : json["pendidikan"],
        lowongan: json["lowongan"] == null ? null : json["lowongan"],
        persyaratan: json["persyaratan"] == null ? null : json["persyaratan"],
        dari: json["dari"] == null ? null : json["dari"],
        hingga: json["hingga"] == null ? null : json["hingga"],
        lokasiKerja: json["lokasi_kerja"] == null ? null : json["lokasi_kerja"],
        tipeLowongan:
            json["tipe_lowongan"] == null ? null : json["tipe_lowongan"],
        jenisLowongan:
            json["jenis_lowongan"] == null ? null : json["jenis_lowongan"],
        agency: json["agency"] == null ? null : json["agency"],
        skala: json["skala"] == null ? null : json["skala"],
        namaPerusahaan2:
            json["nama_perusahaan2"] == null ? null : json["nama_perusahaan2"],
        bidang: json["bidang"] == null ? null : json["bidang"],
        email: json["email"] == null ? null : json["email"],
        notlp: json["notlp"] == null ? null : json["notlp"],
        nofax: json["nofax"] == null ? null : json["nofax"],
        website: json["website"] == null ? null : json["website"],
        cpnama: json["cpnama"] == null ? null : json["cpnama"],
        cpemail: json["cpemail"] == null ? null : json["cpemail"],
        cpjabatan: json["cpjabatan"] == null ? null : json["cpjabatan"],
        cpnotlp: json["cpnotlp"] == null ? null : json["cpnotlp"],
        kataKunci: json["kata_kunci"] == null ? null : json["kata_kunci"],
        kelurahan: json["kelurahan"] == null ? null : json["kelurahan"],
        kecamatan: json["kecamatan"] == null ? null : json["kecamatan"],
        kota: json["kota"] == null ? null : json["kota"],
        provinsi: json["provinsi"] == null ? null : json["provinsi"],
        negara: json["negara"] == null ? null : json["negara"],
        kodepos: json["kodepos"] == null ? null : json["kodepos"],
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
        "gaji": gaji == null ? null : gaji,
        "pendidikan": pendidikan == null ? null : pendidikan,
        "lowongan": lowongan == null ? null : lowongan,
        "persyaratan": persyaratan == null ? null : persyaratan,
        "dari": dari == null ? null : dari,
        "hingga": hingga == null ? null : hingga,
        "lokasi_kerja": lokasiKerja == null ? null : lokasiKerja,
        "tipe_lowongan": tipeLowongan == null ? null : tipeLowongan,
        "jenis_lowongan": jenisLowongan == null ? null : jenisLowongan,
        "agency": agency == null ? null : agency,
        "skala": skala == null ? null : skala,
        "nama_perusahaan2": namaPerusahaan2 == null ? null : namaPerusahaan2,
        "bidang": bidang == null ? null : bidang,
        "email": email == null ? null : email,
        "notlp": notlp == null ? null : notlp,
        "nofax": nofax == null ? null : nofax,
        "website": website == null ? null : website,
        "cpnama": cpnama == null ? null : cpnama,
        "cpemail": cpemail == null ? null : cpemail,
        "cpjabatan": cpjabatan == null ? null : cpjabatan,
        "cpnotlp": cpnotlp == null ? null : cpnotlp,
        "kata_kunci": kataKunci == null ? null : kataKunci,
        "kelurahan": kelurahan == null ? null : kelurahan,
        "kecamatan": kecamatan == null ? null : kecamatan,
        "kota": kota == null ? null : kota,
        "provinsi": provinsi == null ? null : provinsi,
        "negara": negara == null ? null : negara,
        "kodepos": kodepos == null ? null : kodepos,
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
