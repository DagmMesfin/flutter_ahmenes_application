import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginState(bool isLoggedIn) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', isLoggedIn);
}

Future<bool> getLoginState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

void _saveNotificationPreference(bool enabled) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('notificationsEnabled', enabled);
}
