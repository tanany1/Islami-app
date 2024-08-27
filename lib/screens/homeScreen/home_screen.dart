import 'package:flutter/material.dart';
import 'package:islami/utilits/app_assets.dart';
import 'package:islami/utilits/app_colors.dart';
import '../../utilits/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route ="Home";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.background))
      ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
            title: Text("Islami", style: AppTheme.appBarTextStyle,),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.transparent,
          ),
        )
    );
  }
}
