// To parse this JSON data, do
//
//     final donasiMePatner = donasiMePatnerFromJson(jsonString);

import 'dart:convert';

List<DonasiMePatner> donasiMePatnerFromJson(String str) => List<DonasiMePatner>.from(json.decode(str).map((x) => DonasiMePatner.fromJson(x)));

String donasiMePatnerToJson(List<DonasiMePatner> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonasiMePatner {
    DonasiMePatner({
        this.nama,
        this.medsos,
        this.aboutme,
        this.judul,
        this.seolink,
        this.status,
        this.kategori,
        this.permasalahan,
        this.instansi,
        this.instansiLabel,
        this.atasnama,
        this.champaigner,
        this.donasi,
        this.target,
        this.terkumpul,
        this.persentase,
        this.cover,
        this.hingga,
        this.crdt,
        this.terpakai,
        this.sisadana,
    });

    String nama;
    List<String> medsos;
    String aboutme;
    String judul;
    String seolink;
    String status;
    String kategori;
    String permasalahan;
    String instansi;
    String instansiLabel;
    String atasnama;
    String champaigner;
    String donasi;
    String target;
    String terkumpul;
    String persentase;
    String cover;
    String hingga;
    DateTime crdt;
    String terpakai;
    String sisadana;

    factory DonasiMePatner.fromJson(Map<String, dynamic> json) => DonasiMePatner(
        nama: json["nama"] == null ? null : json["nama"],
        medsos: json["medsos"] == null ? null : List<String>.from(json["medsos"].map((x) => x)),
        aboutme: json["aboutme"] == null ? null : json["aboutme"],
        judul: json["judul"] == null ? null : json["judul"],
        seolink: json["seolink"] == null ? null : json["seolink"],
        status: json["status"] == null ? null : json["status"],
        kategori: json["kategori"] == null ? null : json["kategori"],
        permasalahan: json["permasalahan"] == null ? null : json["permasalahan"],
        instansi: json["instansi"] == null ? null : json["instansi"],
        instansiLabel: json["instansi_label"] == null ? null : json["instansi_label"],
        atasnama: json["atasnama"] == null ? null : json["atasnama"],
        champaigner: json["champaigner"] == null ? null : json["champaigner"],
        donasi: json["donasi"] == null ? null : json["donasi"],
        target: json["target"] == null ? null : json["target"],
        terkumpul: json["terkumpul"] == null ? null : (json["terkumpul"]).toString(),
        persentase: json["persentase"] == null ? null : (json["persentase"]).toString(),
        cover: json["cover"] == null ? null : json["cover"],
        hingga: json["hingga"] == null ? null : json["hingga"],
        crdt: json["crdt"] == null ? null : DateTime.parse(json["crdt"]),
        terpakai: json["terpakai"] == null ? null : json["terpakai"],
        sisadana: json["sisadana"] == null ? null : json["sisadana"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama == null ? null : nama,
        "medsos": medsos == null ? null : List<dynamic>.from(medsos.map((x) => x)),
        "aboutme": aboutme == null ? null : aboutme,
        "judul": judul == null ? null : judul,
        "seolink": seolink == null ? null : seolink,
        "status": status == null ? null : status,
        "kategori": kategori == null ? null : kategori,
        "permasalahan": permasalahan == null ? null : permasalahan,
        "instansi": instansi == null ? null : instansi,
        "instansi_label": instansiLabel == null ? null : instansiLabel,
        "atasnama": atasnama == null ? null : atasnama,
        "champaigner": champaigner == null ? null : champaigner,
        "donasi": donasi == null ? null : donasi,
        "target": target == null ? null : target,
        "terkumpul": terkumpul == null ? null : terkumpul.toString(),
        "persentase": persentase == null ? null : persentase.toString(),
        "cover": cover == null ? null : cover,
        "hingga": hingga == null ? null : hingga,
        "crdt": crdt == null ? null : crdt.toIso8601String(),
        "terpakai": terpakai == null ? null : terpakai,
        "sisadana": sisadana == null ? null : sisadana,
    };
}
