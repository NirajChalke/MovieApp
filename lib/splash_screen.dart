import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Container(
          height: 100,
          width: 100,
          child: Lottie.asset("assets/animations/Animation - 1727189285154.json")),
      ),
       nextScreen: MainScreen(),
       duration:3500 ,
       backgroundColor: Colors.black,
       );
  }
}
