import 'package:flutter/material.dart';

import '../../utilits/app_assets.dart';
import '../../utilits/app_colors.dart';
import '../../utilits/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget? bottomNavigation;
  final Widget body;

  const AppScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.bottomNavigation});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          AppAssets.background,
        ))),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
            title: Text(
              title,
              style: AppTheme.mediaTitleTextStyle,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.transparent,
          ),
          bottomNavigationBar: bottomNavigation,
          body: body,
        ));
    ;
  }
}
