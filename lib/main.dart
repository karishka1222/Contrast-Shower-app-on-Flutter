import 'package:contrast_shower/pages/home_page.dart';
import 'package:contrast_shower/pages/summary_page.dart';
import 'package:contrast_shower/pages/timer_page.dart';
import 'package:contrast_shower/pages/welcome_page.dart';
import 'package:contrast_shower/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        "/welcome": (context) => WelcomePage(),
        "/home": (context) => HomePage(),
        "/timer": (context) => TimerPage(),
        "/summary": (context) => SummaryPage(),
      },
    );
  }
}
