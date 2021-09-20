import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ios_edunitas/constant/constant.dart';
import 'package:ios_edunitas/model/Auth/LoginModel.dart';
import 'package:ios_edunitas/model/Campus/AngsuranSpb.dart';
import 'package:ios_edunitas/model/Campus/AngsuranSpbAngsuran.dart';
import 'package:ios_edunitas/model/Campus/DetailCampus.dart';
import 'package:ios_edunitas/model/Campus/MessageModel.dart';
import 'package:ios_edunitas/model/Campus/PhotoModel.dart';
import 'package:ios_edunitas/model/Campus/check_search_prodi.dart';
import 'package:ios_edunitas/model/Master/BannerModel.dart';
import 'package:ios_edunitas/model/Master/CampusKelas.dart';
import 'package:ios_edunitas/model/Master/KampusMaster.dart';
import 'package:ios_edunitas/model/Master/KelasModel.dart';
import 'package:ios_edunitas/model/Campus/ListCampus.dart';
import 'package:ios_edunitas/model/Master/LogoGambar.dart';

import 'package:ios_edunitas/model/Master/MasterDaerahModel.dart';
import 'package:ios_edunitas/model/Master/MasterJurusanModel.dart';
import 'package:ios_edunitas/model/Master/MetodePembayaranModel.dart';
import 'package:ios_edunitas/model/Master/PendidikanModel.dart';
import 'package:ios_edunitas/model/Master/SearchProdiModel.dart';
import 'package:ios_edunitas/model/Master/SmbModel.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:ios_edunitas/model/Master/UnitAreaModel.dart';
import 'package:ios_edunitas/model/Master/ProdiMultipleModel.dart';

import 'package:ios_edunitas/model/Campus/SipemaModel.dart';
import 'package:ios_edunitas/model/Campus/SipemaWebModel.dart';
import 'package:ios_edunitas/model/agent/add_mhs_agensi.dart';
import 'package:ios_edunitas/model/agent/check_rekening.dart';
import 'package:ios_edunitas/model/agent/daftar_mhs_rekomen.dart';
import 'package:ios_edunitas/model/karir/RiwayatLamaran.dart';
import 'package:ios_edunitas/model/Campus/listdetail_jurusan_pengelompok.dart';
import 'package:ios_edunitas/model/karir/ShowInfoTambahan.dart';
import 'package:ios_edunitas/model/karir/ShowPengalamanModel.dart';
import 'package:ios_edunitas/model/karir/SpesialisasiModel.dart';
import 'package:ios_edunitas/model/karir/status_responseKarir.dart';
import 'package:ios_edunitas/model/karir/detailKarir.dart';
import 'package:ios_edunitas/model/karir/detail_karir_me_Model.dart';
import 'package:ios_edunitas/pages/Account/me/me_partner/me_partner.dart';
import 'package:ios_edunitas/pages/Home/karir/karir.dart';
import 'package:ios_edunitas/pages/Home/widget_home/widget_home.dart';

import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:ios_edunitas/constant/constant.dart';

import '../model/agent/check_rekening.dart';

part 'homeview_model.dart';
part 'Kampusview_model.dart';
part 'masterview_model.dart';
part 'sipemaview_model.dart';
part 'karirview_model.dart';
part 'AgentView_model.dart';
