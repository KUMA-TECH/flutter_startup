import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const THEME_MODE_KEY = 'THEME_MODE_KEY';

class ThemeController extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;

  ThemeMode intToMode(int idx) {
    Map<int, ThemeMode> themeDic = {
      0: ThemeMode.system,
      1: ThemeMode.light,
      2: ThemeMode.dark
    };
    return themeDic[idx] ?? ThemeMode.system;
  }

  int modeToInt(ThemeMode mode) {
    return mode.index;
  }

  // ThemeMode get themeMode => _mode;
  Future<ThemeMode> get themeMode async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? idx = prefs.getInt(THEME_MODE_KEY);
    return intToMode(idx!);
  }

  void setMode(ThemeMode mode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(THEME_MODE_KEY, mode.index);
    _mode = mode;
    notifyListeners();
  }
}
