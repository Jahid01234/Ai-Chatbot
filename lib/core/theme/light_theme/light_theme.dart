import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.teal,
    secondary: Color(0xffF7DC91),

    onSurface: Colors.black,
    onPrimary: Colors.black,
    onSecondary: Colors.white,

    primaryContainer: Colors.black,
    secondaryContainer: Colors.white.withAlpha(50),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white.withAlpha(200)),
    bodyMedium: TextStyle(color: Colors.white.withAlpha(180)),
    labelLarge: TextStyle(color: Colors.white),
  ),
);