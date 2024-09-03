import 'package:flutter/material.dart';
import 'package:islami/screens/homeScreen/home_screen.dart';
import 'package:islami/utilits/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = "Splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppAssets.splash,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
