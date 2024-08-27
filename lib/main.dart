import 'package:flutter/material.dart';
import 'package:islami/screens/homeScreen/home_screen.dart';
import 'package:islami/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route :(_)=> SplashScreen(),
        HomeScreen.route :(_)=> HomeScreen(),
      },
    );
  }
}

