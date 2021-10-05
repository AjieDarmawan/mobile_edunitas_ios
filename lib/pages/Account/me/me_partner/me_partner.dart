import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/model/Master/MasterDaerahModel.dart';
import 'package:eduNitas/model/Master/MasterJurusanModel.dart';
import 'package:eduNitas/model/Master/ProdiMultipleModel.dart';
import 'package:eduNitas/model/Master/StatusModel.dart';
import 'package:eduNitas/shared/shared.dart';
import 'package:eduNitas/viewmodels/viewmodel.dart';
import 'package:eduNitas/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as Img;

import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as Img;
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';

part 'SingkronPartner.dart';

part 'ProdiMultiple.dart';
