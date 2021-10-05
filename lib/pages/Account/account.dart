import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/constant/constant.dart';
import 'package:eduNitas/model/Auth/UsersDetailModel.dart';
import 'package:eduNitas/model/Master/PendidikanModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/pages/Account/datadiri/pengaturan.dart';
import 'package:eduNitas/pages/Auth/Auth.dart';
import 'package:eduNitas/pages/Home/karir/karir.dart';
import 'package:eduNitas/pages/Home/widget_home/agensi/widget_agensi.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/UserViewModel.dart';
import 'package:eduNitas/viewmodels/apiview_model.dart';
import 'package:eduNitas/viewmodels/viewmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:image/image.dart' as Img;

import 'me/me_campus/me_kampus.dart';
import 'me/me_partner/me_partner.dart';
import 'me/me_partnerkarir/me_partnerkarir.dart';
import 'me/me_donasi/me_donasi.dart';
import 'me/me_partnerdonasi/me_partnerdonasi.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as Img;
import 'package:path_provider/path_provider.dart';

import '../../shared/shared.dart';

part 'MainAccount.dart';
part 'SettingAccount.dart';
part 'edit_account.dart';
