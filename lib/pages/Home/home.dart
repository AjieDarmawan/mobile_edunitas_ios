import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ios_edunitas/constant/constant.dart';
import 'package:ios_edunitas/model/Campus/DetailCampus.dart';
import 'package:ios_edunitas/model/Master/BannerModel.dart';
import 'package:ios_edunitas/model/Campus/ListCampus.dart';
import 'package:ios_edunitas/model/Master/LogoGambar.dart';
import 'package:ios_edunitas/model/Campus/PhotoModel.dart';
import 'package:ios_edunitas/model/Campus/SipemaModel.dart';
import 'package:ios_edunitas/model/Master/StatusModel.dart';
import 'package:ios_edunitas/pages/Home/widget_home/promosi/widget_promosi.dart';
import 'package:ios_edunitas/pages/Home/widget_home/readmore_text.dart';
import 'package:ios_edunitas/pages/Home/widget_home/widget_home.dart';
import 'package:ios_edunitas/pages/Inbox/inbox.dart';
import 'package:ios_edunitas/shared/shared.dart';
import 'package:ios_edunitas/viewmodels/eduinfoview_model.dart';
import 'package:ios_edunitas/viewmodels/viewmodel.dart';
import 'package:ios_edunitas/widget/widget.dart';
import 'package:ios_edunitas/support/connetion_check.dart';
import 'package:connectivity/connectivity.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:flutter/services.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';

import 'package:format_indonesia/format_indonesia.dart';


// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../shared/shared.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

//import 'package:native_updater/native_updater.dart';
import 'package:forceupdate/forceupdate.dart';

import 'package:html/parser.dart';

part 'home_main.dart';
part 'home_detail.dart';
part 'home_detail_page.dart';
part 'search_home.dart';
