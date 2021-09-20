import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_edunitas/model/Master/StatusModel.dart';
import 'package:flutter_app_edunitas/model/agent/data_bank.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_detail.dart';
import 'package:flutter_app_edunitas/model/me/foto_edit_campaign.dart';
import 'package:flutter_app_edunitas/shared/shared.dart';
import 'package:flutter_app_edunitas/viewmodels/donasiview_model.dart';
import 'package:flutter_app_edunitas/model/donasi/donasi_mydesk.dart';
import 'package:flutter_app_edunitas/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as Img;
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';

part 'me_mainDonasi.dart';
part 'me_data_campaigner.dart';
part 'me_pencairan_dana.dart';
part 'me_kabar_post.dart';
