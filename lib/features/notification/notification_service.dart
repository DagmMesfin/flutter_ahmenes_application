import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('apod');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
    notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
    print("initialized successfully");
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }

  Future<void> toggleNotifications(bool enable) async {
    print("it's toggling");
    if (enable) {
      DateTime now = DateTime.now();
      DateTime morningTime =
          DateTime(now.year, now.month, now.day, 8, 0, 0); // 8:00 AM
      if (now.isAfter(morningTime)) {
        morningTime = morningTime.add(Duration(
            days: 1)); // Schedule for the next day if the time has passed
      }

      await scheduleNotification(
        id: 1,
        title: 'Good Morning!',
        body: 'Start your day with a fresh mind.',
        scheduledDate: morningTime,
      );

      DateTime noonTime =
          DateTime(now.year, now.month, now.day, 18, 0, 0); // 12:00 PM
      if (now.isAfter(noonTime)) {
        noonTime = noonTime.add(Duration(
            days: 1)); // Schedule for the next day if the time has passed
      }

      await scheduleNotification(
        id: 2,
        title: 'Good Afternoon!',
        body: 'Take a break and relax.',
        scheduledDate: noonTime,
      );
      var listo = await notificationsPlugin.getActiveNotifications();
      print(listo);
      print(tz.local);
      print("scheduled successfully");
    } else {
      var listo = await notificationsPlugin.pendingNotificationRequests();
      if (!listo.isEmpty) {
        print(listo);
        print(listo[0].title);
        print(listo[0].body);
      }

      await cancelAllNotifications();
    }
  }
}
