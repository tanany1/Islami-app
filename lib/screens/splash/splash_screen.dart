import 'package:flutter/material.dart';
import 'package:islami/screens/homeScreen/home_screen.dart';
import 'package:islami/utilits/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = "Splash";
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:2),
        (){
      Navigator.pushReplacementNamed(context, HomeScreen.route);
        }
    );
    return Scaffold(
      body: Image.asset(AppAssets.splash , fit: BoxFit.fill,
      width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
