// To parse this JSON data, do
//
//     final donasiMydesk = donasiMydeskFromJson(jsonString);

import 'dart:convert';

List<DonasiMydesk> donasiMydeskFromJson(String str) => List<DonasiMydesk>.from(json.decode(str).map((x) => DonasiMydesk.fromJson(x)));

String donasiMydeskToJson(List<DonasiMydesk> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonasiMydesk {
    DonasiMydesk({
        this.donaturname,
        this.notlp,
        this.nowa,
        this.price,
        this.textmessage,
        this.user,
        this.judul,
        this.pict,
        this.crdt,
        this.cid,
    });

    String donaturname;
    String notlp;
    String nowa;
    String price;
    String textmessage;
    String user;
    String judul;
    String pict;
    String crdt;
    String cid;

    factory DonasiMydesk.fromJson(Map<String, dynamic> json) => DonasiMydesk(
        donaturname: json["donaturname"] == null ? null : json["donaturname"],
        notlp: json["notlp"] == null ? null : json["notlp"],
        nowa: json["nowa"] == null ? null : json["nowa"],
        price: json["price"] == null ? null : json["price"],
        textmessage: json["textmessage"] == null ? null : json["textmessage"],
        user: json["user"] == null ? null : json["user"],
        judul: json["judul"] == null ? null : json["judul"],
        pict: json["pict"] == null ? null : json["pict"],
        crdt: json["crdt"] == null ? null : json["crdt"],
        cid: json["cid"] == null ? null : json["cid"],
    );

    Map<String, dynamic> toJson() => {
        "donaturname": donaturname == null ? null : donaturname,
        "notlp": notlp == null ? null : notlp,
        "nowa": nowa == null ? null : nowa,
        "price": price == null ? null : price,
        "textmessage": textmessage == null ? null : textmessage,
        "user": user == null ? null : user,
        "judul": judul == null ? null : judul,
        "pict": pict == null ? null : pict,
        "crdt": crdt == null ? null : crdt,
        "cid": cid == null ? null : cid,
    };
}
