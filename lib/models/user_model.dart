import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class UserModel {
  String? id;
  String fullName;
  String username;
  String email;
  String profilepic;

  UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.profilepic,
      required this.username});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full name': fullName,
      'email': email,
      'profilepic': profilepic,
      'username': username
    };
  }

  static UserModel empty() => UserModel(
        id: '',
        fullName: '',
        username: '',
        email: '',
        profilepic:
            "https://th.bing.com/th/id/OIP.wKJRMskw7LFsAKtcKbu2dQAAAA?rs=1&pid=ImgDetMain",
      );

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    print(data);
    if (data != null) {
      return UserModel(
        id: FirebaseAuth.instance.currentUser!.uid,
        fullName: data['full name'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        profilepic: data["profilepic"] ??
            "https://th.bing.com/th/id/OIP.wKJRMskw7LFsAKtcKbu2dQAAAA?rs=1&pid=ImgDetMain",
      );
    } else {
      return UserModel.empty();
    }
  }
}
