import 'dart:convert';

DaftarMhsRekomenModel detailDaftarMhsRekomenFromJson(String str) => DaftarMhsRekomenModel.fromJson(json.decode(str));

String detailDaftarMhsRekomenToJson(DaftarMhsRekomenModel data) => json.encode(data.toJson());

class DaftarMhsRekomenModel{

  DaftarMhsRekomenModel({
    this.id,
    this.code,
    this.cid,
    this.status,
    this.unitarea,
    this.nama,
    this.email,
    this.notlp,
    this.nowa,
    this.crdt
  });

  int id;
  String code;
  String cid;
  String status;
  String unitarea;
  String nama;
  String email;
  String notlp;
  String nowa;
  String crdt;

  factory DaftarMhsRekomenModel.fromJson(Map<String, dynamic> json) => DaftarMhsRekomenModel(
    id: json["id"] == null ? null : json["id"],
    code: json["code"] == null ? null : json["code"],
    cid: json["cid"] == null ? null : json["cid"],
    status: json["status"] == null ? null : json["status"],
    unitarea: json["unitarea"] == null ? null : json["unitarea"],
    nama: json["nama"] == null ? null : json["nama"],
    email: json["email"] == null ? null : json["email"],
    notlp: json["notlp"] == null ? null : json["notlp"],
    nowa: json["nowa"] == null ? null : json["nowa"],
    crdt: json["crdt"] == null ? null : json["crdt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : code,
    "cid": cid == null ? null : cid,
    "status": status == null ? null : status,
    "unitarea": unitarea == null ? null : unitarea,
    "nama": nama == null ? null : nama,
    "email": email == null ? null : email,
    "notlp": notlp == null ? null : notlp,
    "nowa": nowa == null ? null : nowa,
    "crdt": crdt == null ? null : crdt,
  };

  static List<DaftarMhsRekomenModel> parseList(List<dynamic> list) {
    return list.map((i) => DaftarMhsRekomenModel.fromJson(i)).toList();
  }

}