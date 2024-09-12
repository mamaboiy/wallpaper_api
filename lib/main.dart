import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/page/Details_page.dart';
import 'package:wallpaper_api/page/Splash_screen.dart';
import 'package:wallpaper_api/page/wallpaperhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/home',
      // getPages: [
      //   GetPage(name: '/home', page: ()=>Wallpaperhome()),
      //   GetPage(name: '/secondpage', page: ()=>SecondPage()),
      // ],

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashScreen(),
    );
  }
}

