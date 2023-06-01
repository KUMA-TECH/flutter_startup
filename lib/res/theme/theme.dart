import 'package:flutter/material.dart';
import 'package:flutter_startup/res/color.dart';
import 'package:flutter_startup/res/font.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider {
  static ThemeData defaultTheme() {
    return ThemeData(primarySwatch: Colors.amber);
  }

  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: lightColorScheme.background,
      textTheme: GoogleFonts.poppinsTextTheme(lightTextTheme),
      canvasColor: lightColorScheme.secondary,
    );
  }

  static ThemeData dartTheme() {
    return ThemeData(
      colorScheme: darkColorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: darkColorScheme.background,
      textTheme: GoogleFonts.poppinsTextTheme(darkTextTheme),
      canvasColor: darkColorScheme.secondary,
    );
  }
}
