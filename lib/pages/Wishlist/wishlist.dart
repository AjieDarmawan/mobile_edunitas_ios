import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_edunitas/model/Campus/PhotoModel.dart';
import 'package:flutter_app_edunitas/model/Master/StatusModel.dart';
import 'package:flutter_app_edunitas/pages/Auth/Auth.dart';
import 'package:flutter_app_edunitas/pages/Home/home.dart';
import 'package:flutter_app_edunitas/pages/Wishlist/widgetWishlist/widgetWishlist.dart';
import 'package:flutter_app_edunitas/shared/shared.dart';
import 'package:flutter_app_edunitas/viewmodels/whitlistview_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:another_flushbar/flushbar.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:shimmer/shimmer.dart';

part 'mainWishlist.dart';
