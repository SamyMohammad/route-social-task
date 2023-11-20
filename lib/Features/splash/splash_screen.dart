import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:route_social_app/Features/home/presentation/pages/home_screen.dart';
import 'package:route_social_app/core/resources/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 4000,
        splash:
            Image.asset(ImageAssets.logoRoute, width: 220, fit: BoxFit.cover),
        nextScreen: const HomeScreen(),
        animationDuration: const Duration(milliseconds: 2000),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white);
  }
}
