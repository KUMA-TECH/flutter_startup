import 'package:flutter_startup/app/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_startup/app/state/MenuAppController.dart';
import 'package:flutter_startup/app/widgets/container/dash_container.dart';
import 'package:flutter_startup/app/widgets/menu/rail_menu.dart';
import 'package:flutter_startup/app/widgets/menu/side_menu.dart';
import 'package:flutter_startup/app/widgets/responsive.dart';

import 'package:flutter/material.dart';
import 'package:flutter_startup/config/global_config.dart';
import 'package:provider/provider.dart';

import '../setting/setting.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavRailMenu(
              configAsset: GlobalConfig.defaultMenuConfig,
            ),
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1 and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashContainer(
                child: SettingScreen(),
              ),
              // child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
