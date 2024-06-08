import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/features/notification/notification_service.dart';
import 'package:flutter_ahmenes_application/features/user_auth/presentation/pages/pages/overview/launch_screen.dart';
import 'package:flutter_ahmenes_application/home_screen.dart';
import 'package:flutter_ahmenes_application/models/prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Map timezoneNames = {
  -43200000: 'Etc/GMT+12',
  -39600000: 'Pacific/Midway',
  -36000000: 'Pacific/Honolulu',
  -32400000: 'America/Anchorage',
  -28800000: 'America/Los_Angeles',
  -25200000: 'America/Denver',
  -21600000: 'America/Chicago',
  -18000000: 'America/New_York',
  -10800000: 'America/Sao_Paulo',
  -7200000: 'Atlantic/South_Georgia',
  -3600000: 'Atlantic/Azores',
  0: 'UTC',
  3600000: 'Europe/Berlin',
  7200000: 'Europe/Kiev',
  10800000: 'Europe/Moscow',
  14400000: 'Asia/Dubai',
  18000000: 'Asia/Karachi',
  19800000: 'Asia/Kolkata',
  20700000: 'Asia/Kathmandu',
  21600000: 'Asia/Dhaka',
  25200000: 'Asia/Bangkok',
  28800000: 'Asia/Hong_Kong',
  32400000: 'Asia/Tokyo',
  36000000: 'Australia/Sydney',
  39600000: 'Pacific/Noumea',
  43200000: 'Pacific/Auckland',
};

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  final String currentTimeZones = await FlutterTimezone.getLocalTimezone();
  final String currentTimeZone =
      timezoneNames[DateTime.now().timeZoneOffset.inMilliseconds];
  print(currentTimeZone + "${DateTime.now().timeZoneOffset}");

  tz.setLocalLocation(tz.getLocation(currentTimeZones));
  print(currentTimeZones);

  NotificationService().initNotification();

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
