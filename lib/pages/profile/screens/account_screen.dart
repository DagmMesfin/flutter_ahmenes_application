import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/features/notification/notification_service.dart';
import 'package:flutter_ahmenes_application/features/user_auth/firbase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter_ahmenes_application/global/common/toast.dart';
import 'package:flutter_ahmenes_application/models/user_model.dart';
import 'package:flutter_ahmenes_application/pages/profile/screens/edit_screen.dart';
import 'package:flutter_ahmenes_application/pages/profile/screens/about_us.dart';
import 'package:flutter_ahmenes_application/pages/profile/widgets/forward_button.dart';
import 'package:flutter_ahmenes_application/pages/profile/widgets/setting_item.dart';
import 'package:flutter_ahmenes_application/pages/profile/widgets/setting_switch.dart';

import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool notific = false;
  bool notificationsEnabled = true;

  void _toggleNotifications() async {
    setState(() {
      notificationsEnabled = !notificationsEnabled;
    });
    await NotificationService().toggleNotifications(notificationsEnabled);
    _saveNotificationPreference(notificationsEnabled);
  }

  void _loadNotificationPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? enabled = prefs.getBool('notificationsEnabled');
    setState(() {
      notificationsEnabled = enabled ?? true;
    });
    await NotificationService().toggleNotifications(notificationsEnabled);
  }

  void _saveNotificationPreference(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notificationsEnabled', enabled);
  }

  UserModel user = UserModel.empty();
  var store = FirebaseFirestore.instance;
  var isLoading = false;

  void fetchUserData() async {
    var docs = await store
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      user = UserModel.fromSnapshot(docs);
    });
  }

  void loadData() {
    // Simulating data loading process
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        print(user.toJson());
        isLoading = false;
      });
    });
    print('After setState: $isLoading');
  }

  void updateData() {
    setState(() {
      fetchUserData();
      isLoading = true;
      loadData();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    updateData();
    _loadNotificationPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fire = FirebaseAuthService();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                    fontFamily: "kontakt",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 40),
              const Text(
                "Account",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: NetworkImage(user.profilepic))),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          user.email,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )
                      ],
                    ),
                    const Spacer(),
                    ForwardButton(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditAccountScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              SettingSwitch(
                title: "Notifications",
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                value: notificationsEnabled,
                onTap: (value) {
                  _toggleNotifications();
                  if (notificationsEnabled) {
                    showToast(
                        message: "Daily Notification Enabled Successfully");
                  } else {
                    showToast(
                        message: "Daily Notification Disabled Successfully");
                  }
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Sign Out",
                icon: Ionicons.log_out,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () => fire.signOut(context),
              ),
              const SizedBox(height: 20),
              SettingItem(
                  title: "About Us",
                  icon: Ionicons.people,
                  bgColor: Colors.purple.shade100,
                  iconColor: Colors.purple,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
