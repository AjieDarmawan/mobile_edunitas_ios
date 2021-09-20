class Photo {
  final int id;
  final String nama;
  final String logo;
  final String kode;
  final String cover;
  final String singkatan;
  final String website;
  final String webacid;
  final String kota;
  final String rektor;
  final String strlat;
  final String strlong;
  final String akreditasi;
  final String alamat;
  final String email;
  final String banpt;
  final int totaljurusan;
  final String color;
  final String biaya;
  // final String biayaDicoret;
  // final String fileFlyer;
  // final String fileBrosur;
  // final String filePath;
  final String picnik;
  // final String picname;
  final String keterangan;
  final String visi;
  final String misi;
  final String youtube;
  final int total;
  final int perpage;

  Photo(
      this.id,
      this.nama,
      this.logo,
      this.kode,
      this.cover,
      this.singkatan,
      this.website,
      this.webacid,
      this.kota,
      this.rektor,
      this.strlat,
      this.strlong,
      this.akreditasi,
      this.alamat,
      this.email,
      this.banpt,
      this.totaljurusan,
      this.color,
      this.biaya,
      // this.biayaDicoret,
      // this.fileFlyer,
      // this.fileBrosur,
      // this.filePath,
      this.picnik,
      // this.picname,
      this.keterangan,
      this.visi,
      this.misi,
      this.youtube,
      this.total,
      this.perpage);

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      json["id"] == null ? null : json["id"],
      json["nama"] == null ? null : json["nama"],
      json["logo"] == null ? null : json["logo"],
      json["kode"] == null ? null : json["kode"],
      json["cover"] == null ? null : json["cover"],
      json["singkatan"] == null ? null : json["singkatan"],
      json["website"] == null ? null : json["website"],
      json["webacid"] == null ? null : json["webacid"],
      json["kota"] == null ? null : json["kota"],
      json["rektor"] == null ? null : json["rektor"],
      json["strlat"] == null ? null : json["strlat"],
      json["strlong"] == null ? null : json["strlong"],
      json["akreditasi"] == null ? null : json["akreditasi"],
      json["alamat"] == null ? null : json["alamat"],
      json["email"] == null ? null : json["email"],
      json["banpt"] == null ? null : json["banpt"],
      json["totaljurusan"] == null ? null : json["totaljurusan"],
      json["color"] == null ? null : json["color"],
      json["biaya"] == null ? null : json["biaya"],
      // json["biaya_dicoret"] == null ? null : json["biaya_dicoret"],
      // json["file_flyer"] == null ? null : json["file_flyer"],
      // json["file_brosur"] == null ? null : json["file_brosur"],
      // json["file_path"] == null ? null : json["file_path"],
      json["picnik"] == null ? null : json["picnik"],
      // json["picname"] == null ? null : json["picname"],
      json["keterangan"] == null ? null : json["keterangan"],
      json["visi"] == null ? null : json["visi"],
      json["misi"] == null ? null : json["misi"],
      json["youtube"] == null ? null : json["youtube"],
      json["total"] == null ? null : json["total"],
      json["perPage"] == null ? null : json["perPage"],
    );
  }

  static List<Photo> parseList(List<dynamic> list) {
    return list.map((i) => Photo.fromJson(i)).toList();
  }
}
