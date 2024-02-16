import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<List<String>> sliderData = [
  [
    'assets/images/image 2.jpg',
    'Insights',
    '"Embark on an interstellar\nvoyage like never before. explore\ndistant galaxies, uncover cosmic\nsecretes, amd witness the majesty\n of the universe. your cosmic\nadventure begins here."',
  ],
  [
    'assets/images/image 3.jpg',
    'Galaxies',
    'Explore the Marvels of Galaxies:\nDive in to a cosmic journey to\nlearn about the awe-inspiring\ngalaxies that populate our\nuniverse."',
  ],
  [
    'assets/images/image 4.jpg',
    'Stars',
    'Stellar Discoveries: Embark on\nan illuminating voyage to\nuncover the secrets of stars.\nFrom the blazing birth of stars\nto the enchanting\nconstellations that adorn our\nnight sky.',
  ],
  [
    'assets/images/image 5.jpg',
    'Planets',
    'Embark on celestical journey\nto explore the ca[tivating\nrealms of planets. from the \nfiery surface of venus to the\nicy mysteries of neptune.this\nsection is your portal to\nunravel the diverse\nlandscapes and enigmas.',
  ],
  [
    'assets/images/image 6.jpg',
    'Satellites',
    'venture into the realm of\nman-made wonders that orbits\nour planet.in this section,\nyou will uncover the ingenuity\nbehind satellites, from\ncommunication satellites\nlinking the world to earth.',
  ],
];

Widget learnMore(int i) {
  if (i > 0) {
    return Text(
      'Learn about',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        height: 1,
        letterSpacing: 3.0,
      ),
    );
  }
  return Text('');
}

Widget titleBlock(int i) {
  return Text(
    sliderData[i][1],
    style: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 1,
      letterSpacing: 3.0,
    ),
  );
}

Widget descriptionBlock(int i) {
  return Text(
    sliderData[i][2],
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 2.0,
    ),
  );
}

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            aspectRatio: MediaQuery.of(context).size.width /
                MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale),
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Stack(fit: StackFit.expand, children: [
          Image(
            image: AssetImage(sliderData[itemIndex][0]),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 80,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [learnMore(itemIndex)],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [titleBlock(itemIndex)],
                ),
                SizedBox(
                  height: 350,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [descriptionBlock(itemIndex)],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
