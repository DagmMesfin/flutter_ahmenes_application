import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/overview_screen.dart';

class satellietsstartingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double circleSize = 70.0;

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        // Background Image (Replace with your desired background image)

        const Image(
          image: AssetImage('assets/images/image 6.jpg'),
          fit: BoxFit.cover,
        ),

        const Positioned(
          top: 80,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Learn about',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      height: 1,
                      letterSpacing: 3.0,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Satellites',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1,
                      letterSpacing: 3.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 265,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'venture into the realm of\nman-made wonders that orbits\nour planet.in this section,\nyou will uncover the ingenuity\nbehind satellites, from\ncommunication satellites\nlinking the world to earth.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: Container(
            width: 10,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                // Navigate to the OverviewScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginOptionScreen()),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class LoginOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (Replace with your desired background image)
          const Image(
            image: AssetImage('assets/images/image 7.jpg'),
            fit: BoxFit.cover,
          ),
          const Positioned(
            top: 80,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s float in',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Universe',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 160,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unlock a universe of\nknowledge and adventure\nwith your pass.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the OverviewScreen when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => userlogin()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle the gesture when "Create New Account" is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewUserLogin()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewUserLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (Replace with your desired background image)
          const Image(
            image: AssetImage('assets/images/image 8.jpg'),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50,
            left: 40,
            child: GestureDetector(
              onTap: () {
                // Handle back button press (navigate to previous page)
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 93, 92, 92),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 100,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 250),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/person.png',
                      height: 5, // Adjust height as needed
                      width: 5, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Email field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/email.png',
                      height: 10, // Adjust height as needed
                      width: 10, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/lockIcon.png',
                      height: 5, // Adjust height as needed
                      width: 5, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // ... (Sign up button code)

                // Terms and Conditions
                // ... (Terms and Conditions code)
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the OverviewScreen when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homescreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle the gesture when "Create New Account" is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewUserLogin()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class userlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (Replace with your desired background image)
          const Image(
            image: AssetImage('assets/images/image 8.jpg'),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50,
            left: 40,
            child: GestureDetector(
              onTap: () {
                // Handle back button press (navigate to previous page)
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 93, 92, 92),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Positioned(
            top: 100,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 250),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name field

                // Email field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/email.png',
                      height: 10, // Adjust height as needed
                      width: 10, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/lockIcon.png',
                      height: 5, // Adjust height as needed
                      width: 5, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the OverviewScreen when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homescreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'log in',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle the gesture when "Create New Account" is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgotpassword()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'forget password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class forgotpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (Replace with your desired background image)
          const Image(
            image: AssetImage('assets/images/image 8.jpg'),
            fit: BoxFit.cover,
          ),
          const Positioned(
            top: 80,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 250),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name field

                // Email field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/email.png',
                      height: 10, // Adjust height as needed
                      width: 10, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/lockIcon.png',
                      height: 5, // Adjust height as needed
                      width: 5, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the OverviewScreen when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OverviewScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'log in',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle the gesture when "Create New Account" is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewUserLogin()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'forget password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (Replace with your desired background image)
          const Image(
            image: AssetImage('assets/images/image 9.jpg'),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome onboard,',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Space Voyager!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 3.0,
                      ),
                    ),
                    SizedBox(
                        width: 16), // Add space between text and profile image
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/image 10.jpg'), // Replace with your image asset
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 250),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name field

                // Email field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/email.png',
                      height: 10, // Adjust height as needed
                      width: 10, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/lockIcon.png',
                      height: 20, // Adjust height as needed
                      width: 20, // Adjust width as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the OverviewScreen when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OverviewScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'log in',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle the gesture when "Create New Account" is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewUserLogin()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'forget password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
