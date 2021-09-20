// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import 'constant/constant.dart';
import 'pages/Auth/Auth.dart';
import 'pages/Splash/intro.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "My App",
//     home: new MyApp(),
//   ));
// }

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

const debug = true;
// void main()async  {
//   //GestureBinding.instance.resamplingEnabled = true;
//   //  WidgetsFlutterBinding.ensureInitialized();

//   HttpOverrides.global = new MyHttpOverrides();
//   WidgetsFlutterBinding.ensureInitialized();
//    await FlutterDownloader.initialize(debug: debug);
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
//     runApp(MyApp());
//   });
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edunitas',
      home: Login(),
      routes: <String, WidgetBuilder>{
        INTRO: (BuildContext context) => SPSatu(),
        // ONBOARDING: (BuildContext context) => Onboarding(),
        SIGN_IN: (BuildContext context) => Login(),
        // SIGN_UP: (BuildContext context) => Register(),
        // HOMEPAGE: (BuildContext context) => MainHome(),
        // NAVI: (BuildContext context) => Navigation_bottom(),
        // ACTIVASI: (BuildContext context) => Activasi(),
        // AGENSILOGIN: (BuildContext context) => AgensiLogin(),
      },
    );
  }
}

// void main() => runApp(
//      DevicePreview(
//       // enabled: !kReleaseMode,
//         //enabled: !kReleaseMode,
//        builder: (context) => MyApp(),
//      ),
//    );

// class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      locale: DevicePreview.of(context).locale, // <--- Add the locale
//      builder: DevicePreview.appBuilder, // <--- Add the builder
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: Navigation_bottom(),
//    );
//  }
// }
