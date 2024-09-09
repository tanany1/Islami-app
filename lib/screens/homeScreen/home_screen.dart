import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/tabs/ahadeth/ahadeth.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/settings/settings_tab.dart';
import 'package:islami/utilits/app_assets.dart';
import 'package:islami/utilits/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String route = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;

  void setCurrentTabIndex(int currentIndex) {
    currentTabIndex = currentIndex;
  }

  List<Widget> tabs = [
    QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];

  Widget body = QuranTab();

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  settingsProvider.isDarkMode()
                      ? AppAssets.darkBackground
                      : AppAssets.background,
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: buildAppBar(),
          bottomNavigationBar: buildBottomNavigation(),
          body: body,
        ));
  }

  AppBar buildAppBar() => AppBar(
        title: Text(
          AppLocalizations.of(context)!.islami,
        ),
      );

  Widget buildBottomNavigation() => Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          items: [
            buildBottomNavigationBarItem(AppAssets.icQuran, "Quran"),
            buildBottomNavigationBarItem(AppAssets.icAhadeth, "Ahadeth"),
            buildBottomNavigationBarItem(AppAssets.icSebha, "Sebha"),
            buildBottomNavigationBarItem(AppAssets.icRadio, "Radio"),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.white,
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            if (currentTabIndex == 0) {
              body = QuranTab();
            } else if (currentTabIndex == 1) {
              body = const AhadethTab();
            } else if (currentTabIndex == 2) {
              body = const SebhaTab();
            } else if (currentTabIndex == 3) {
              body = const RadioTab();
            } else {
              body = const SettingsTab();
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
