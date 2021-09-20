// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
    MessageModel({
        this.data,
        this.statuscode,
    });

    Data data;
    String statuscode;

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        statuscode: json["statuscode"] == null ? null : json["statuscode"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "statuscode": statuscode == null ? null : statuscode,
    };
}

class Data {
    Data({
        this.list,
        this.unread,
        this.ccid,
    });

    List<ListElement> list;
    int unread;
    String ccid;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
        unread: json["unread"] == null ? null : json["unread"],
        ccid: json["ccid"] == null ? null : json["ccid"],
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
        "unread": unread == null ? null : unread,
        "ccid": ccid == null ? null : ccid,
    };
}

class ListElement {
    ListElement({
        this.id,
        this.code,
        this.content,
        this.contentdata,
        this.redirect,
        this.bcid,
        this.sendat,
        this.keycode,
        this.readdate,
        this.target,
        this.crdt,
        this.bcke,
        this.cid,
        this.mod,
        this.kategori,
        this.nama,
        this.subject,
        this.title,
        this.subtitle,
        this.sender,
        this.status,
        this.editable,
        this.keterangan,
        this.scheduletag,
        this.crur,
        this.mddt,
        this.mdur,
        this.lastsend,
        this.idM,
        this.tanggal,
         this.waktu_crtd,
        this.ccid,
    });

