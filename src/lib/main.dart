import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/app_routes.dart';
import 'utils/theme.dart';

import 'testClasses/testaccount.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDOZg6YPRA_6OWJeMwMzqXG2msA1gkJaFM",
      appId: "1:568628724389:android:50f770cd7b718be710834c",
      messagingSenderId: "568628724389",
      projectId: 'mypet-ad114',
      storageBucket: "http://mypet-ad114.appspot.com",
    ),
  );
//  Test t=Test();
//  t.main();
  ///Please update theme as per your need if required.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'demo1234',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.logInPageScreen,
      routes: AppRoutes.routes,
    );
  }
}
