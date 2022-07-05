import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/model/Campus/PhotoModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/pages/Auth/Auth.dart';
import 'package:eduNitas/pages/Home/home.dart';
import 'package:eduNitas/pages/Wishlist/widgetWishlist/widgetWishlist.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/whitlistview_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:another_flushbar/flushbar.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:shimmer/shimmer.dart';

part 'mainWishlist.dart';
