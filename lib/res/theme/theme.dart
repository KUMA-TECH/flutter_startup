import 'package:flutter/material.dart';
import 'package:flutter_startup/res/color.dart';

class ThemeProvider {
  static ThemeData defaultTheme() {
    return ThemeData(primarySwatch: Colors.amber);
  }

  static ThemeData lightTheme() {
    // var colorScheme = ColorScheme.fromSeed(
    //   seedColor: Colors.black87,
    //   primary: Colors.lightBlueAccent,
    //   primaryContainer: Colors.white54,
    //   secondaryContainer: Colors.amber,
    // );

    return ThemeData(colorScheme: lightColorScheme, useMaterial3: true);
  }

  static ThemeData dartTheme() {
    return ThemeData(colorScheme: darkColorScheme, useMaterial3: true);
  }
}
