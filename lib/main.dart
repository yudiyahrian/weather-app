import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/pages/five_days.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => const SplashScreen(),
      '/home' : (context) => const Home(),
      '/fiveDays' : (context) => const FiveDays(),
    },
  ));
}