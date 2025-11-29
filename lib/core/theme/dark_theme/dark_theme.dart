import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.black54,
    secondary: Colors.black54,

    onSurface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,

    primaryContainer: Colors.white,
    secondaryContainer: Color(0xff3f3f3f).withAlpha(100),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white.withAlpha(200)),
    bodyMedium: TextStyle(color: Colors.white.withAlpha(180)),
    labelLarge: TextStyle(color: Colors.white), // Button text
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);