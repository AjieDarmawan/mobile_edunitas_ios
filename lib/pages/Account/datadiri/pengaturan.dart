import 'dart:async';
import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/model/Auth/UsersDetailModel.dart';
import 'package:eduNitas/model/Master/MasterDaerahModel.dart';
import 'package:eduNitas/model/Master/MasterJurusanModel.dart';
import 'package:eduNitas/model/Master/PendidikanModel.dart';
import 'package:eduNitas/model/Master/ProdiMultipleModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/model/karir/ShowBahasa.dart';
import 'package:eduNitas/model/karir/ShowKemampuan.dart';
import 'package:eduNitas/model/karir/SpesialisasiModel.dart';
import 'package:eduNitas/pages/Account/account.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/UserViewModel.dart';

import 'package:eduNitas/viewmodels/viewmodel.dart';
import 'package:eduNitas/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:eduNitas/model/Auth/PendidikanUserDetailModel.dart';
import 'package:eduNitas/model/karir/ShowPengalamanModel.dart';
import 'package:eduNitas/model/karir/ShowInfoTambahan.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

part 'listDatadiri.dart';
part 'gantiPassword.dart';
part 'pendidikan.dart';
part 'insert_pengalaman.dart';
part 'insert_keterampilan.dart';
part 'insert_infotambahan.dart';
part 'show_pengalaman.dart';
part 'edit_pengalaman.dart';
part 'show_ketarampilan.dart';
part 'show_infotambahan.dart';
part 'insert_kemampuan.dart';
part 'insert_bahasa.dart';
