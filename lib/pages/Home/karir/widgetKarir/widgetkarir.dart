import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/model/Master/MasterDaerahModel.dart';
import 'package:eduNitas/model/Master/MasterJurusanModel.dart';
import 'package:eduNitas/model/Master/SmbModel.dart';
import 'package:eduNitas/model/karir/SpesialisasiModel.dart';
import 'package:eduNitas/model/karir/listKarir.dart';
import 'package:eduNitas/pages/Home/karir/karir.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/viewmodel.dart';

import 'package:eduNitas/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

part 'CardKarir.dart';
part 'SearchLowongan.dart';
part 'SearchLowonganHasil.dart';
