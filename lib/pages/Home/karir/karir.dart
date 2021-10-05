import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:eduNitas/model/karir/detail_karir_me_Model.dart';
import 'package:eduNitas/model/karir/listKarirPatner.dart';
import 'package:eduNitas/pages/Account/me/me_partnerkarir/me_partnerkarir.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:eduNitas/model/karir/status_responseKarir.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as Img;
import 'package:path_provider/path_provider.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/model/Auth/PendidikanUserDetailModel.dart';
import 'package:eduNitas/model/Auth/UsersDetailModel.dart';
import 'package:eduNitas/model/Master/MasterDaerahModel.dart';
import 'package:eduNitas/model/Master/MasterJurusanModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/model/karir/RiwayatLamaran.dart';
import 'package:eduNitas/model/karir/ShowBahasa.dart';
import 'package:eduNitas/model/karir/ShowInfoTambahan.dart';
import 'package:eduNitas/model/karir/ShowKemampuan.dart';
import 'package:eduNitas/model/karir/ShowPengalamanModel.dart';
import 'package:eduNitas/model/karir/SpesialisasiModel.dart';
import 'package:eduNitas/model/karir/detailKarir.dart';
import 'package:eduNitas/model/karir/listKarir.dart';
import 'package:eduNitas/pages/Account/datadiri/pengaturan.dart';
import 'package:eduNitas/pages/Auth/Auth.dart';
import 'package:eduNitas/pages/Home/karir/downloadfile.dart';
import 'package:eduNitas/pages/Home/karir/widgetKarir/widgetkarir.dart';
import 'package:eduNitas/pages/Home/widget_home/widget_home.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/UserViewModel.dart';
import 'package:eduNitas/viewmodels/viewmodel.dart';

import 'package:eduNitas/widget/widget.dart';
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
