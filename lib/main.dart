import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/features/user_auth/presentation/pages/pages/overview/launch_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDclF897_TJozNkQX_ewmGydb4vOdSB-7I",
    appId: "1:885187451260:web:e1e4a26e8c62d376fb6cf9",
    messagingSenderId: "885187451260",
    projectId: "picture-of-the-day-67e3f",
  ));

  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true, // Enable offline data persistence
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaunchScreen(),
    );
  }
}
