import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/pages/profile/ProfilePage.dart';
import 'package:get/get.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 74, 74),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(127, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigate back with updated data
            Navigator.pop(
              context,
              {
                'username': _usernameController.text,
                'email': _emailController.text,
              },
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Save changes logic
              // Add your logic to save the changes made
              // For example, update user data in the database
              Get.back(
                result: {
                  'username': _usernameController.text,
                  'email': _emailController.text,
                },
              );
            },
            icon: const Icon(Icons.save, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'assets/images/image 10.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),


                ],


              ),
              const SizedBox(height: 30),
              _buildEditableField(
                label: 'Username',
                controller: _usernameController,
                isPassword: false,
                boxColor: Color.fromARGB(255, 33, 33, 33),
              ),
              const SizedBox(height: 10),
              _buildEditableField(
                label: 'Password',
                controller: _passwordController,
                isPassword: true,
                boxColor: Color.fromARGB(255, 44, 44, 44),
              ),
              const SizedBox(height: 10),
              _buildEditableField(
                label: 'Email',
                controller: _emailController,
                isPassword: false,
                boxColor: Color.fromARGB(255, 55, 55, 55),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>  ProfilePage(),
    ),
  );
},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                    child: Text('Edit Profile', style: TextStyle(color: Colors.black)),
                  ),
                ),
            ],

          ),

        ),

      ),
      
    );
    
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isPassword,
    required Color boxColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Current: ${controller.text}', // Show current value
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    // Edit icon pressed logic
                    // You can show a dialog or navigate to another screen for editing
                    // For simplicity, we clear the text field for demonstration
                    controller.clear();
                  },
                  icon: const Icon(Icons.edit, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ),
        
        ],
         
      ),
        
        
    );
  
  }
}
