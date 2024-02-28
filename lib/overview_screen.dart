import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ahmenes_application/widgets.dart';

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

int activeIndex = 0;

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => OverviewScreenState();
}

class OverviewScreenState extends State<OverviewScreen> {
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            options: CarouselOptions(
              initialPage: 0,
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemCount: 5,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Stack(
                        fit: StackFit.expand,
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
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
                          children: [titleBlock(itemIndex)],
                        ),
                      ],
                    ),
                  ),
                  skipButton(itemIndex, context),
                  Positioned(
                    bottom: 150,
                    left: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        descriptionBlock(itemIndex),
                      ],
                    ),
                  ),
                ]),
          ),
          Positioned(
            bottom: 30,
            child: buildIndicator(activeIndex, context),
          ),
          learnMore(activeIndex, context),
          Positioned(
              bottom: 20,
              child: changeButton(activeIndex, context, controller)),
        ],
      ),
    );
  }
}
