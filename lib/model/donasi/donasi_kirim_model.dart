// To parse this JSON data, do
//
//     final donasiKirimModel = donasiKirimModelFromJson(jsonString);

import 'dart:convert';

DonasiKirimModel donasiKirimModelFromJson(String str) => DonasiKirimModel.fromJson(json.decode(str));

String donasiKirimModelToJson(DonasiKirimModel data) => json.encode(data.toJson());

class DonasiKirimModel {
    DonasiKirimModel({
        this.trxId,
        this.nopembayaran,
        this.donaturname,
        this.isanonim,
        this.nowa,
        this.notlp,
        this.nominal,
        this.keycode,
        this.champaigner,
        this.judul,
        this.seolink,
        this.novirtualBni,
        this.channel,
        this.method,
        this.labelAn,
        this.labelRek,
        this.labelBank,
        this.prodi,
        this.waktu,
        this.loopitem,
        this.nominaltrf,
        this.email,
    });

    String trxId;
    String nopembayaran;
    String donaturname;
    String isanonim;
    String nowa;
    String notlp;
    String nominal;
    String keycode;
    String champaigner;
    String judul;
    String seolink;
    String novirtualBni;
    String channel;
    String method;
    String labelAn;
    String labelRek;
    String labelBank;
    String prodi;
    String waktu;
    String loopitem;
    int nominaltrf;
    String email;

    factory DonasiKirimModel.fromJson(Map<String, dynamic> json) => DonasiKirimModel(
        trxId: json["trx_id"] == null ? null : json["trx_id"],
        nopembayaran: json["nopembayaran"] == null ? null : json["nopembayaran"],
        donaturname: json["donaturname"] == null ? null : json["donaturname"],
        isanonim: json["isanonim"] == null ? null : json["isanonim"],
        nowa: json["nowa"] == null ? null : json["nowa"],
        notlp: json["notlp"] == null ? null : json["notlp"],
        nominal: json["nominal"] == null ? null : json["nominal"],
        keycode: json["keycode"] == null ? null : json["keycode"],
        champaigner: json["champaigner"] == null ? null : json["champaigner"],
        judul: json["judul"] == null ? null : json["judul"],
        seolink: json["seolink"] == null ? null : json["seolink"],
        novirtualBni: json["novirtual_bni"] == null ? null : json["novirtual_bni"],
        channel: json["channel"] == null ? null : json["channel"],
        method: json["method"] == null ? null : json["method"],
        labelAn: json["label_an"] == null ? null : json["label_an"],
        labelRek: json["label_rek"] == null ? null : json["label_rek"],
        labelBank: json["label_bank"] == null ? null : json["label_bank"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        waktu: json["waktu"] == null ? null : json["waktu"],
        loopitem: json["loopitem"] == null ? null : json["loopitem"],
        nominaltrf: json["nominaltrf"] == null ? null : json["nominaltrf"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toJson() => {
        "trx_id": trxId == null ? null : trxId,
        "nopembayaran": nopembayaran == null ? null : nopembayaran,
        "donaturname": donaturname == null ? null : donaturname,
        "isanonim": isanonim == null ? null : isanonim,
        "nowa": nowa == null ? null : nowa,
        "notlp": notlp == null ? null : notlp,
        "nominal": nominal == null ? null : nominal,
        "keycode": keycode == null ? null : keycode,
        "champaigner": champaigner == null ? null : champaigner,
        "judul": judul == null ? null : judul,
        "seolink": seolink == null ? null : seolink,
        "novirtual_bni": novirtualBni == null ? null : novirtualBni,
        "channel": channel == null ? null : channel,
        "method": method == null ? null : method,
        "label_an": labelAn == null ? null : labelAn,
        "label_rek": labelRek == null ? null : labelRek,
        "label_bank": labelBank == null ? null : labelBank,
        "prodi": prodi == null ? null : prodi,
        "waktu": waktu == null ? null : waktu,
        "loopitem": loopitem == null ? null : loopitem,
        "nominaltrf": nominaltrf == null ? null : nominaltrf,
        "email": email == null ? null : email,
    };
}
