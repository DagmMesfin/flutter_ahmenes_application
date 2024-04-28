import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/home_screen.dart';
import 'package:flutter_ahmenes_application/models/user_model.dart';
import 'package:flutter_ahmenes_application/pages/HomeScreenContent_page.dart';
import 'package:flutter_ahmenes_application/pages/profile/widgets/edit_item.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  UserModel user = UserModel.empty();
  var store = FirebaseFirestore.instance;
  var isLoading = false;
  var namecont = TextEditingController();
  var usernamecont = TextEditingController();

  final picker = ImagePicker();
  XFile? pickedFile;

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
        namecont.text = user.fullName;
        usernamecont.text = user.username;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var url = user.profilepic;

    void uploadImageToFirestore() async {
      if (pickedFile != null) {
        final imageFile = File(pickedFile!.path);
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('images/${DateTime.now().toString()}');
        final uploadTask = storageRef.putFile(imageFile);

        // Monitor the upload task
        await uploadTask.whenComplete(() {
          // Get the download URL
          storageRef.getDownloadURL().then((imageUrl) {
            // Store the download URL in Firestore
            setState(() {
              url = imageUrl;
            });
          });
        });
      }
    }

    Future<void> pickImage() async {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          pickedFile = pickedImage;
          uploadImageToFirestore();
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: const Icon(
            Ionicons.chevron_back_outline,
            color: Colors.white,
          ),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () async {
                if (namecont.text.isNotEmpty && usernamecont.text.isNotEmpty) {
                  try {
                    user.username = usernamecont.text;
                    user.fullName = namecont.text.capitalize!;
                    user.profilepic = url;
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set(user.toJson());
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    Get.snackbar(
                      'Success',
                      'Your Profile has been Modified.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green.withOpacity(0.1),
                      colorText: Colors.green,
                    );
                  } catch (e) {
                    Get.snackbar(
                      'Error',
                      'Some error occured: $e',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.withOpacity(0.1),
                      colorText: Colors.red,
                    );
                  }
                } else {
                  Get.snackbar(
                    'Error',
                    'Write the Fields Correctly',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red.withOpacity(0.1),
                    colorText: Colors.red,
                  );
                }
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(60, 50),
                elevation: 3,
              ),
              icon: Icon(Ionicons.checkmark, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 40),
              EditItem(
                title: "Photo",
                widget: Column(
                  children: [
                    Image.network(url),
                    TextButton(
                      onPressed: () {
                        pickImage();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.lightBlueAccent,
                      ),
                      child: const Text("Upload Image"),
                    )
                  ],
                ),
              ),
              EditItem(
                title: "Name",
                widget: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: namecont,
                  textCapitalization: TextCapitalization.words,
                ),
              ),
              EditItem(
                title: "UserName",
                widget: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: usernamecont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
