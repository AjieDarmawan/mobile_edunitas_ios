import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) =>
    List<TransactionModel>.from(
        json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  TransactionModel({
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
  String logo;
  String singkatan;
  String kode;
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

  Params params;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
         id: json["id"] == null ? null : json["id"],
        billtype: json["billtype"] == null ? null : json["billtype"],
        noinvoice: json["noinvoice"] == null ? null : json["noinvoice"],
        totalpembayaran:
            json["totalpembayaran"] == null ? null : json["totalpembayaran"],
        status: json["status"] == null ? null : json["status"],
        nama: json["nama"] == null ? null : json["nama"],
        kampus: json["kampus"] == null ? null : json["kampus"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        kelas: json["kelas"] == null ? null : json["kelas"],
        logo: json["logo"] == null ? null : json["logo"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        kode: json["kode"] == null ? null : json["kode"],
        waktu: json["waktu"] == null ? null : json["waktu"],
        formulir: json["formulir"] == null ? null : json["formulir"],
        formulir_qty:
            json["formulir_qty"] == null ? null : json["formulir_qty"],
        formulir_harga:
            json["formulir_harga"] == null ? null : json["formulir_harga"],
        jaket: json["jaket"] == null ? null : json["jaket"],
        jaket_qty: json["jaket_qty"] == null ? null : json["jaket_qty"],
        jaket_harga: json["jaket_harga"] == null ? null : json["jaket_harga"],
        spb: json["spb"] == null ? null : json["spb"],
        spb_qty: json["spb_qty"] == null ? null : json["spb_qty"],
        spb_harga: json["spb_harga"] == null ? null : json["spb_harga"],
        spp: json["spp"] == null ? null : json["spp"],
        spp_qty: json["spp_qty"] == null ? null : json["spp_qty"],
        spp_harga: json["spp_harga"] == null ? null : json["spp_harga"],
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        setiap: json["setiap"] == null ? null : json["setiap"],
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
        "logo": logo == null ? null : logo,
        "singkatan": singkatan == null ? null : singkatan,
        "kode": kode == null ? null : kode,
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
        "params": params == null ? null : params.toJson(),
      };
}

enum Billtype {
  KONFIRMASI_PEMABAYARAN_FORMULIR,
  KONFIRMASI_PEMABAYARAN_PENDAFTARAN,
  KONFIRMASI_PEMABAYARAN_BULANAN
}

final billtypeValues = EnumValues({
  "KONFIRMASI PEMABAYARAN BULANAN": Billtype.KONFIRMASI_PEMABAYARAN_BULANAN,
  "KONFIRMASI PEMABAYARAN FORMULIR": Billtype.KONFIRMASI_PEMABAYARAN_FORMULIR,
  "KONFIRMASI PEMABAYARAN PENDAFTARAN":
      Billtype.KONFIRMASI_PEMABAYARAN_PENDAFTARAN
});

enum Kampus {
  UNIVERSITAS_IT_GILAND_GANESHA,
  POLITEKNIK_NASIONAL_DENPASAR,
  INSTITUT_SAINS_DAN_TEKNOLOGI_AL_KAMAL
}

final kampusValues = EnumValues({
  "Institut Sains dan Teknologi Al Kamal":
      Kampus.INSTITUT_SAINS_DAN_TEKNOLOGI_AL_KAMAL,
  "Politeknik Nasional Denpasar": Kampus.POLITEKNIK_NASIONAL_DENPASAR,
  "Universitas IT Giland Ganesha": Kampus.UNIVERSITAS_IT_GILAND_GANESHA
});

enum Kode { ZZZ, PL, AK }

final kodeValues = EnumValues({"ak": Kode.AK, "pl": Kode.PL, "zzz": Kode.ZZZ});

enum Noinvoice {
  THE_2021041208070537,
  THE_2021040502561325,
  MAR0022320239_2020281475
}

final noinvoiceValues = EnumValues({
  "MAR0022320239-20202814-75": Noinvoice.MAR0022320239_2020281475,
  "2021040502561325": Noinvoice.THE_2021040502561325,
  "2021041208070537": Noinvoice.THE_2021041208070537
});

class Params {
  Params({
    this.formulir,
    this.jaket,
    this.spb,
    this.spp,
  });

  Formulir formulir;
  Jaket jaket;
  Spb spb;
  Spp spp;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        formulir: json["formulir"] == null
            ? null
            : Formulir.fromJson(json["formulir"]),
        jaket: json["jaket"] == null ? null : Jaket.fromJson(json["jaket"]),
        spb: json["spb"] == null ? null : Spb.fromJson(json["spb"]),
        spp: json["spp"] == null ? null : Spp.fromJson(json["spp"]),
      );

  Map<String, dynamic> toJson() => {
        "formulir": formulir == null ? null : formulir.toJson(),
        "jaket": jaket == null ? null : jaket.toJson(),
        "spb": spb == null ? null : spb.toJson(),
        "spp": spp == null ? null : spp.toJson(),
      };
}

class Formulir {
  Formulir({
    this.formulirQty,
    this.formulirHarga,
  });

  String formulirQty;
  String formulirHarga;

  factory Formulir.fromJson(Map<String, dynamic> json) => Formulir(
        formulirQty: json["formulir_qty"] == null ? null : json["formulir_qty"],
        formulirHarga:
            json["formulir_harga"] == null ? null : json["formulir_harga"],
      );

  Map<String, dynamic> toJson() => {
        "formulir_qty": formulirQty == null ? null : formulirQty,
        "formulir_harga": formulirHarga == null ? null : formulirHarga,
      };
}

class Jaket {
  Jaket({
    this.jaketQty,
    this.jaketHarga,
  });

  String jaketQty;
  String jaketHarga;

  factory Jaket.fromJson(Map<String, dynamic> json) => Jaket(
        jaketQty: json["jaket_qty"] == null ? null : json["jaket_qty"],
        jaketHarga: json["jaket_harga"] == null ? null : json["jaket_harga"],
      );

  Map<String, dynamic> toJson() => {
        "jaket_qty": jaketQty == null ? null : jaketQty,
        "jaket_harga": jaketHarga == null ? null : jaketHarga,
      };
}

class Spb {
  Spb({
    this.spbQty,
    this.spbHarga,
  });

  String spbQty;
  String spbHarga;

  factory Spb.fromJson(Map<String, dynamic> json) => Spb(
        spbQty: json["spb_qty"] == null ? null : json["spb_qty"],
        spbHarga: json["spb_harga"] == null ? null : json["spb_harga"],
      );

  Map<String, dynamic> toJson() => {
        "spb_qty": spbQty == null ? null : spbQty,
        "spb_harga": spbHarga == null ? null : spbHarga,
      };
}

class Spp {
  Spp({
    this.sppQty,
    this.sppHarga,
  });

  String sppQty;
  String sppHarga;

  factory Spp.fromJson(Map<String, dynamic> json) => Spp(
        sppQty: json["spp_qty"] == null ? null : json["spp_qty"],
        sppHarga: json["spp_harga"] == null ? null : json["spp_harga"],
      );

  Map<String, dynamic> toJson() => {
        "spp_qty": sppQty == null ? null : sppQty,
        "spp_harga": sppHarga == null ? null : sppHarga,
      };
}

enum Singkatan { KAMPUS_DEMO_IT, POLNAS, ISTA }

final singkatanValues = EnumValues({
  "ISTA": Singkatan.ISTA,
  "Kampus Demo IT": Singkatan.KAMPUS_DEMO_IT,
  "POLNAS": Singkatan.POLNAS
});

enum Totalpembayaran { THE_100000, TOTALPEMBAYARAN_100000, EMPTY }

final totalpembayaranValues = EnumValues({
  "": Totalpembayaran.EMPTY,
  " 100000": Totalpembayaran.THE_100000,
  "   100000": Totalpembayaran.TOTALPEMBAYARAN_100000
});

enum Waktu { TANGGAL_12_APR_2021, TANGGAL_05_APR_2021, TANGGAL_28_MAR_2020 }

final waktuValues = EnumValues({
  "Tanggal : 05-Apr-2021": Waktu.TANGGAL_05_APR_2021,
  "Tanggal : 12-Apr-2021": Waktu.TANGGAL_12_APR_2021,
  "Tanggal : 28-Mar-2020": Waktu.TANGGAL_28_MAR_2020
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
