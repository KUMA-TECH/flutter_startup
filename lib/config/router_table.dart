import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/json/format/json_format.dart';
import 'package:flutter_startup/app/screen/main/main_screen.dart';
import 'package:flutter_startup/app/screen/main/overview_screen.dart';
import 'package:flutter_startup/app/screen/setting/setting.dart';

/// 路由注册表
Map<String, WidgetBuilder> routerTable = {
  '/': (context) => const MainScreen(), // home 入口
  '/overview': (context) => const OverviewScreen(),
  '/json': (context) => const JsonFormatScreen(),
  '/setting': (context) => const SettingScreen(),
};
