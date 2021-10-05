import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:eduNitas/constant/constant.dart';
import 'package:eduNitas/model/Auth/LoginModel.dart';
import 'package:eduNitas/model/Campus/AngsuranSpb.dart';
import 'package:eduNitas/model/Campus/AngsuranSpbAngsuran.dart';
import 'package:eduNitas/model/Campus/DetailCampus.dart';
import 'package:eduNitas/model/Campus/MessageModel.dart';
import 'package:eduNitas/model/Campus/PhotoModel.dart';
import 'package:eduNitas/model/Campus/check_search_prodi.dart';
import 'package:eduNitas/model/Master/BannerModel.dart';
import 'package:eduNitas/model/Master/CampusKelas.dart';
import 'package:eduNitas/model/Master/KampusMaster.dart';
import 'package:eduNitas/model/Master/KelasModel.dart';
import 'package:eduNitas/model/Campus/ListCampus.dart';
import 'package:eduNitas/model/Master/LogoGambar.dart';

import 'package:eduNitas/model/Master/MasterDaerahModel.dart';
import 'package:eduNitas/model/Master/MasterJurusanModel.dart';
import 'package:eduNitas/model/Master/MetodePembayaranModel.dart';
import 'package:eduNitas/model/Master/PendidikanModel.dart';
import 'package:eduNitas/model/Master/SearchProdiModel.dart';
import 'package:eduNitas/model/Master/SmbModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/model/Master/UnitAreaModel.dart';
import 'package:eduNitas/model/Master/ProdiMultipleModel.dart';

import 'package:eduNitas/model/Campus/SipemaModel.dart';
import 'package:eduNitas/model/Campus/SipemaWebModel.dart';
import 'package:eduNitas/model/agent/add_mhs_agensi.dart';
import 'package:eduNitas/model/agent/check_rekening.dart';
import 'package:eduNitas/model/agent/daftar_mhs_rekomen.dart';
import 'package:eduNitas/model/karir/RiwayatLamaran.dart';
import 'package:eduNitas/model/Campus/listdetail_jurusan_pengelompok.dart';
import 'package:eduNitas/model/karir/ShowInfoTambahan.dart';
import 'package:eduNitas/model/karir/ShowPengalamanModel.dart';
import 'package:eduNitas/model/karir/SpesialisasiModel.dart';
import 'package:eduNitas/model/karir/status_responseKarir.dart';
import 'package:eduNitas/model/karir/detailKarir.dart';
import 'package:eduNitas/model/karir/detail_karir_me_Model.dart';
import 'package:eduNitas/pages/Account/me/me_partner/me_partner.dart';
import 'package:eduNitas/pages/Home/karir/karir.dart';
import 'package:eduNitas/pages/Home/widget_home/widget_home.dart';

import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:eduNitas/constant/constant.dart';

import '../model/agent/check_rekening.dart';

part 'homeview_model.dart';
part 'Kampusview_model.dart';
part 'masterview_model.dart';
part 'sipemaview_model.dart';
part 'karirview_model.dart';
part 'AgentView_model.dart';
