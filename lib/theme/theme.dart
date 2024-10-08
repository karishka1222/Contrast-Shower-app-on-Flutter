import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFEDEDED),
    primary: Color(0xFFF95657),
    secondary: Colors.white,
    tertiary: Color(0xFF766D6D),
    inversePrimary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFFEDEDED),
    primary: Color(0xFFF95657),
    secondary: Colors.white,
    tertiary: Color(0xFF766D6D),
    inversePrimary: Colors.black,
  ),
);