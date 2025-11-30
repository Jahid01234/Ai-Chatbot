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
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);