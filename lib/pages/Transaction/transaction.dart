import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ios_edunitas/model/transaction/transactionModel.dart';
import 'package:ios_edunitas/model/transaction/transactionModel2.dart';
import 'package:ios_edunitas/pages/Auth/Auth.dart';
import 'package:ios_edunitas/pages/Home/widget_home/donasi/widget_donasi.dart';
import 'package:ios_edunitas/pages/Home/widget_home/widget_home.dart';
import 'package:ios_edunitas/shared/shared.dart';

import 'package:ios_edunitas/viewmodels/transactionview_model.dart';
import 'package:ios_edunitas/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:connectivity/connectivity.dart';
import 'package:another_flushbar/flushbar.dart';


// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import 'package:shimmer/shimmer.dart';

import '../../shared/shared.dart';

part 'MainTransaction.dart';
part 'MainTransactionEduCampus.dart';
part 'MainTransactionEduDonation.dart';

part 'MainTransactionEduCampusHistory.dart';
part 'MainTransactionEduDonasiHistory.dart';
part 'TrasnsactionHistory.dart';
part 'noTransaction.dart';
part 'metodepembayaranHardcode.dart';
