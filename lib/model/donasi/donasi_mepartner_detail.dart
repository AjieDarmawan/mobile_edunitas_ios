import 'dart:convert';

DonasiMePatnerDetail DonasiMePatnerDetailFromJson(String str) =>
    DonasiMePatnerDetail.fromJson(json.decode(str));

String DonasiMePatnerDetailFromJsonToJson(DonasiMePatnerDetail data) =>
    json.encode(data.toJson());

class DonasiMePatnerDetail {
  DonasiMePatnerDetail(
      {this.response,
      this.responsecode,
      this.statuscode,
      this.message,
      this.data});

  String response;
  String responsecode;
  String statuscode;
  String message;
  List<LDonatur> data;

  factory DonasiMePatnerDetail.fromJson(Map<String, dynamic> json) =>
      DonasiMePatnerDetail(
        response: json["response"] == null ? null : json["response"],
        responsecode:
            json["responsecode"] == null ? null : json["responsecode"],
        statuscode: json["statuscode"] == null ? null : json["statuscode"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<LDonatur>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "response": response == null ? null : response,
        "responsecode": responsecode == null ? null : responsecode,
        "statuscode": statuscode == null ? null : statuscode,
        "message": message == null ? null : message,
        "data": data == null ? null : List<LDonatur>.from(data.map((x) => x)),
      };
}

LDonatur LDonaturFromJson(String str) => LDonatur.fromJson(json.decode(str));

String LDonaturJsonToJson(LDonatur data) => json.encode(data.toJson());

class LDonatur {
  LDonatur({this.listdonatur});

  List<DPagging> listdonatur;

  factory LDonatur.fromJson(Map<String, dynamic> json) => LDonatur(
        listdonatur: json["listdonatur"] == null
            ? null
            : List<DPagging>.from(json["listdonatur"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "listdonatur": listdonatur == null
            ? null
            : List<DPagging>.from(listdonatur.map((x) => x)),
      };
}

DPagging DPaggingFromJson(String str) => DPagging.fromJson(json.decode(str));

String DPaggingToJson(DPagging data) => json.encode(data.toJson());

class DPagging {
  DPagging({this.listdata});

  List<DonaturListData> listdata;

  factory DPagging.fromJson(Map<String, dynamic> json) => DPagging(
        listdata: json["listdata"] == null
            ? null
            : List<DonaturListData>.from(json["listdata"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "listdata": listdata == null
            ? null
            : List<DonaturListData>.from(listdata.map((x) => x)),
      };
}

List<DonaturListData> donaturListDataFromJson(String str) => List<DonaturListData>.from(json.decode(str).map((x) => DonaturListData.fromJson(x)));

String donaturListDataToJson(List<DonaturListData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonaturListData {
  DonaturListData({
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

  factory DonaturListData.fromJson(Map<String, dynamic> json) =>
      DonaturListData(
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
