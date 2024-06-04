import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(AhamenesApp());

class AhamenesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahamenes Space Science and Technology Club',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(
      name: 'Dagim Mesfin',
      role: 'Mobile Developer',
      avatar: 'assets/images/dagim_mesfin.jpg',
      email: 'dagmmesfin99@gmail.com',
      linkedIn: 'https://www.linkedin.com/in/dagimmesfin',
      bio:
          'Dagim Mesfin, a visionary Flutter mobile developer, soars through the cosmic realms of digital innovation with unmatched creativity and precision. In the ever-expanding universe of app development, he is a celestial navigator, skillfully weaving together the constellations of code and design. His passion for crafting seamless and enchanting user experiences is as boundless as the cosmos, illuminating each project with a touch of the extraordinary.',
    ),
    TeamMember(
      name: 'Dagmawi Ayenew',
      role: 'Mobile Developer',
      avatar: 'assets/images/dagmawi_ayenew.jpg',
      email: 'aaydagi77@gmail.com',
      linkedIn: 'https://www.linkedin.com/in/dagmawi-ayenew-3889a8296/',
      bio:
          'Dagmawi Ayenew is an intrepid mobile developer, navigating the vast digital cosmos with unparalleled skill and ingenuity. With a mind as expansive as the universe, he crafts stellar mobile applications that transcend the ordinary, constantly pushing the boundaries of what’s possible in the mobile realm.',
    ),
    TeamMember(
      name: 'Yohannes Getachew',
      role: 'UI/UX Design',
      avatar: 'assets/images/jj.jpg',
      email: 'yohannesgetachewerieso@gmail.com',
      linkedIn: 'https://www.linkedin.com/in/yohannes-getachew-667a1b241',
      bio:
          'Yohannes Getachew, a stellar UI/UX designer, ventures through the cosmos of digital design with the grace of a seasoned space cadet. His passion for crafting delightful user experiences is as boundless as the universe itself. With each project, he navigates the intricate constellations of code and design, creating interfaces that captivate and inspire, leaving a trail of stellar experiences in his wake.',
    ),
  ];

  Future<void> _launchURL(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Parallax effect
          Positioned.fill(
            child: Image.asset(
              'assets/images/image 4.jpg', // Background image of stars and constellations
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                // Trigger rebuild when scrolling
                return true;
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ParallaxWidget(child: buildContent(context)),
                ],
              ),
            ),
          ),
          Positioned(
              left: 10,
              top: 35,
              child: IconButton(
                  style: ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Ionicons.arrow_undo)))
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/aha.jpg'), // Club's logo
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Ahamenes Space Science and Technology Club',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Ahamenes Space Club is dedicated to astronomy and space technology. We engage in educational outreach, public engagement, and collaborate with space agencies. Through events like star-gazing and workshops, we inspire curiosity about the cosmos and build a community of enthusiasts. We participate in citizen science initiatives, partner with advocacy groups, and highlight the practical benefits of space exploration, from technological advancements to environmental monitoring. Join us in our journey of exploration and innovation.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'Behind the APOD',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Column(
            children: teamMembers.map((member) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  color: Color.fromARGB(135, 57, 57, 57),
                  shadowColor: Colors.blue,
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () => showProfile(context, member),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(member.avatar),
                      ),
                    ),
                    title: Text(
                      member.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    subtitle: Text(member.role,
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 14)),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Ionicons.mail,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _launchURL(Uri.parse('mailto:${member.email}'));
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Ionicons.logo_linkedin,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _launchURL(Uri.parse(member.linkedIn));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(135, 57, 57, 57)),
                shadowColor: MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: () {
                // Implement join us action here
              },
              child: Text(
                'Join Us',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Connect with Us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Ionicons.globe,
                  color: Colors.white,
                ),
                onPressed: () {
                  _launchURL(
                      Uri.parse('https://space-website-amber.vercel.app/'));
                },
              ),
              IconButton(
                icon: Icon(
                  Ionicons.logo_linkedin,
                  color: Colors.white,
                ),
                onPressed: () {
                  _launchURL(Uri.parse(
                      'https://www.linkedin.com/company/ahamenes-space-technology-institute'));
                },
              ),
              IconButton(
                icon: Icon(
                  Ionicons.paper_plane,
                  color: Colors.white,
                ),
                onPressed: () {
                  _launchURL(Uri.parse('https://t.me/Ahamenes101'));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showProfile(BuildContext context, TeamMember member) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Center(
              child: Container(
                child: AlertDialog(
                  backgroundColor:
                      Color.fromARGB(255, 46, 46, 46).withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text(
                    member.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(member.avatar),
                      ),
                      SizedBox(height: 10),
                      Text(
                        member.role,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        member.bio,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.email, color: Colors.white),
                            onPressed: () {
                              // Open email client
                            },
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.linked_camera, color: Colors.white),
                            onPressed: () {
                              // Open LinkedIn profile
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Close',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Top left Lottie animation
            Positioned(
              top: 30,
              right: 40,
              child: Lottie.asset('assets/anim/top-right.json',
                  width: 100, height: 100),
            ),
            // Bottom right Lottie animation
            Positioned(
              bottom: 30,
              left: 40,
              child: Lottie.asset('assets/anim/bottom-left.json',
                  width: 100, height: 100),
            ),
          ],
        );
      },
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  final Widget child;

  const ParallaxWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        return false;
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/image 4.jpg', // Background image of stars and constellations
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class TeamMember {
  final String name;
  final String role;
  final String avatar;
  final String email;
  final String linkedIn;
  final String bio;

  TeamMember({
    required this.name,
    required this.role,
    required this.avatar,
    required this.email,
    required this.linkedIn,
    required this.bio,
  });
}
