// To parse this JSON data, do
//
//     final infoPembayaranMeModel = infoPembayaranMeModelFromJson(jsonString);

import 'dart:convert';

InfoPembayaranMeModel infoPembayaranMeModelFromJson(String str) => InfoPembayaranMeModel.fromJson(json.decode(str));

String infoPembayaranMeModelToJson(InfoPembayaranMeModel data) => json.encode(data.toJson());

class InfoPembayaranMeModel {
    InfoPembayaranMeModel({
        this.basket,
        this.tab,
        this.dataRr,
        this.pelayanan,
        this.total,
    });

    List<Basket> basket;
    List<Tabtab> tab;
    DataRr dataRr;
    int pelayanan;
    int total;

    factory InfoPembayaranMeModel.fromJson(Map<String, dynamic> json) => InfoPembayaranMeModel(
        basket: json["basket"] == null ? null : List<Basket>.from(json["basket"].map((x) => Basket.fromJson(x))),
        tab: json["tab"] == null ? null : List<Tabtab>.from(json["tab"].map((x) => Tabtab.fromJson(x))),
        dataRr: json["data_rr"] == null ? null : DataRr.fromJson(json["data_rr"]),
        pelayanan: json["pelayanan"] == null ? null : json["pelayanan"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "basket": basket == null ? null : List<dynamic>.from(basket.map((x) => x.toJson())),
        "tab": tab == null ? null : List<dynamic>.from(tab.map((x) => x.toJson())),
        "data_rr": dataRr == null ? null : dataRr.toJson(),
        "pelayanan": pelayanan == null ? null : pelayanan,
        "total": total == null ? null : total,
    };
}

class Basket {
    Basket({
        this.nama,
        this.singkatan,
        this.nominal,
    });

    String nama;
    String singkatan;
    int nominal;

    factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        nama: json["nama"] == null ? null : json["nama"],
        singkatan: json["singkatan"] == null ? null : json["singkatan"],
        nominal: json["nominal"] == null ? null : json["nominal"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama == null ? null : nama,
        "singkatan": singkatan == null ? null : singkatan,
        "nominal": nominal == null ? null : nominal,
    };
}

class DataRr {
    DataRr({
        this.spb,
        this.spp,
        this.formulir,
        this.jaket,
    });

    Spb spb;
    Spp spp;
    Formulir formulir;
    Formulir jaket;

    factory DataRr.fromJson(Map<String, dynamic> json) => DataRr(
        spb: json["spb"] == null ? null : Spb.fromJson(json["spb"]),
        spp: json["spp"] == null ? null : Spp.fromJson(json["spp"]),
        formulir: json["formulir"] == null ? null : Formulir.fromJson(json["formulir"]),
        jaket: json["jaket"] == null ? null : Formulir.fromJson(json["jaket"]),
    );

    Map<String, dynamic> toJson() => {
        "spb": spb == null ? null : spb.toJson(),
        "spp": spp == null ? null : spp.toJson(),
        "formulir": formulir == null ? null : formulir.toJson(),
        "jaket": jaket == null ? null : jaket.toJson(),
    };
}

class Formulir {
    Formulir({
        this.summarya,
        this.realita,
    });

    FormulirSummarya summarya;
    List<RealitaElement> realita;

