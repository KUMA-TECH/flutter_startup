import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/main/main_screen.dart';
import 'package:flutter_startup/app/screen/setting/setting.dart';
import 'package:flutter_startup/res/dimensions.dart';
import 'package:flutter_startup/utils/navigator/navigator_compat.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable,
class Dashboard extends StatelessWidget {
  /// 路由配置表
  final Map<String, WidgetBuilder> routerTable;
  WidgetBuilder? builder;

  ///  所有菜单项 dashboard 容器
  Dashboard({super.key, this.builder, required this.routerTable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      // primary: false,
      padding: defaultPadding,
      child: Consumer<NavigatorCompat>(
        builder: (context, value, child) {
          String routeName = value.topScreen;
          if (_filterScreens(routeName)) return const SizedBox();
          if (routerTable.containsKey(routeName)) {
            WidgetBuilder b =
                routerTable[routeName] ?? (context) => Text(routeName);
            return b(context);
          } else {
            return Text(
                'Screen $routeName not found, check your congigure file: router_table.dart');
          }
        },
      ),
    )));
  }

  /// 需要过滤的页面
  /// 跳过系统主入口， 避免重复构建造成死循环
  bool _filterScreens(routeName) {
    return routeName =='/';
  }
}
