import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/screens/ahadeth_details/ahadeth_details.dart';
import 'package:islami/screens/homeScreen/home_screen.dart';
import 'package:islami/screens/splash/splash_screen.dart';
import 'package:islami/screens/sura_details/sura_details.dart';
import 'package:islami/tabs/settings/settings_tab.dart';
import 'package:islami/utilits/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.currentLocal),
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (_) => SplashScreen(),
        HomeScreen.route: (_) => HomeScreen(),
        SuraDetails.route: (_) => SuraDetails(),
        AhadethDetails.route: (_) => AhadethDetails(),
        SettingsTab.route: (_) => SettingsTab(),
      },
    );
  }
}
