import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/model/Auth/UsersDetailModel.dart';
import 'package:eduNitas/model/Campus/PhotoModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/model/agent/add_mhs_agensi.dart';
import 'package:eduNitas/model/agent/check_rekening.dart';
import 'package:eduNitas/model/agent/daftar_mhs_rekomen.dart';
import 'package:eduNitas/model/agent/data_bank.dart';
import 'package:eduNitas/pages/Auth/Auth.dart';
import 'package:eduNitas/pages/Home/widget_home/widget_home.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/UserViewModel.dart';
import 'package:eduNitas/viewmodels/viewmodel.dart';
import 'package:eduNitas/widget/widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as Img;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';


part 'mainAgensi.dart';
part 'informasi_perolehan.dart';
part 'formulir_mitra_agensi.dart';
part 'agensi_me.dart';
part 'agensi_login.dart';
