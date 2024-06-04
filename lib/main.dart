import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/features/user_auth/presentation/pages/pages/overview/launch_screen.dart';
import 'package:flutter_ahmenes_application/home_screen.dart';
import 'package:flutter_ahmenes_application/models/prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDclF897_TJozNkQX_ewmGydb4vOdSB-7I",
          appId: "1:885187451260:web:e1e4a26e8c62d376fb6cf9",
          messagingSenderId: "885187451260",
          projectId: "picture-of-the-day-67e3f",
          storageBucket: "gs://picture-of-the-day-67e3f.appspot.com"));

  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );

  bool isLoggedIn = await getLoginState();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomeScreen() : LaunchScreen(),
    );
  }
}
