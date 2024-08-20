import 'package:contrast_shower/pages/home_page.dart';
import 'package:contrast_shower/pages/welcome_page.dart';
import 'package:contrast_shower/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
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
      },
    );
  }
}
