import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper_api/page/wallpaperhome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Get.offAll(() => Wallpaperhome())
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Lottie Animation
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Lottie.asset('assets/animation/wp.json', fit: BoxFit.cover),
          ),
          // Centered Text
          Center(
            child: Text(
              'Back Drops',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Change color based on your background
              ),
            ),
          ),
        ],
      ),
    );
  }
}