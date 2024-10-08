import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loadAnim(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.5,
    width: MediaQuery.of(context).size.width * 0.8,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.asset(
        'assets/anim/loadingScreen.json',
        height: 200.0,
        repeat: true,
        animate: true,
      ),
      Text(
        "Fetching from the universe!",
        style: TextStyle(
            fontFamily: "canis minor",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      )
    ]),
  );
}

Widget loadLogo(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.5,
    width: MediaQuery.of(context).size.width * 0.8,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.asset(
        'assets/anim/loadingScreen.json',
        height: 100.0,
        repeat: true,
        animate: true,
      ),
    ]),
  );
}