    factory Formulir.fromJson(Map<String, dynamic> json) => Formulir(
        summarya: json["summarya"] == null ? null : FormulirSummarya.fromJson(json["summarya"]),
        realita: json["realita"] == null ? null : List<RealitaElement>.from(json["realita"].map((x) => RealitaElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "summarya": summarya == null ? null : summarya.toJson(),
        "realita": realita == null ? null : List<dynamic>.from(realita.map((x) => x.toJson())),
    };
}

class RealitaElement {
    RealitaElement({
        this.ke,
        this.rp,
        this.tg,
    });

    String ke;
    String rp;
    String tg;

    factory RealitaElement.fromJson(Map<String, dynamic> json) => RealitaElement(
        ke: json["ke"] == null ? null : json["ke"],
        rp: json["rp"] == null ? null : json["rp"],
        tg: json["tg"] == null ? null : json["tg"],
    );

    Map<String, dynamic> toJson() => {
        "ke": ke == null ? null : ke,
        "rp": rp == null ? null : rp,
        "tg": tg == null ? null : tg,
    };
}

class FormulirSummarya {
    FormulirSummarya({
        this.juma,
    });

    int juma;

    factory FormulirSummarya.fromJson(Map<String, dynamic> json) => FormulirSummarya(
        juma: json["juma"] == null ? null : json["juma"],
    );

    Map<String, dynamic> toJson() => {
        "juma": juma == null ? null : juma,
    };
}

class Spb {
    Spb({
        this.summaryr,
        this.rencana,
        this.summarya,
        this.realita,
    });

    SpbSummaryr summaryr;
    List<RealitaElement> rencana;
    FormulirSummarya summarya;
    List<RealitaElement> realita;

    factory Spb.fromJson(Map<String, dynamic> json) => Spb(
        summaryr: json["summaryr"] == null ? null : SpbSummaryr.fromJson(json["summaryr"]),
        rencana: json["rencana"] == null ? null : List<RealitaElement>.from(json["rencana"].map((x) => RealitaElement.fromJson(x))),
        summarya: json["summarya"] == null ? null : FormulirSummarya.fromJson(json["summarya"]),
        realita: json["realita"] == null ? null : List<RealitaElement>.from(json["realita"].map((x) => RealitaElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "summaryr": summaryr == null ? null : summaryr.toJson(),
        "rencana": rencana == null ? null : List<dynamic>.from(rencana.map((x) => x.toJson())),
        "summarya": summarya == null ? null : summarya.toJson(),
        "realita": realita == null ? null : List<dynamic>.from(realita.map((x) => x.toJson())),
    };
}

class SpbSummaryr {
    SpbSummaryr({
        this.jumr,
    });

    int jumr;

    factory SpbSummaryr.fromJson(Map<String, dynamic> json) => SpbSummaryr(
        jumr: json["jumr"] == null ? null : json["jumr"],
    );

    Map<String, dynamic> toJson() => {
        "jumr": jumr == null ? null : jumr,
    };
}

class Spp {
    Spp({
        this.summaryr,
        this.rencana,
        this.summarya,
        this.realita,
    });

    Map<String, SummaryrValue> summaryr;
    Map<String, List<RealitaElement>> rencana;
    SppSummarya summarya;
    PurpleRealita realita;

    factory Spp.fromJson(Map<String, dynamic> json) => Spp(
        summaryr: json["summaryr"] == null ? null : Map.from(json["summaryr"]).map((k, v) => MapEntry<String, SummaryrValue>(k, SummaryrValue.fromJson(v))),
        rencana: json["rencana"] == null ? null : Map.from(json["rencana"]).map((k, v) => MapEntry<String, List<RealitaElement>>(k, List<RealitaElement>.from(v.map((x) => RealitaElement.fromJson(x))))),
        summarya: json["summarya"] == null ? null : SppSummarya.fromJson(json["summarya"]),
        realita: json["realita"] == null ? null : PurpleRealita.fromJson(json["realita"]),
    );

    Map<String, dynamic> toJson() => {
        "summaryr": summaryr == null ? null : Map.from(summaryr).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "rencana": rencana == null ? null : Map.from(rencana).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "summarya": summarya == null ? null : summarya.toJson(),
        "realita": realita == null ? null : realita.toJson(),
    };
}

class PurpleRealita {
    PurpleRealita({
        this.the1,
    });

    List<RealitaElement> the1;

    factory PurpleRealita.fromJson(Map<String, dynamic> json) => PurpleRealita(
        the1: json["1"] == null ? null : List<RealitaElement>.from(json["1"].map((x) => RealitaElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "1": the1 == null ? null : List<dynamic>.from(the1.map((x) => x.toJson())),
    };
}

class SppSummarya {
    SppSummarya({
        this.the1,
    });

    The1 the1;

    factory SppSummarya.fromJson(Map<String, dynamic> json) => SppSummarya(
        the1: json["1"] == null ? null : The1.fromJson(json["1"]),
    );

    Map<String, dynamic> toJson() => {
        "1": the1 == null ? null : the1.toJson(),
    };
}

class The1 {
    The1({
        this.juma,
        this.smt,
    });

    int juma;
    int smt;

    factory The1.fromJson(Map<String, dynamic> json) => The1(
        juma: json["juma"] == null ? null : json["juma"],
        smt: json["smt"] == null ? null : json["smt"],
    );

    Map<String, dynamic> toJson() => {
        "juma": juma == null ? null : juma,
        "smt": smt == null ? null : smt,
    };
}

class SummaryrValue {
    SummaryrValue({
        this.jumr,
        this.smt,
    });

    int jumr;
    int smt;

    factory SummaryrValue.fromJson(Map<String, dynamic> json) => SummaryrValue(
        jumr: json["jumr"] == null ? null : json["jumr"],
        smt: json["smt"] == null ? null : json["smt"],
    );

    Map<String, dynamic> toJson() => {
        "jumr": jumr == null ? null : jumr,
        "smt": smt == null ? null : smt,
    };
}

class Tabtab {
    Tabtab({
        this.tabKode,
        this.tabName,
        this.tabFullname,
    });

    String tabKode;
    String tabName;
    String tabFullname;

    factory Tabtab.fromJson(Map<String, dynamic> json) => Tabtab(
        tabKode: json["tab_kode"] == null ? null : json["tab_kode"],
        tabName: json["tab_name"] == null ? null : json["tab_name"],
        tabFullname: json["tab_fullname"] == null ? null : json["tab_fullname"],
    );

    Map<String, dynamic> toJson() => {
        "tab_kode": tabKode == null ? null : tabKode,
        "tab_name": tabName == null ? null : tabName,
        "tab_fullname": tabFullname == null ? null : tabFullname,
    };
}
