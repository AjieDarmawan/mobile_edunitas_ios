// To parse this JSON data, do
//
//     final usersDetailModel = usersDetailModelFromJson(jsonString);

import 'dart:convert';

UsersDetailModel usersDetailModelFromJson(String str) =>
    UsersDetailModel.fromJson(json.decode(str));

String usersDetailModelToJson(UsersDetailModel data) =>
    json.encode(data.toJson());

class UsersDetailModel {
  UsersDetailModel({
    this.status,
    this.nama,
    this.email,
    this.pendidikan,
    this.tempatLahir,
    this.tanggalLahir,
    this.genre,
    this.noHp,
    this.noWa,
    this.noKtp,
    this.noIbu,
    this.noAyah,
    this.agama,
    this.medsos,
    this.alamat,
    this.no_virtual,
    this.campus,
    this.prodi,
    this.logo,
    this.kelas,
    this.nosel,
    this.singkatan,
    this.kodecampus,
    this.foto,
    this.nim,
  });

  factory UsersDetailModel.fromJson(Map<String, dynamic> json) =>
      UsersDetailModel(
        status: json["status"] == null ? null : json["status"],
        nama: json["nama"] == null ? null : json["nama"],
        email: json["email"] == null ? null : json["email"],
        pendidikan: json["pendidikan"] == null ? null : json["pendidikan"],
        tempatLahir: json["tempat_lahir"] == null ? null : json["tempat_lahir"],
        tanggalLahir:
        json["tanggal_lahir"] == null ? null : json["tanggal_lahir"],
        genre: json["genre"] == null ? null : json["genre"],
        noHp: json["no_hp"] == null ? null : json["no_hp"],
        noWa: json["no_wa"] == null ? null : json["no_wa"],
        noKtp: json["no_ktp"],
        noIbu: json["no_ibu"] == null ? null : json["no_ibu"],
        noAyah: json["no_ayah"] == null ? null : json["no_ayah"],
        agama: json["agama"] == null ? null : json["agama"],
        no_virtual: json["no_virtual"] == null ? null : json["no_virtual"],
        campus: json["campus"] == null ? null : json["campus"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        logo: json["logo"] == null ? null : json["logo"],
        kelas: json["kelas"] == null ? null : json["kelas"],
        nosel: json["nosel"] == null ? null : json["nosel"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        kodecampus: json["kodecampus"] == null ? null : json["kodecampus"],
        foto: json["foto"] == null ? null : json["foto"],
        nim: json["nim"] == null ? null : json["nim"],
        medsos: json["medsos"],
        alamat: json["alamat"],
      );

  String agama;
  dynamic alamat;
  String campus;
  String email;
  String genre;
  dynamic medsos;
  String nama;
  String noAyah;
  String noHp;
  String noIbu;
  dynamic noKtp;
  String noWa;
  String no_virtual;
  String pendidikan;
  String prodi;
  String logo;
  int status;
  String tanggalLahir;
  String tempatLahir;
  String kelas;
  String nosel;
  String singkatan;
  String kodecampus;
  String foto;
  String nim;

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "nama": nama == null ? null : nama,
    "email": email == null ? null : email,
    "pendidikan": pendidikan == null ? null : pendidikan,
    "tempat_lahir": tempatLahir == null ? null : tempatLahir,
    "tanggal_lahir": tanggalLahir == null ? null : tanggalLahir,
    "genre": genre == null ? null : genre,
    "no_hp": noHp == null ? null : noHp,
    "no_wa": noWa == null ? null : noWa,
    "no_ktp": noKtp,
    "no_ibu": noIbu == null ? null : noIbu,
    "no_ayah": noAyah == null ? null : noAyah,
    "agama": agama == null ? null : agama,
    "no_virtual": no_virtual == null ? null : no_virtual,
    "campus": campus == null ? null : campus,
    "prodi": prodi == null ? null : prodi,
    "logo": logo == null ? null : logo,
    "kelas": kelas == null ? null : kelas,
    "nosel": nosel == null ? null : nosel,
    "singkatan": singkatan == null ? null : singkatan,
    "kodecampus": kodecampus == null ? null : kodecampus,
    "foto": foto == null ? null : foto,
    "nim": nim == null ? null : nim,
    "medsos": medsos,
    "alamat": alamat,
  };
}
