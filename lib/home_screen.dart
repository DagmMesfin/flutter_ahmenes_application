import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/pages/HomeScreenContent_page.dart';
import 'package:flutter_ahmenes_application/pages/VrShow_Page.dart';
import 'package:flutter_ahmenes_application/pages/profile/screens/account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    HomeScreenContentPage(),
    VRShowpage(),
    AccountScreen(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 12, 12, 12),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 137, 135, 135),
          iconSize: 35,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Home.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage('assets/icons/Microsoft HoloLens.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Playlist.png')),
              label: '',
            ),
          ]),
    );
  }
}
