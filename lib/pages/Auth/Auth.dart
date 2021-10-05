import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:eduNitas/constant/constant.dart';
import 'package:eduNitas/model/Auth/LoginModel.dart';
import 'package:eduNitas/viewmodels/UserViewModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:eduNitas/constant/constant.dart';
import 'package:eduNitas/model/Auth/LoginModel.dart';
import 'package:eduNitas/model/Master/KelasModel.dart';
import 'package:eduNitas/model/Master/PendidikanModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/pages/Home/widget_home/agensi/widget_agensi.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/UserViewModel.dart';
import 'package:eduNitas/viewmodels/viewmodel.dart';
import 'package:eduNitas/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eduNitas/pages/Home/home.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:connectivity/connectivity.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shimmer/shimmer.dart';

part 'Login.dart';
part 'Register.dart';
part 'Regiter_datadiri.dart';
part 'Aktivasi.dart';
part 'Nonlogin.dart';
part 'email_forget_password.dart';
part 'form_forget_password.dart';
