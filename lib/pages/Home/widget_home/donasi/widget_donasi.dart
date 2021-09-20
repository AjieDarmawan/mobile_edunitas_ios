import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ios_edunitas/model/Auth/UsersDetailModel.dart';
import 'package:ios_edunitas/model/Campus/PhotoModel.dart';
import 'package:ios_edunitas/model/Master/MasterJurusanModel.dart';
import 'package:ios_edunitas/model/Master/SmbModel.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:ios_edunitas/model/agent/add_mhs_agensi.dart';
import 'package:ios_edunitas/model/agent/check_rekening.dart';
import 'package:ios_edunitas/model/agent/daftar_mhs_rekomen.dart';
import 'package:ios_edunitas/model/agent/data_bank.dart';
import 'package:ios_edunitas/model/donasi/donasi_detail.dart';
import 'package:ios_edunitas/model/donasi/donasi_donatur.dart';
import 'package:ios_edunitas/model/donasi/donasi_kabar.dart';

import 'package:ios_edunitas/model/donasi/donasi_kirim_model.dart';
import 'package:ios_edunitas/model/karir/SpesialisasiModel.dart';
import 'package:ios_edunitas/pages/Auth/Auth.dart';
import 'package:ios_edunitas/pages/Home/karir/widgetKarir/widgetkarir.dart';
import 'package:ios_edunitas/pages/Home/widget_home/widget_home.dart';
import 'package:ios_edunitas/pages/Transaction/transaction.dart';
import 'package:ios_edunitas/shared/shared.dart';
import 'package:ios_edunitas/viewmodels/UserViewModel.dart';
import 'package:ios_edunitas/viewmodels/donasiview_model.dart';
import 'package:ios_edunitas/viewmodels/viewmodel.dart';
import 'package:ios_edunitas/widget/widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:html/parser.dart';

part 'main_donasi.dart';
part 'detail_donasi.dart';
part 'detail_lengkap_donasi.dart';
part 'formulir_donasi.dart';
part 'invoice_donasi.dart';
part 'bukti_bayar_donasi.dart';
part 'Search_donasi.dart';
part 'invoice_donasi_struk.dart';
part 'lihat_struk.dart';
