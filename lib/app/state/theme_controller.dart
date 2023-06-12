import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const THEME_MODE_KEY = 'THEME_MODE_KEY';

class ThemeController extends ChangeNotifier {
  ThemeMode intToMode(int idx) {
    Map<int, ThemeMode> themeDic = {
      0: ThemeMode.system,
      1: ThemeMode.light,
      2: ThemeMode.dark
    };
    return themeDic[idx] ?? ThemeMode.system;
  }

  Future<ThemeMode> getThemeMode() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int idx = prefs.getInt(THEME_MODE_KEY) ?? ThemeMode.system.index;
      return Future.value(intToMode(idx));
    } catch (e) {
      return Future.value(ThemeMode.system);
    }
  }

  void setMode(ThemeMode mode) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(THEME_MODE_KEY, mode.index);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('setMode error with: $e');
      }
    }
  }
}
