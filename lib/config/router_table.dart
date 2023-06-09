import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_startup/app/screen/main/main_screen.dart';

/// 路由注册表
///

Map<String, WidgetBuilder> routerTable = {
  '/': (context) => const MainScreen(), // home 入口
  '/json': (context) => DashboardScreen(),
};
