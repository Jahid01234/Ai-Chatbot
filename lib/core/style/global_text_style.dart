import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle globalTextStyle(
    BuildContext context, {
      double fontSize = 15.0,
      FontWeight fontWeight = FontWeight.normal,
      double lineHeight = 1.5,
      Color? color,
    }) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: lineHeight,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}