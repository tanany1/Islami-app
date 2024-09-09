import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );

  static const TextStyle mediaTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.lightBlack,
  );
  static const TextStyle regularTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.lightBlack,
  );

  static const TextStyle settingTabTitle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.primary);

  static const TextStyle settingOptionTitle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.normal, color: AppColors.primary);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primary,
      dividerTheme:
          const DividerThemeData(thickness: 3, color: AppColors.primary),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          titleTextStyle: appBarTextStyle),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 26),
      ),
      textTheme: const TextTheme(
        bodyLarge: settingOptionTitle,
        bodyMedium: settingTabTitle,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primaryDark,
      dividerTheme:
          const DividerThemeData(thickness: 3, color: AppColors.accentDark),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          titleTextStyle: appBarTextStyle.copyWith(color: AppColors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentDark,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 26),
      ),
      textTheme: TextTheme(
        bodyLarge: settingOptionTitle.copyWith(color: AppColors.white),
        bodyMedium: settingTabTitle.copyWith(color: AppColors.white),
      ));
}