    int id;
    Code code;
    String content;
    Contentdata contentdata;
    String redirect;
    dynamic bcid;
    dynamic sendat;
    Keycode keycode;
    dynamic readdate;
    dynamic target;
    String crdt;
    dynamic bcke;
    Cid cid;
    Mod mod;
    Code kategori;
    Nama nama;
    String subject;
    String title;
    Subtitle subtitle;
    String sender;
    String status;
    String editable;
    String keterangan;
    dynamic scheduletag;
    Crur crur;
    DateTime mddt;
    Keycode mdur;
    dynamic lastsend;
    int idM;
    DateTime tanggal;
    String waktu_crtd;
    Ccid ccid;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : codeValues.map[json["code"]],
        content: json["content"] == null ? null : json["content"],
        contentdata: json["contentdata"] == null ? null : Contentdata.fromJson(json["contentdata"]),
        redirect: json["redirect"] == null ? null : json["redirect"],
        bcid: json["bcid"],
        sendat: json["sendat"],
        keycode: json["keycode"] == null ? null : keycodeValues.map[json["keycode"]],
        readdate: json["readdate"],
        target: json["target"],
        crdt: json["crdt"] == null ? null : json["crdt"],
        bcke: json["bcke"],
        cid: json["cid"] == null ? null : cidValues.map[json["cid"]],
        mod: json["mod"] == null ? null : modValues.map[json["mod"]],
        kategori: json["kategori"] == null ? null : codeValues.map[json["kategori"]],
        nama: json["nama"] == null ? null : namaValues.map[json["nama"]],
        subject: json["subject"] == null ? null : json["subject"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : subtitleValues.map[json["subtitle"]],
          sender: json["sender"] == null ? null : json["sender"],
        status: json["status"] == null ? null : json["status"],
        editable: json["editable"] == null ? null : json["editable"],
        keterangan: json["keterangan"] == null ? null : json["keterangan"],
          waktu_crtd: json["waktu_crtd"] == null ? null : json["waktu_crtd"],

       
        scheduletag: json["scheduletag"],
        crur: json["crur"] == null ? null : crurValues.map[json["crur"]],
        mddt: json["mddt"] == null ? null : DateTime.parse(json["mddt"]),
        mdur: json["mdur"] == null ? null : keycodeValues.map[json["mdur"]],
        lastsend: json["lastsend"],
        idM: json["id_m"] == null ? null : json["id_m"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        ccid: json["ccid"] == null ? null : ccidValues.map[json["ccid"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : codeValues.reverse[code],
        "content": content == null ? null : content,
        "contentdata": contentdata == null ? null : contentdata.toJson(),
        "redirect": redirect == null ? null : redirect,
        "bcid": bcid,
        "sendat": sendat,
        "keycode": keycode == null ? null : keycodeValues.reverse[keycode],
        "readdate": readdate,
        "target": target,
       "crdt": crdt == null ? null : crdt,
        "bcke": bcke,
        "cid": cid == null ? null : cidValues.reverse[cid],
        "mod": mod == null ? null : modValues.reverse[mod],
        "kategori": kategori == null ? null : codeValues.reverse[kategori],
        "nama": nama == null ? null : namaValues.reverse[nama],
        "subject": subject == null ? null : subject,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitleValues.reverse[subtitle],
        // "sender": sender == null ? null : senderValues.reverse[sender],
        "sender": sender == null ? null : sender,
        "status": status == null ? null : status,
        "editable": editable == null ? null : editable,
        "keterangan": keterangan == null ? null : keterangan,
         "waktu_crtd": waktu_crtd == null ? null : waktu_crtd,

        
        "scheduletag": scheduletag,
        "crur": crur == null ? null : crurValues.reverse[crur],
        "mddt": mddt == null ? null : mddt.toIso8601String(),
        "mdur": mdur == null ? null : keycodeValues.reverse[mdur],
        "lastsend": lastsend,
        "id_m": idM == null ? null : idM,
        "tanggal": tanggal == null ? null : "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "ccid": ccid == null ? null : ccidValues.reverse[ccid],
    };
}

enum Ccid { THE_3_B22381_B4_DC53_B215_B6_BCB88_CEA298_F685272071, THE_947_F5_C5_D718_C6_C0_D9_CA335225_C265_ABC85_F4_BF34 }

final ccidValues = EnumValues({
    "3b22381b4dc53b215b6bcb88cea298f685272071": Ccid.THE_3_B22381_B4_DC53_B215_B6_BCB88_CEA298_F685272071,
    "947f5c5d718c6c0d9ca335225c265abc85f4bf34": Ccid.THE_947_F5_C5_D718_C6_C0_D9_CA335225_C265_ABC85_F4_BF34
});

enum Cid { THE_60_E87_BFE35_FC0_E9_F73_E68407_DAD4_D9_A6, THE_6_EB549_CF44184_E1_C412_E1_AE9_C34_C2_E50 }

final cidValues = EnumValues({
    "60e87bfe35fc0e9f73e68407dad4d9a6": Cid.THE_60_E87_BFE35_FC0_E9_F73_E68407_DAD4_D9_A6,
    "6eb549cf44184e1c412e1ae9c34c2e50": Cid.THE_6_EB549_CF44184_E1_C412_E1_AE9_C34_C2_E50
});

enum Code { EDU_CAMPUS }

final codeValues = EnumValues({
    "eduCampus": Code.EDU_CAMPUS
});

class Contentdata {
    Contentdata({
        this.nama,
        this.email,
        this.telepon,
        this.whatsapp,
        this.kampus,
        this.wilayah,
        this.kelas,
        this.prodi,
        this.waktu,
        this.nosel,
        this.program,
        this.biobid,
        this.rekomen,
        this.smb,
        this.novirtual,
        this.novirtualBni,
        this.novirtualBsm,
        this.novirtualNiaga,
        this.novirtualMst,
        this.novirtualFaspay,
        this.loopitem,
        this.nominal,
        this.nominalhp,
        this.instagram,
        this.loopItem,
        this.formulir,
        this.the0,
    });

    String nama;
    String email;
    String telepon;
    String whatsapp;
    String kampus;
    String wilayah;
    Kelas kelas;
    String prodi;
    String waktu;
    String nosel;
    Kelas program;
    String biobid;
    Rekomen rekomen;
    String smb;
    String novirtual;
    String novirtualBni;
    String novirtualBsm;
    String novirtualNiaga;
    String novirtualMst;
    String novirtualFaspay;
    String loopitem;
    dynamic nominal;
    int nominalhp;
    String instagram;
    String loopItem;
    String formulir;
    The0 the0;

    factory Contentdata.fromJson(Map<String, dynamic> json) => Contentdata(
        nama: json["nama"] == null ? null : json["nama"],
        email: json["email"] == null ? null : json["email"],
        telepon: json["telepon"] == null ? null : json["telepon"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
        kampus: json["kampus"] == null ? null : json["kampus"],
        wilayah: json["wilayah"] == null ? null : json["wilayah"],
        kelas: json["kelas"] == null ? null : kelasValues.map[json["kelas"]],
        prodi: json["prodi"] == null ? null : json["prodi"],
        waktu: json["waktu"] == null ? null : json["waktu"],
        nosel: json["nosel"] == null ? null : json["nosel"],
        program: json["program"] == null ? null : kelasValues.map[json["program"]],
        biobid: json["biobid"] == null ? null : json["biobid"],
        rekomen: json["rekomen"] == null ? null : rekomenValues.map[json["rekomen"]],
        smb: json["smb"] == null ? null : json["smb"],
        novirtual: json["novirtual"] == null ? null : json["novirtual"],
        novirtualBni: json["novirtual_bni"] == null ? null : json["novirtual_bni"],
        novirtualBsm: json["novirtual_bsm"] == null ? null : json["novirtual_bsm"],
        novirtualNiaga: json["novirtual_niaga"] == null ? null : json["novirtual_niaga"],
        novirtualMst: json["novirtual_mst"] == null ? null : json["novirtual_mst"],
        novirtualFaspay: json["novirtual_faspay"] == null ? null : json["novirtual_faspay"],
        loopitem: json["loopitem"] == null ? null : json["loopitem"],
        nominal: json["nominal"],
        nominalhp: json["nominalhp"] == null ? null : json["nominalhp"],
        instagram: json["Instagram"] == null ? null : json["Instagram"],
        loopItem: json["loop_item"] == null ? null : json["loop_item"],
        formulir: json["formulir"] == null ? null : json["formulir"],
        the0: json["0"] == null ? null : The0.fromJson(json["0"]),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama == null ? null : nama,
        "email": email == null ? null : email,
        "telepon": telepon == null ? null : telepon,
        "whatsapp": whatsapp == null ? null : whatsapp,
        "kampus": kampus == null ? null : kampus,
        "wilayah": wilayah == null ? null : wilayah,
        "kelas": kelas == null ? null : kelasValues.reverse[kelas],
        "prodi": prodi == null ? null : prodi,
        "waktu": waktu == null ? null : waktu,
        "nosel": nosel == null ? null : nosel,
        "program": program == null ? null : kelasValues.reverse[program],
        "biobid": biobid == null ? null : biobid,
        "rekomen": rekomen == null ? null : rekomenValues.reverse[rekomen],
        "smb": smb == null ? null : smb,
        "novirtual": novirtual == null ? null : novirtual,
        "novirtual_bni": novirtualBni == null ? null : novirtualBni,
        "novirtual_bsm": novirtualBsm == null ? null : novirtualBsm,
        "novirtual_niaga": novirtualNiaga == null ? null : novirtualNiaga,
        "novirtual_mst": novirtualMst == null ? null : novirtualMst,
        "novirtual_faspay": novirtualFaspay == null ? null : novirtualFaspay,
        "loopitem": loopitem == null ? null : loopitem,
        "nominal": nominal,
        "nominalhp": nominalhp == null ? null : nominalhp,
        "Instagram": instagram == null ? null : instagram,
        "loop_item": loopItem == null ? null : loopItem,
        "formulir": formulir == null ? null : formulir,
        "0": the0 == null ? null : the0.toJson(),
    };
}

enum Kelas { PROGRAM_PERKULIAHAN_ONLINE, PROGRAM_PERKULIAHAN_KARYAWAN }

final kelasValues = EnumValues({
    "Program Perkuliahan Karyawan": Kelas.PROGRAM_PERKULIAHAN_KARYAWAN,
    "Program Perkuliahan Online": Kelas.PROGRAM_PERKULIAHAN_ONLINE
});

enum Rekomen { EMPTY, THE_97_B3_DA94_CDFDA82_AC2_A87_B2503_E5_EE6059_E784_D5 }

final rekomenValues = EnumValues({
    "": Rekomen.EMPTY,
    "97b3da94cdfda82ac2a87b2503e5ee6059e784d5": Rekomen.THE_97_B3_DA94_CDFDA82_AC2_A87_B2503_E5_EE6059_E784_D5
});

class The0 {
    The0({
        this.novirtual,
        this.novirtualBni,
        this.novirtualBsm,
        this.novirtualNiaga,
        this.novirtualMst,
        this.novirtualFaspay,
    });

    String novirtual;
    String novirtualBni;
    String novirtualBsm;
    String novirtualNiaga;
    String novirtualMst;
    String novirtualFaspay;

    factory The0.fromJson(Map<String, dynamic> json) => The0(
        novirtual: json["novirtual"] == null ? null : json["novirtual"],
        novirtualBni: json["novirtual_bni"] == null ? null : json["novirtual_bni"],
        novirtualBsm: json["novirtual_bsm"] == null ? null : json["novirtual_bsm"],
        novirtualNiaga: json["novirtual_niaga"] == null ? null : json["novirtual_niaga"],
        novirtualMst: json["novirtual_mst"] == null ? null : json["novirtual_mst"],
        novirtualFaspay: json["novirtual_faspay"] == null ? null : json["novirtual_faspay"],
    );

    Map<String, dynamic> toJson() => {
        "novirtual": novirtual == null ? null : novirtual,
        "novirtual_bni": novirtualBni == null ? null : novirtualBni,
        "novirtual_bsm": novirtualBsm == null ? null : novirtualBsm,
        "novirtual_niaga": novirtualNiaga == null ? null : novirtualNiaga,
        "novirtual_mst": novirtualMst == null ? null : novirtualMst,
        "novirtual_faspay": novirtualFaspay == null ? null : novirtualFaspay,
    };
}

enum Crur { EN0_B9019330620_B685_F61_E62_EDDE56_E8_A2_F27958 }

final crurValues = EnumValues({
    "EN0b9019330620b685f61e62edde56e8a2f27958": Crur.EN0_B9019330620_B685_F61_E62_EDDE56_E8_A2_F27958
});

enum Keycode { THE_380933623_C56_C82_E75_CCA70187_A4415730_CA7_EA8, BC0_C87_FBC710_EC9039919_F63_DADA2_A1_EBD347436 }

final keycodeValues = EnumValues({
    "bc0c87fbc710ec9039919f63dada2a1ebd347436": Keycode.BC0_C87_FBC710_EC9039919_F63_DADA2_A1_EBD347436,
    "380933623c56c82e75cca70187a4415730ca7ea8": Keycode.THE_380933623_C56_C82_E75_CCA70187_A4415730_CA7_EA8
});

enum Mod { INBOX }

final modValues = EnumValues({
    "INBOX": Mod.INBOX
});

enum Nama { ME_EDUCAMPUS_FORMULIR, ME_EDUCAMPUS_HER_REGIST }

final namaValues = EnumValues({
    "Me Educampus Formulir": Nama.ME_EDUCAMPUS_FORMULIR,
    "Me Educampus Her-Regist": Nama.ME_EDUCAMPUS_HER_REGIST
});

enum Sender { CONTACT_EDUNITAS_COM }

final senderValues = EnumValues({
    "contact@edunitas.com": Sender.CONTACT_EDUNITAS_COM
});

enum Subtitle { KAMPUS, SEBELUM_QUOTA_PENUH }

final subtitleValues = EnumValues({
    "*|KAMPUS|*": Subtitle.KAMPUS,
    "Sebelum Quota Penuh": Subtitle.SEBELUM_QUOTA_PENUH
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
