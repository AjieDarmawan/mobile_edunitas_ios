// To parse this JSON data, do
//
//     final detailCampusModel2 = detailCampusModel2FromJson(jsonString);

import 'dart:convert';

DetailCampusModel2 detailCampusModel2FromJson(String str) => DetailCampusModel2.fromJson(json.decode(str));

String detailCampusModel2ToJson(DetailCampusModel2 data) => json.encode(data.toJson());

class DetailCampusModel2 {
    DetailCampusModel2({
        this.rektorJabatan,
        this.rektor,
        this.rektorImg,
        this.pts,
        this.noPts,
        this.singkatan1,
        this.sangatpendek,
        this.thBerdiri,
        this.warnaPts,
        this.alamat1,
        this.alamat2,
        this.alamat3,
        this.namaPanjang,
        this.adaS2,
        this.adaS3,
        this.adaD3,
        this.beasiswa,
        this.linkGalerifoto,
        this.linkPeta,
        this.syaratPendaftaran,
        this.waktuKuliah,
        this.profile,
        this.visiMisi,
        this.linkYoutubePendek,
        this.gambar_youtube,
        this.smtPendek,
        this.smtPanjang,
        this.smtPendekReg,
        this.smtPanjangReg,
        this.foto,
        this.kend,
    });

    String rektorJabatan;
    String rektor;
    String rektorImg;
    String pts;
    String noPts;
    String singkatan1;
    String sangatpendek;
    String thBerdiri;
    String warnaPts;
    String alamat1;
    String alamat2;
    String alamat3;
    String namaPanjang;
    String adaS2;
    String adaS3;
    String adaD3;
    String beasiswa;
    String linkGalerifoto;
    String linkPeta;
    String syaratPendaftaran;
    String waktuKuliah;
    String profile;
    String visiMisi;
    String linkYoutubePendek;
    String gambar_youtube;
    String smtPendek;
    String smtPanjang;
    String smtPendekReg;
    String smtPanjangReg;
    List<String> foto;
    List<Kend> kend;

    factory DetailCampusModel2.fromJson(Map<String, dynamic> json) => DetailCampusModel2(
        rektorJabatan: json["rektor_jabatan"] == null ? null : json["rektor_jabatan"],
        rektor: json["rektor"] == null ? null : json["rektor"],
        rektorImg: json["rektor_img"] == null ? null : json["rektor_img"],
        pts: json["pts"] == null ? null : json["pts"],
        noPts: json["no_pts"] == null ? null : json["no_pts"],
        singkatan1: json["singkatan1"] == null ? null : json["singkatan1"],
        sangatpendek: json["sangatpendek"] == null ? null : json["sangatpendek"],
        thBerdiri: json["th_berdiri"] == null ? null : json["th_berdiri"],
        warnaPts: json["warna_pts"] == null ? null : json["warna_pts"],
        alamat1: json["alamat_1"] == null ? null : json["alamat_1"],
        alamat2: json["alamat_2"] == null ? null : json["alamat_2"],
        alamat3: json["alamat_3"] == null ? null : json["alamat_3"],
        namaPanjang: json["nama_panjang"] == null ? null : json["nama_panjang"],
        adaS2: json["ada_S2"] == null ? null : json["ada_S2"],
        adaS3: json["ada_S3"] == null ? null : json["ada_S3"],
        adaD3: json["ada_D3"] == null ? null : json["ada_D3"],
        beasiswa: json["beasiswa"] == null ? null : json["beasiswa"],
        linkGalerifoto: json["link_galerifoto"] == null ? null : json["link_galerifoto"],
        linkPeta: json["link_peta"] == null ? null : json["link_peta"],
        syaratPendaftaran: json["syarat_pendaftaran"] == null ? null : json["syarat_pendaftaran"],
        waktuKuliah: json["waktu_kuliah"] == null ? null : json["waktu_kuliah"],
        profile: json["profile"] == null ? null : json["profile"],
        visiMisi: json["visi_misi"] == null ? null : json["visi_misi"],
        linkYoutubePendek: json["link_youtube_pendek"] == null ? null : json["link_youtube_pendek"],
        gambar_youtube: json["gambar_youtube"] == null ? null : json["gambar_youtube"],
        smtPendek: json["smt_pendek"] == null ? null : json["smt_pendek"],
        smtPanjang: json["smt_panjang"] == null ? null : json["smt_panjang"],
        smtPendekReg: json["smt_pendek_reg"] == null ? null : json["smt_pendek_reg"],
        smtPanjangReg: json["smt_panjang_reg"] == null ? null : json["smt_panjang_reg"],
        foto: json["foto"] == null ? null : List<String>.from(json["foto"].map((x) => x)),
        kend: json["kend"] == null ? null : List<Kend>.from(json["kend"].map((x) => Kend.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rektor_jabatan": rektorJabatan == null ? null : rektorJabatan,
        "rektor": rektor == null ? null : rektor,
        "rektor_img": rektorImg == null ? null : rektorImg,
        "pts": pts == null ? null : pts,
        "no_pts": noPts == null ? null : noPts,
        "singkatan1": singkatan1 == null ? null : singkatan1,
        "sangatpendek": sangatpendek == null ? null : sangatpendek,
        "th_berdiri": thBerdiri == null ? null : thBerdiri,
        "warna_pts": warnaPts == null ? null : warnaPts,
        "alamat_1": alamat1 == null ? null : alamat1,
        "alamat_2": alamat2 == null ? null : alamat2,
        "alamat_3": alamat3 == null ? null : alamat3,
        "nama_panjang": namaPanjang == null ? null : namaPanjang,
        "ada_S2": adaS2 == null ? null : adaS2,
        "ada_S3": adaS3 == null ? null : adaS3,
        "ada_D3": adaD3 == null ? null : adaD3,
        "beasiswa": beasiswa == null ? null : beasiswa,
        "link_galerifoto": linkGalerifoto == null ? null : linkGalerifoto,
        "link_peta": linkPeta == null ? null : linkPeta,
        "syarat_pendaftaran": syaratPendaftaran == null ? null : syaratPendaftaran,
        "waktu_kuliah": waktuKuliah == null ? null : waktuKuliah,
        "profile": profile == null ? null : profile,
        "visi_misi": visiMisi == null ? null : visiMisi,
        "link_youtube_pendek": linkYoutubePendek == null ? null : linkYoutubePendek,
         "gambar_youtube": gambar_youtube == null ? null : gambar_youtube,
        "smt_pendek": smtPendek == null ? null : smtPendek,
        "smt_panjang": smtPanjang == null ? null : smtPanjang,
        "smt_pendek_reg": smtPendekReg == null ? null : smtPendekReg,
        "smt_panjang_reg": smtPanjangReg == null ? null : smtPanjangReg,
        "foto": foto == null ? null : List<dynamic>.from(foto.map((x) => x)),
        "kend": kend == null ? null : List<dynamic>.from(kend.map((x) => x.toJson())),
    };
}

class Kend {
    Kend({
        this.angkutan,
        this.rute,
    });

    String angkutan;
    String rute;

    factory Kend.fromJson(Map<String, dynamic> json) => Kend(
        angkutan: json["angkutan"] == null ? null : json["angkutan"],
        rute: json["rute"] == null ? null : json["rute"],
    );

    Map<String, dynamic> toJson() => {
        "angkutan": angkutan == null ? null : angkutan,
        "rute": rute == null ? null : rute,
    };
}
