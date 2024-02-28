import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/pages/profile/UpdateProfilePage.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = isDarkMode ? Color.fromARGB(255, 57, 57, 57) : Colors.white;
    var textColor = isDarkMode ? Colors.white : Colors.black;
    var editButtonColor = isDarkMode ? Colors.yellow : Colors.blue;
    var trailingBoxColor = isDarkMode ? Color.fromARGB(255, 57, 57, 57) : Color.fromARGB(255, 119, 120, 121);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
            color: textColor,
          ),
          title: Text('profile', style: TextStyle(color: textColor)),
          actions: [
            IconButton(
              onPressed: _toggleDarkMode,
              icon: Icon(Icons.dark_mode, color: textColor),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: backgroundColor,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
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
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                      
                                    ),
                                    child: const Icon(Icons.edit),
                                  ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Brayn wolf',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  'braynwolf@gmail.com',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>  UpdateProfilePage(),
    ),
  );
},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: editButtonColor,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                    child: Text('Edit Profile', style: TextStyle(color: textColor)),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(),
                ProfileMenuWidget(
                  title: 'App preference',
                  icon: ImageIcon(
                    AssetImage('assets/icons/Adjust.png'),
                    color: isDarkMode ? Colors.yellow : Colors.blue,
                  ),
                  onPress: () {},
                  textColor: textColor,
                  isLogout: false,
                  trailingBoxColor: trailingBoxColor,
                ),
                ProfileMenuWidget(
                  title: 'App Notification',
                  icon: ImageIcon(
                    AssetImage('assets/icons/Notification 1.png'),
                    color: isDarkMode ? Colors.yellow : Colors.blue,
                  ),
                  onPress: () {},
                  textColor: textColor,
                  isLogout: false,
                  trailingBoxColor: trailingBoxColor,
                ),
                ProfileMenuWidget(
                  title: 'Help and support',
                  icon: ImageIcon(
                    AssetImage('assets/icons/help.png'),
                    color: isDarkMode ? Colors.yellow : Colors.blue,
                  ),
                  onPress: () {},
                  textColor: textColor,
                  isLogout: false,
                  trailingBoxColor: trailingBoxColor,
                ),
                const Divider(),
                const SizedBox(height: 20),
                ProfileMenuWidget(
                  title: 'Give feedback',
                  icon: ImageIcon(
                    AssetImage('assets/icons/Thumbs.png'),
                    color: isDarkMode ? Colors.yellow : Colors.blue,
                  ),
                  onPress: () {},
                  textColor: textColor,
                  isLogout: false,
                  trailingBoxColor: trailingBoxColor,
                ),
                ProfileMenuWidget(
                  title: 'Logout',
                  icon: Icon(Icons.logout, color: Colors.red),
                  onPress: () {},
                  textColor: isDarkMode ? Colors.white : Colors.red,
                  isLogout: true,
                  trailingBoxColor: trailingBoxColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    required this.textColor,
    required this.isLogout,
    required this.trailingBoxColor,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color textColor;
  final bool isLogout;
  final Color trailingBoxColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 119, 120, 121),
        ),
        child: icon,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: trailingBoxColor,
              ),
              child: const Icon(Icons.chevron_right),
            )
          : null,
    );
  }
}
