import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:ios_edunitas/model/karir/detail_karir_me_Model.dart';
import 'package:ios_edunitas/model/karir/listKarirPatner.dart';
import 'package:ios_edunitas/pages/Account/me/me_partnerkarir/me_partnerkarir.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ios_edunitas/model/karir/status_responseKarir.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as Img;
import 'package:path_provider/path_provider.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ios_edunitas/model/Auth/PendidikanUserDetailModel.dart';
import 'package:ios_edunitas/model/Auth/UsersDetailModel.dart';
import 'package:ios_edunitas/model/Master/MasterDaerahModel.dart';
import 'package:ios_edunitas/model/Master/MasterJurusanModel.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:ios_edunitas/model/karir/RiwayatLamaran.dart';
import 'package:ios_edunitas/model/karir/ShowBahasa.dart';
import 'package:ios_edunitas/model/karir/ShowInfoTambahan.dart';
import 'package:ios_edunitas/model/karir/ShowKemampuan.dart';
import 'package:ios_edunitas/model/karir/ShowPengalamanModel.dart';
import 'package:ios_edunitas/model/karir/SpesialisasiModel.dart';
import 'package:ios_edunitas/model/karir/detailKarir.dart';
import 'package:ios_edunitas/model/karir/listKarir.dart';
import 'package:ios_edunitas/pages/Account/datadiri/pengaturan.dart';
import 'package:ios_edunitas/pages/Auth/Auth.dart';
import 'package:ios_edunitas/pages/Home/karir/downloadfile.dart';
import 'package:ios_edunitas/pages/Home/karir/widgetKarir/widgetkarir.dart';
import 'package:ios_edunitas/pages/Home/widget_home/widget_home.dart';
import 'package:ios_edunitas/shared/shared.dart';
import 'package:ios_edunitas/viewmodels/UserViewModel.dart';
import 'package:ios_edunitas/viewmodels/viewmodel.dart';

import 'package:ios_edunitas/widget/widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';

part 'karir_main.dart';
part 'karir_detail.dart';
part 'karir_myapply.dart';
part 'karir_listme.dart';
part 'partner_karir_main.dart';
part 'karir_pilihtemplate.dart';
part 'karir_endposting.dart';
