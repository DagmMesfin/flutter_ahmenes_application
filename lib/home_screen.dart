import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/pages/HomeScreenContent_page.dart';
import 'package:flutter_ahmenes_application/pages/VrShow_Page.dart';
import 'pages/profile/ProfilePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    HomeScreenContentPage(),
    VRShowpage(),
    ProfilePage(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 82, 82, 82),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 137, 135, 135),
          iconSize: 20,
          showSelectedLabels: false,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Home.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage('assets/icons/Microsoft HoloLens.png')),
              label: 'VR show',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Playlist.png')),
              label: 'Playlist',
            ),
          ]),
    );
  }
}
