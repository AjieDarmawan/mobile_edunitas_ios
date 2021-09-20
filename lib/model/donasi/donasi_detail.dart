import 'dart:convert';

DonasiDetailModel detailDonasiDetailModelFromJson(String str) =>
    DonasiDetailModel.fromJson(json.decode(str));

String detailDonasiDetailModelToJson(DonasiDetailModel data) =>
    json.encode(data.toJson());

class DonasiDetailModel {
  DonasiDetailModel({
    this.judul,
    this.seolink,
    this.status,
    this.kategori,
    this.permasalahan,
    this.permasalahan_label,
    this.instansi,
    this.instansi_label,
    this.atasnama,
    this.ajakan,
    this.cerita,
    this.rincian,
    this.champaigner,
    this.donasi,
    this.targetv,
    this.target,
    this.terkumpul,
    this.persentase,
    this.cover,
    this.expired,
    this.hinggav,
    this.hingga,
    this.crdt,
    this.nama,
    this.medsos,
    this.aboutme,
    this.nowa,
    this.penerima,
    this.namapenerima,
    this.hubpenerima,
    this.idpenerima,
    this.pencairan,
    this.bank,
    this.norek,
    this.namarek,
    this.penyaluran,
    this.terpakai,
    this.sisadana,
    this.cid,
  });

  String judul;
  String seolink;
  String status;
  String kategori;
  String permasalahan;
  String permasalahan_label;
  String instansi;
  String instansi_label;
  String atasnama;
  String ajakan;
  String cerita;
  String rincian;
  String champaigner;
  String donasi;
  String targetv;
  String target;
  String terkumpul;
  String persentase;
  String cover;
  String expired;
  String hinggav;
  String hingga;
  String crdt;
  String nama;
  List medsos;
  String aboutme;
  String nowa;
  String penerima;
  String namapenerima;
  String hubpenerima;
  String idpenerima;
  String pencairan;
  String bank;
  String norek;
  String namarek;
  String penyaluran;
  String terpakai;
  String sisadana;
  String cid;

  factory DonasiDetailModel.fromJson(Map<String, dynamic> json) =>
      DonasiDetailModel(
        judul: json["judul"] == null ? null : json["judul"],
        seolink: json["seolink"] == null ? null : json["seolink"],
        status: json["status"] == null ? null : json["status"],
        kategori: json["kategori"] == null ? null : json["kategori"],
        permasalahan:
            json["permasalahan"] == null ? null : json["permasalahan"],
        permasalahan_label: json["permasalahan_label"] == null
            ? null
            : json["permasalahan_label"],
        instansi: json["instansi"] == null ? null : json["instansi"],
        instansi_label:
            json["instansi_label"] == null ? null : json["instansi_label"],
        atasnama: json["atasnama"] == null ? null : json["atasnama"],
        ajakan: json["ajakan"] == null ? null : json["ajakan"],
        cerita: json["cerita"] == null ? null : json["cerita"],
        rincian: json["rincian"] == null ? null : json["rincian"],
        champaigner: json["champaigner"] == null ? null : json["champaigner"],
        donasi: json["donasi"] == null ? null : json["donasi"],
        targetv: json["targetv"] == null ? null : json["targetv"],
        target: json["target"] == null ? null : json["target"],
        terkumpul: json["terkumpul"] == null ? null : (json["terkumpul"]).toString(),
        persentase: json["persentase"] == null ? null : (json["persentase"]).toString(),
        cover: json["cover"] == null ? null : json["cover"],
        expired: json["expired"] == null ? null : json["expired"],
        hinggav: json["hinggav"] == null ? null : json["hinggav"],
        hingga: json["hingga"] == null ? null : json["hingga"],
        crdt: json["crdt"] == null ? null : json["crdt"],
        nama: json["nama"] == null ? null : json["nama"],
        medsos: json["medsos"] == null ? null : json["medsos"],
        aboutme: json["aboutme"] == null ? null : json["aboutme"],
        nowa: json["nowa"] == null ? null : json["nowa"],
        penerima: json["penerima"] == null ? null : json["penerima"],
        namapenerima:
            json["namapenerima"] == null ? null : json["namapenerima"],
        hubpenerima: json["hubpenerima"] == null ? null : json["hubpenerima"],
        idpenerima: json["idpenerima"] == null ? null : json["idpenerima"],
        pencairan: json["pencairan"] == null ? null : json["pencairan"],
        bank: json["bank"] == null ? null : json["bank"],
        norek: json["norek"] == null ? null : json["norek"],
        namarek: json["namarek"] == null ? null : json["namarek"],
        penyaluran: json["penyaluran"] == null ? null : json["penyaluran"],
        terpakai: json["terpakai"] == null ? null : json["terpakai"],
        sisadana: json["sisadana"] == null ? null : json["sisadana"],
        cid: json["cid"] == null ? null : json["cid"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid == null ? null : cid,
        "judul": judul == null ? null : judul,
        "seolink": seolink == null ? null : seolink,
        "status": status == null ? null : status,
        "kategori": kategori == null ? null : kategori,
        "permasalahan": permasalahan == null ? null : permasalahan,
        "permasalahan_label": permasalahan_label == null ? null : permasalahan_label,
        "instansi": instansi == null ? null : instansi,
        "instansi_label": instansi_label == null ? null : instansi_label,
        "atasnama": atasnama == null ? null : atasnama,
        "ajakan": ajakan == null ? null : ajakan,
        "cerita": cerita == null ? null : cerita,
        "rincian": rincian == null ? null : rincian,
        "champaigner": champaigner == null ? null : champaigner,
        "donasi": donasi == null ? null : donasi,
        "targetv": targetv == null ? null : targetv,
        "target": target == null ? null : target,
        "terkumpul": terkumpul == null ? null : terkumpul,
        "persentase": persentase == null ? null : persentase,
        "cover": cover == null ? null : cover,
        "expired": expired == null ? null : expired,
        "hinggav": hinggav == null ? null : hinggav,
        "hingga": hingga == null ? null : hingga,
        "crdt": crdt == null ? null : crdt,
        "nama": nama == null ? null : nama,
        "medsos": medsos == null ? null : medsos,
        "aboutme": aboutme == null ? null : aboutme,
        "nowa": nowa == null ? null : nowa,
        "penerima": penerima == null ? null : penerima,
        "namapenerima": namapenerima == null ? null : namapenerima,
        "hubpenerima": hubpenerima == null ? null : hubpenerima,
        "idpenerima": idpenerima == null ? null : idpenerima,
        "pencairan": pencairan == null ? null : pencairan,
        "bank": bank == null ? null : bank,
        "norek": norek == null ? null : norek,
        "namarek": namarek == null ? null : namarek,
        "penyaluran": penyaluran == null ? null : penyaluran,
        "terpakai": terpakai == null ? null : terpakai,
        "sisadana": sisadana == null ? null : sisadana,
        "cid": cid == null ? null : cid,
      };
}
