import 'dart:convert';

List<Transaction2Model> transaction2ModelFromJson(String str) => List<Transaction2Model>.from(json.decode(str).map((x) => Transaction2Model.fromJson(x)));

String transaction2ModelToJson(List<Transaction2Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction2Model {
    Transaction2Model({
        this.id,
        this.billtype,
        this.noinvoice,
        this.totalpembayaran,
        this.status,
        this.nama,
        this.kampus,
        this.prodi,
        this.kelas,
        this.singkatan,
        this.kode,
        this.logo,
        this.waktu,
        this.formulir,
        this.formulir_qty,
        this.formulir_harga,
        this.jaket,
        this.jaket_qty,
        this.jaket_harga,
        this.spb,
        this.spb_qty,
        this.spb_harga,
        this.spp,
        this.spp_qty,
        this.spp_harga,
        this.params,
        this.setiap,
    });

    String id;
    String billtype;
    String noinvoice;
    String totalpembayaran;
    String status;
    String nama;
    String kampus;
    String prodi;
    String kelas;
    String singkatan;
    String kode;
    String logo;
    String waktu;
    String formulir;
    String formulir_qty;
    String formulir_harga;
    String jaket;
    String jaket_qty;
    String jaket_harga;
    String spb;
    String spb_qty;
    String spb_harga;
    String spp;
    String spp_qty;
    String spp_harga;
    String setiap;
    List<String> params;

    factory Transaction2Model.fromJson(Map<String, dynamic> json) => Transaction2Model(
        id: json["id"] == null ? null : json["id"],
        billtype: json["billtype"] == null ? null : json["billtype"],
        noinvoice: json["noinvoice"] == null ? null : json["noinvoice"],
        totalpembayaran: json["totalpembayaran"] == null ? null : json["totalpembayaran"],
        status: json["status"] == null ? null : json["status"],
        nama: json["nama"] == null ? null : json["nama"],
        kampus: json["kampus"] == null ? null : json["kampus"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        kelas: json["kelas"] == null ? null : json["kelas"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        kode: json["kode"] == null ? null : json["kode"],
        logo: json["logo"] == null ? null : json["logo"],
        waktu: json["waktu"] == null ? null : json["waktu"],
        formulir: json["formulir"] == null ? null : json["formulir"],
        formulir_qty: json["formulir_qty"] == null ? null : json["formulir_qty"],
        formulir_harga: json["formulir_harga"] == null ? null : json["formulir_harga"],
        jaket: json["jaket"] == null ? null : json["jaket"],
        jaket_qty: json["jaket_qty"] == null ? null : json["jaket_qty"],
        jaket_harga: json["jaket_harga"] == null ? null : json["jaket_harga"],
        spb: json["spb"] == null ? null : json["spb"],
        spb_qty: json["spb_qty"] == null ? null : json["spb_qty"],
        spb_harga: json["spb_harga"] == null ? null : json["spb_harga"],
        spp: json["spp"] == null ? null : json["spp"],
        spp_qty: json["spp_qty"] == null ? null : json["spp_qty"],
        spp_harga: json["spp_harga"] == null ? null : json["spp_harga"],
        setiap: json["setiap"] == null ? null : json["setiap"],
        params: json["params"] == null ? null : List<String>.from(json["params"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "billtype": billtype == null ? null : billtype,
        "noinvoice": noinvoice == null ? null : noinvoice,
        "totalpembayaran": totalpembayaran == null ? null : totalpembayaran,
        "status": status == null ? null : status,
        "nama": nama == null ? null : nama,
        "kampus": kampus == null ? null : kampus,
        "prodi": prodi == null ? null : prodi,
        "kelas": kelas == null ? null : kelas,
        "singkatan": singkatan == null ? null : singkatan,
        "kode": kode == null ? null : kode,
        "logo": logo == null ? null : logo,
        "waktu": waktu == null ? null : waktu,
        "formulir": formulir == null ? null : formulir,
        "formulir_qty": formulir_qty == null ? null : formulir_qty,
        "formulir_harga": formulir_harga == null ? null : formulir_harga,
        "jaket": jaket == null ? null : jaket,
        "jaket_qty": jaket_qty == null ? null : jaket_qty,
        "jaket_harga": jaket_harga == null ? null : jaket_harga,
        "spb": spb == null ? null : spb,
        "spb_qty": spb_qty == null ? null : spb_qty,
        "spb_harga": spb_harga == null ? null : spb_harga,
        "spp": spp == null ? null : spp,
        "spp_qty": spp_qty == null ? null : spp_qty,
        "spp_harga": spp_harga == null ? null : spp_harga,
        "setiap": setiap == null ? null : setiap,
        "params": params == null ? null : List<dynamic>.from(params.map((x) => x)),
    };
}
