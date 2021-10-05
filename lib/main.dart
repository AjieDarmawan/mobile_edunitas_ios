// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:eduNitas/pages/Home/home.dart';
import 'package:eduNitas/pages/Home/widget_home/agensi/widget_agensi.dart';
import 'package:eduNitas/widget/widget.dart';

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

//todo firebase set from console
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }
//
// /// Create a [AndroidNotificationChannel] for heads up notifications
// AndroidNotificationChannel channel;
//
// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


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

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //
  // // Set the background messaging handler early on, as a named top-level function
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // if (!kIsWeb) {
  //   channel = const AndroidNotificationChannel(
  //     'high_importance_channel', // id
  //     'High Importance Notifications', // title
  //     'This channel is used for important notifications.', // description
  //     importance: Importance.high,
  //   );
  //
  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //
  //   /// Create an Android Notification Channel.
  //   ///
  //   /// We use this channel in the `AndroidManifest.xml` file to override the
  //   /// default FCM channel to enable heads up notifications.
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  //
  //   /// Update the iOS foreground notification presentation options to allow
  //   /// heads up notifications.
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edunitas',
      home: SPSatu(),
      routes: <String, WidgetBuilder>{
        INTRO: (BuildContext context) => SPSatu(),
         ONBOARDING: (BuildContext context) => Onboarding(),
        SIGN_IN: (BuildContext context) => Login(),
         SIGN_UP: (BuildContext context) => Register(),
         HOMEPAGE: (BuildContext context) => MainHome(),
         NAVI: (BuildContext context) => Navigation_bottom(),
         ACTIVASI: (BuildContext context) => Activasi(),
         AGENSILOGIN: (BuildContext context) => AgensiLogin(),
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
