import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_edunitas/model/Master/MasterJurusanModel.dart';
import 'package:flutter_app_edunitas/model/Master/SmbModel.dart';
import 'package:flutter_app_edunitas/model/karir/SpesialisasiModel.dart';
import 'package:flutter_app_edunitas/model/karir/listKarir.dart';
import 'package:flutter_app_edunitas/pages/Home/karir/karir.dart';
import 'package:flutter_app_edunitas/shared/shared.dart';
import 'package:flutter_app_edunitas/viewmodels/viewmodel.dart';

import 'package:flutter_app_edunitas/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:shimmer/shimmer.dart';

part 'CardKarir.dart';
part 'SearchLowongan.dart';
part 'SearchLowonganHasil.dart';
