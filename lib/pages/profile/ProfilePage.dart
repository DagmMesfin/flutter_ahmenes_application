import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String fullName;
  late String email;

  @override
  void initState() {
    super.initState();
    // Fetch user details when the widget is initialized
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userEmail = user.email ?? '';
      String username = user.displayName ?? '';

      // Query Firestore to get the user details based on email or username
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If email match found, extract data
        Map<String, dynamic> userData = querySnapshot.docs.first.data();
        fullName = userData['full name'];
        email = userData['email'];
      } else {
        // If email match not found, try searching by username
        QuerySnapshot<Map<String, dynamic>> usernameQuerySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('username', isEqualTo: username)
            .get();

        if (usernameQuerySnapshot.docs.isNotEmpty) {
          // If username match found, extract data
          Map<String, dynamic> userData = usernameQuerySnapshot.docs.first.data();
          fullName = userData['full name'];
          email = userData['email'];
        } else {
          // Handle the case where user details are not found
          fullName = 'N/A';
          email = 'N/A';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Full Name: $fullName'),
            Text('Email: $email'),
          ],
        ),
      ),
    );
  }
}
