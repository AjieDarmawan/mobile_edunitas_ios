import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_edunitas/model/Auth/UsersDetailModel.dart';
import 'package:flutter_app_edunitas/model/Master/KampusMaster.dart';
import 'package:flutter_app_edunitas/model/Master/KelasModel.dart';
import 'package:flutter_app_edunitas/model/Master/MasterJurusanModel.dart';
import 'package:flutter_app_edunitas/model/Master/PendidikanModel.dart';
import 'package:flutter_app_edunitas/model/Master/StatusModel.dart';
import 'package:flutter_app_edunitas/model/Master/UnitAreaModel.dart';
import 'package:flutter_app_edunitas/pages/Account/me/me_campus/me_kampus.dart';
import 'package:flutter_app_edunitas/pages/Auth/Auth.dart';
import 'package:flutter_app_edunitas/pages/Home/home.dart';
import 'package:flutter_app_edunitas/shared/shared.dart';
import 'package:flutter_app_edunitas/viewmodels/UserViewModel.dart';
import 'package:flutter_app_edunitas/viewmodels/apiview_model.dart';
import 'package:flutter_app_edunitas/viewmodels/viewmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

part 'pendaftaran_online_main.dart';
part 'form_pendaftaranonline.dart';
