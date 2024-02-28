import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/overview_screen.dart';
import 'package:flutter_ahmenes_application/start_point.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget skipButton(int i, context) {
  if (i == 0) {
    return Positioned(
        top: 60,
        right: 20,
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginOptionScreen()),
              );
            },
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(125, 45)),
                shadowColor: null,
                overlayColor: const MaterialStatePropertyAll(Colors.white70),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(100, 255, 255, 255))),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            label: const Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            )));
  } else {
    return const Text('');
  }
}

Widget learnMore(int i, context) {
  if (i == 4) {
    return Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Container(
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
    );
  }
  return const Text('');
}

Widget titleBlock(int i) {
  return Text(
    sliderData[i][1],
    style: const TextStyle(
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
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 2.0,
    ),
  );
}

Widget changeButton(int i, context, CarouselController controller) {
  return Visibility(
    visible: i < 4,
    child: ElevatedButton(
        onPressed: () {
          controller.nextPage();
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: Size(100, 100),
        )),
  );
}

Widget buildIndicator(int i, context) {
  return Visibility(
      visible: i < 4,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: sliderData.length,
          curve: Curves.easeInOut,
          effect: ScrollingDotsEffect(
              maxVisibleDots: 5,
              offset: 12,
              fixedCenter: true,
              spacing: MediaQuery.of(context).size.width * 0.15,
              strokeWidth: 3,
              dotColor: Colors.white,
              activeDotScale: 2,
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.white,
              paintStyle: PaintingStyle.stroke),
        ),
      ));
}
