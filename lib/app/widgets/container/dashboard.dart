import 'package:flutter/material.dart';
import 'package:flutter_startup/res/dimensions.dart';

// ignore: must_be_immutable
/// 所有菜单项 dashboard 容器
class Dashboard extends StatelessWidget {
  /// 路由配置表
  final Map<String, WidgetBuilder> routerTable;
  WidgetBuilder? builder;

  Dashboard({super.key, required this.routerTable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      // primary: false,
      padding: defaultPadding,
      child: builder?.call(context),
    )));
  }
}
