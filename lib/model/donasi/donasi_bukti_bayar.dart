import 'dart:convert';

BuktiBayarDonasiModel buktiBayarDonasiModelFromJson(String str) =>
    BuktiBayarDonasiModel.fromJson(json.decode(str));

String buktiBayarDonasiModelToJson(BuktiBayarDonasiModel data) =>
    json.encode(data.toJson());

class BuktiBayarDonasiModel {
  BuktiBayarDonasiModel(
      {this.formdata_metode,
      this.formdata_bank,
      this.formdata_norekening,
      this.formdata_date,
      this.datep,
      this.formdata_time,
      this.formdata_imginv,
      this.setdata_mod,
      this.formdata_putlist,
      this.formdata_origin,
      this.formdata_apikey,
      this.formdata_mod,
      this.formdata_cid});

  String formdata_metode;
  String formdata_bank;
  String formdata_norekening;
  String formdata_date;
  String datep;
  String formdata_time;
  String formdata_imginv;
  String setdata_mod;
  String formdata_putlist;
  String formdata_origin;
  String formdata_apikey;
  String formdata_mod;
  String formdata_cid;

  factory BuktiBayarDonasiModel.fromJson(Map<String, dynamic> json) => BuktiBayarDonasiModel(
      formdata_metode: json["formdata_metode"] == null ? null : json["formdata_metode"],
      formdata_bank: json["formdata_bank"] == null ? null : json["formdata_bank"],
      formdata_norekening: json["formdata_norekening"] == null ? null : json["formdata_norekening"],
      formdata_date: json["formdata_date"] == null ? null : json["formdata_date"],
      datep: json["datep"] == null ? null : json["datep"],
      formdata_time: json["formdata_time"] == null ? null : json["formdata_time"],
      formdata_imginv: json["formdata_imginv"] == null ? null : json["formdata_imginv"],
      setdata_mod: json["setdata_mod"] == null ? null : json["setdata_mod"],
      formdata_putlist: json["formdata_putlist"] == null ? null : json["formdata_putlist"],
      formdata_origin: json["formdata_origin"] == null ? null : json["formdata_origin"],
      formdata_apikey: json["formdata_apikey"] == null ? null : json["formdata_apikey"],
      formdata_mod: json["formdata_mod"] == null ? null : json["formdata_mod"],
      formdata_cid: json["formdata_cid"] == null ? null : json["formdata_cid"]
  );

  Map<String, dynamic> toJson() => {
    "formdata_metode": formdata_metode == null ? null : formdata_metode,
    "formdata_bank": formdata_bank == null ? null : formdata_bank,
    "formdata_norekening": formdata_norekening == null ? null : formdata_norekening,
    "formdata_date": formdata_date == null ? null : formdata_date,
    "datep": datep == null ? null : datep,
    "formdata_time": formdata_time == null ? null : formdata_time,
    "formdata_imginv": formdata_imginv == null ? null : formdata_imginv,
    "setdata_mod": setdata_mod == null ? null : setdata_mod,
    "formdata_putlist": formdata_putlist == null ? null : formdata_putlist,
    "formdata_origin": formdata_origin == null ? null : formdata_origin,
    "formdata_apikey": formdata_apikey == null ? null : formdata_apikey,
    "formdata_mod": formdata_mod == null ? null : formdata_mod,
    "formdata_cid": formdata_cid == null ? null : formdata_cid
  };
}
