import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utilits/app_theme.dart';

import '../../model/screen_details_args.dart';
import '../widgets/app_scaffold.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  static const String route = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String fileContent = "";
  late ScreenDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if (fileContent.isEmpty) {
      readSuraFile();
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

  Future<void> readSuraFile() async {
    Future<String> futureFileContent =
        rootBundle.loadString("assets/files/quran/${args.fileName}");
    fileContent = await futureFileContent;
    List<String> fileLines = fileContent.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += "(${i + 1})";
    }
    fileContent = fileLines.join(" ");
    setState(() {});
  }
}
