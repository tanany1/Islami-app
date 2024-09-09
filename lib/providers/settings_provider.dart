import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocal = "en";
  ThemeMode currentMode = ThemeMode.light;

  void setCurrentLocal(String newLocal) {
    currentLocal = newLocal;
    notifyListeners();
  }

  void setCurrentMode(ThemeMode newThemeMode) {
    currentMode = newThemeMode;
    notifyListeners();
  }

  bool isDarkMode() => currentMode == ThemeMode.dark;
}
