import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utilits/app_theme.dart';

import '../../model/screen_details_args.dart';
import '../widgets/app_scaffold.dart';

class AhadethDetails extends StatefulWidget {
  const AhadethDetails({super.key});

  static const String route = "SuraDetails";

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  String fileContent = "";
  late ScreenDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if (fileContent.isEmpty) {
      readAhadethFile();
    }
    return AppScaffold(
      title: args.name,
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        margin: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: MediaQuery.of(context).size.height * 0.07),
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Text(
            fileContent,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: AppTheme.mediaTitleTextStyle,
          ),
        ),
      ),
    );
  }

  Future<void> readAhadethFile() async {
    Future<String> futureFileContent =
        rootBundle.loadString("assets/files/ahadeth/${args.fileName}");
    fileContent = await futureFileContent;
    setState(() {});
  }
}
