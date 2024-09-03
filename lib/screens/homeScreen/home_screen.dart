import 'package:flutter/material.dart';
import 'package:islami/tabs/ahadeth/ahadeth.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/utilits/app_assets.dart';
import 'package:islami/utilits/app_colors.dart';

import '../../utilits/app_theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String route = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;

  Widget body = QuranTab();

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
          appBar: buildAppBar(),
          bottomNavigationBar: buildBottomNavigation(),
          body: body,
        ));
  }

  AppBar buildAppBar() => AppBar(
        title: Text(
          "Islami",
          style: AppTheme.mediaTitleTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      );

  Widget buildBottomNavigation() => Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
          items: [
            buildBottomNavigationBarItem(AppAssets.icQuran, "Quran"),
            buildBottomNavigationBarItem(AppAssets.icAhadeth, "Ahadeth"),
            buildBottomNavigationBarItem(AppAssets.icSebha, "Sebha"),
            buildBottomNavigationBarItem(AppAssets.icRadio, "Radio"),
          ],
          selectedItemColor: AppColors.lightBlack,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.white,
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            if (currentTabIndex == 0) {
              body = QuranTab();
            } else if (currentTabIndex == 1) {
              body = AhadethTab();
            } else if (currentTabIndex == 2) {
              body = SebhaTab();
            } else {
              body = RadioTab();
            }
            setState(() {});
          },
        ),
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(
          String imagePath, String label) =>
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(imagePath),
            size: 32,
          ),
          label: label);
}
