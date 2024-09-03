import 'package:flutter/material.dart';
import 'package:islami/screens/sura_details/sura_details.dart';
import 'package:islami/utilits/app_assets.dart';
import 'package:islami/utilits/app_colors.dart';
import 'package:islami/utilits/app_theme.dart';

import '../../model/screen_details_args.dart';
import '../../utilits/constants.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.quranTabLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildScreenContent(),
              Container(
                  width: 3, height: double.infinity, color: AppColors.primary)
            ],
          ),
        )
      ],
    );
  }

  Widget buildScreenContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.primary,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "Verses",
                style: AppTheme.mediaTitleTextStyle,
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                "Sura Name",
                style: AppTheme.mediaTitleTextStyle,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.primary,
        ),
        Expanded(flex: 7, child: buildSuraListView()),
      ],
    );
  }

  ListView buildSuraListView() {
    return ListView.builder(
        itemCount: Constants.suraNames.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ScreenDetailsArgs arguments = ScreenDetailsArgs(
                  name: Constants.suraNames[index],
                  fileName: "${index + 1}.txt");
              Navigator.pushNamed(context, SuraDetails.route,
                  arguments: arguments);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                  "${Constants.versesNumber[index]}",
                  style: AppTheme.regularTitleTextStyle,
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  Constants.suraNames[index],
                  style: AppTheme.regularTitleTextStyle,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          );
        });
  }
}
