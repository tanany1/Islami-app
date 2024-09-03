import 'package:flutter/material.dart';
import 'package:islami/screens/ahadeth_details/ahadeth_details.dart';

import '../../model/screen_details_args.dart';
import '../../utilits/app_assets.dart';
import '../../utilits/app_colors.dart';
import '../../utilits/app_theme.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Center(child: Image.asset(AppAssets.ahadethTabLogo))),
        Expanded(
          flex: 7,
          child: buildScreenContent(),
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
                "Hadeth Name",
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
        itemCount: 50,
        itemBuilder: (context, index) {
          String hadethName = " الحديث رقم ${index + 1}";
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, AhadethDetails.route,
                  arguments: ScreenDetailsArgs(
                      name: hadethName, fileName: "h${index + 1}.txt"));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                  hadethName,
                  style: AppTheme.regularTitleTextStyle,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          );
        });
  }
}
