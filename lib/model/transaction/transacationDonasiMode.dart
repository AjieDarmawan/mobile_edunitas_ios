// To parse this JSON data, do
//
//     final transactionDonasiModel = transactionDonasiModelFromJson(jsonString);

import 'dart:convert';

List<TransactionDonasiModel> transactionDonasiModelFromJson(String str) =>
    List<TransactionDonasiModel>.from(
        json.decode(str).map((x) => TransactionDonasiModel.fromJson(x)));

String transactionDonasiModelToJson(List<TransactionDonasiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionDonasiModel {
  TransactionDonasiModel({
    this.cid,
    this.kode,
    this.billtype,
    this.label,
    this.tanggal,
    this.title,
    this.subtitle,
    this.expired,
    this.trx_id,
    this.nopembayaran,
    this.donaturname,
    this.isanonim,
    this.nominal,
    this.namalengkap,
    this.notlp,
    this.nowa,
    this.email,
    this.keycode,
    this.champaigner,
    this.judul,
    this.novirtualBni,
    this.channel,
    this.method,
    this.prodi,
    this.waktu,
    this.nominaltrf,
    this.nama,
    this.singkatan,
    this.logo,
    this.cover,
    this.tanggalBayar,
    this.noreff,
    this.chanel,
    this.totalpembayaran,
    this.buktibayar,
    this.bank,
    this.metode,
    this.txtdate,
    this.txttime,
    this.date,
    this.time,
    this.txtbank,
    this.images,
    this.kampus,
    this.seolink,
    this.nama_bank,
  });

  String cid;
  String kode;
  String billtype;
  String label;
  String tanggal;
  String title;
  String subtitle;
  String expired;
  String trx_id;
  String nopembayaran;
  String donaturname;
  String isanonim;
  String nominal;
  String namalengkap;
  String notlp;
  String nowa;
  String email;
  String keycode;
  String champaigner;
  String judul;
  String novirtualBni;
  String channel;
  String method;
  String prodi;
  String waktu;
  int nominaltrf;
  String nama;
  String singkatan;
  String logo;
  String cover;
  String tanggalBayar;
  String noreff;
  String chanel;
  int totalpembayaran;
  String buktibayar;
  String bank;
  String metode;
  String txtdate;
  String txttime;
  String date;
  String time;
  String txtbank;
  String images;
  String kampus;
  String seolink;
  String nama_bank;

  factory TransactionDonasiModel.fromJson(Map<String, dynamic> json) =>
      TransactionDonasiModel(
        cid: json["cid"] == null ? null : json["cid"],
        kode: json["kode"] == null ? null : json["kode"],
        billtype: json["billtype"] == null ? null : json["billtype"],
        label: json["label"] == null ? null : json["label"],
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        expired: json["expired"] == null ? null : json["expired"],
        trx_id: json["trx_id"] == null ? null : json["trx_id"],
        nopembayaran:
            json["nopembayaran"] == null ? null : json["nopembayaran"],
        donaturname: json["donaturname"] == null ? null : json["donaturname"],
        isanonim: json["isanonim"] == null ? null : json["isanonim"],
        nominal: json["nominal"] == null ? null : json["nominal"],
        namalengkap: json["namalengkap"] == null ? null : json["namalengkap"],
        notlp: json["notlp"] == null ? null : json["notlp"],
        nowa: json["nowa"] == null ? null : json["nowa"],
        email: json["email"] == null ? null : json["email"],
        keycode: json["keycode"] == null ? null : json["keycode"],
        champaigner: json["champaigner"] == null ? null : json["champaigner"],
        judul: json["judul"] == null ? null : json["judul"],
        novirtualBni:
            json["novirtual_bni"] == null ? null : json["novirtual_bni"],
        channel: json["channel"] == null ? null : json["channel"],
        method: json["method"] == null ? null : json["method"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        waktu: json["waktu"] == null ? null : json["waktu"],
        nominaltrf: json["nominaltrf"] == null ? null : json["nominaltrf"],
        nama: json["nama"] == null ? null : json["nama"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        logo: json["logo"] == null ? null : json["logo"],
        cover: json["cover"] == null ? null : json["cover"],
        tanggalBayar:
            json["tanggal_bayar"] == null ? null : json["tanggal_bayar"],
        noreff: json["noreff"] == null ? null : json["noreff"],
        chanel: json["chanel"] == null ? null : json["chanel"],
        totalpembayaran:
            json["totalpembayaran"] == null ? null : json["totalpembayaran"],
        buktibayar: json["buktibayar"] == null ? null : json["buktibayar"],
        bank: json["bank"] == null ? null : json["bank"],
        metode: json["metode"] == null ? null : json["metode"],
        txtdate: json["txtdate"] == null ? null : json["txtdate"],
        txttime: json["txttime"] == null ? null : json["txttime"],
        date: json["date"] == null ? null : json["date"],
        time: json["time"] == null ? null : json["time"],
        txtbank: json["txtbank"] == null ? null : json["txtbank"],
        images: json["images"] == null ? null : json["images"],
        kampus: json["kampus"] == null ? null : json["kampus"],
        seolink: json["seolink"] == null ? null : json["seolink"],
        nama_bank: json["nama_bank"] == null ? null : json["nama_bank"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid == null ? null : cid,
        "kode": kode == null ? null : kode,
        "billtype": billtype == null ? null : billtype,
        "label": label == null ? null : label,
        "tanggal": tanggal == null ? null : tanggal,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "expired": expired == null ? null : expired,
        "trx_id": trx_id == null ? null : trx_id,
        "nopembayaran": nopembayaran == null ? null : nopembayaran,
        "donaturname": donaturname == null ? null : donaturname,
        "isanonim": isanonim == null ? null : isanonim,
        "nominal": nominal == null ? null : nominal,
        "namalengkap": namalengkap == null ? null : namalengkap,
        "notlp": notlp == null ? null : notlp,
        "nowa": nowa == null ? null : nowa,
        "email": email == null ? null : email,
        "keycode": keycode == null ? null : keycode,
        "champaigner": champaigner == null ? null : champaigner,
        "judul": judul == null ? null : judul,
        "novirtual_bni": novirtualBni == null ? null : novirtualBni,
        "channel": channel == null ? null : channel,
        "method": method == null ? null : method,
        "prodi": prodi == null ? null : prodi,
        "waktu": waktu == null ? null : waktu,
        "nominaltrf": nominaltrf == null ? null : nominaltrf,
        "nama": nama == null ? null : nama,
        "singkatan": singkatan == null ? null : singkatan,
        "logo": logo == null ? null : logo,
        "cover": cover == null ? null : cover,
        "tanggal_bayar": tanggalBayar == null ? null : tanggalBayar,
        "noreff": noreff == null ? null : noreff,
        "chanel": chanel == null ? null : chanel,
        "totalpembayaran": totalpembayaran == null ? null : totalpembayaran,
        "buktibayar": buktibayar == null ? null : buktibayar,
        "bank": bank == null ? null : bank,
        "metode": metode == null ? null : metode,
        "txtdate": txtdate == null ? null : txtdate,
        "txttime": txttime == null ? null : txttime,
        "date": date == null ? null : date,
        "time": time == null ? null : time,
        "txtbank": txtbank == null ? null : txtbank,
        "images": images == null ? null : images,
        "kampus": kampus == null ? null : kampus,
        "seolink": seolink == null ? null : seolink,
        "nama_bank": nama_bank == null ? null : nama_bank,
      };
}

enum Billtype { ME_EDUDONATION }

final billtypeValues = EnumValues({"me-edudonation": Billtype.ME_EDUDONATION});

enum Champaigner { TEST_LEMBAGA }

final champaignerValues =
    EnumValues({"TEST Lembaga": Champaigner.TEST_LEMBAGA});

enum Chanel { EMPTY }

final chanelValues = EnumValues({"--": Chanel.EMPTY});

enum Donaturname { DANIYAL_TEST_DAFTAR_EDU_DONATION }

final donaturnameValues = EnumValues({
  "Daniyal Test Daftar - eduDonation":
      Donaturname.DANIYAL_TEST_DAFTAR_EDU_DONATION
});

enum Email { DANIYAL_HAFIDZ_GMAIL_COM }

final emailValues =
    EnumValues({"daniyal.hafidz@gmail.com": Email.DANIYAL_HAFIDZ_GMAIL_COM});

enum Images { A }

final imagesValues = EnumValues({"a": Images.A});

enum Judul { TEST_PUBLISH_EDU_DONATION_20200923 }

final judulValues = EnumValues({
  "Test Publish eduDonation 20200923": Judul.TEST_PUBLISH_EDU_DONATION_20200923
});

enum Keycode { THE_421_FB8_EDF19461_B0_EB375_DA1_C4_F58332717_D0_F95 }

final keycodeValues = EnumValues({
  "421fb8edf19461b0eb375da1c4f58332717d0f95":
      Keycode.THE_421_FB8_EDF19461_B0_EB375_DA1_C4_F58332717_D0_F95
});

enum Label { TERBAYAR }

final labelValues = EnumValues({"Terbayar": Label.TERBAYAR});

enum Metode { TRF }

final metodeValues = EnumValues({"trf": Metode.TRF});

enum Nama { BANK_MANDIRI }

final namaValues = EnumValues({"Bank Mandiri": Nama.BANK_MANDIRI});

enum Namalengkap { DANIYAL_TEST_DAFTAR }

final namalengkapValues =
    EnumValues({"Daniyal Test Daftar": Namalengkap.DANIYAL_TEST_DAFTAR});

enum Noreff { EDN10000004_430 }

final noreffValues = EnumValues({"EDN10000004-430": Noreff.EDN10000004_430});

enum Singkatan { MANDIRI }

final singkatanValues = EnumValues({"MANDIRI": Singkatan.MANDIRI});

enum Tanggal { THE_23_SEP_2020 }

final tanggalValues = EnumValues({"23 Sep 2020": Tanggal.THE_23_SEP_2020});

enum Title { KONFIRMASI_PEMBAYARAN_DONASI }

final titleValues = EnumValues(
    {"Konfirmasi Pembayaran Donasi": Title.KONFIRMASI_PEMBAYARAN_DONASI});

enum Txtdate { RABU_23_SEPTEMBER_2020 }

final txtdateValues =
    EnumValues({"Rabu, 23 September 2020": Txtdate.RABU_23_SEPTEMBER_2020});

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
