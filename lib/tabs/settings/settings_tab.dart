import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/utilits/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String route = "settings";

  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;

  bool darkModeSwitch = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
          buildSettingsRow("العربية", arSwitch, (newValue) {
            arSwitch = newValue;
            if (arSwitch) {
              provider.setCurrentLocal("ar");
            } else {
              provider.setCurrentLocal("en");
            }
          }),
          buildSettingsRow(
              AppLocalizations.of(context)!.darkMode, darkModeSwitch,
              (newValue) {
            darkModeSwitch = newValue;
            if (darkModeSwitch) {
              provider.setCurrentMode(ThemeMode.dark);
            } else {
              provider.setCurrentMode(ThemeMode.light);
            }
          })
        ],
      ),
    );
  }

  Widget buildSettingsRow(
      String title, bool switchValue, Function(bool) onChange) {
    return Row(children: [
      const SizedBox(
        width: 16,
      ),
      Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const Spacer(),
      Switch(
        value: switchValue,
        onChanged: onChange,
        activeColor: AppColors.primary,
      ),
    ]);
  }
}
