import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/app/widgets/container/dash_container.dart';
import 'package:flutter_startup/app/widgets/container/dashboard.dart';
import 'package:flutter_startup/app/widgets/menu/rail_menu.dart';
import 'package:flutter_startup/app/widgets/menu/side_menu.dart';
import 'package:flutter_startup/app/widgets/responsive.dart';

import 'package:flutter/material.dart';
import 'package:flutter_startup/config/global_config.dart';
import 'package:flutter_startup/config/router_table.dart';
import 'package:provider/provider.dart';

import '../setting/setting.dart';

/// dynamic menu + dashboard
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuProvider>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavRailMenu(configAsset: GlobalConfig.defaultMenuConfig),
            // default flex = 1 and it takes 1/6 part of the screen
            Consumer<MenuProvider>(builder: (context, value, child) {
              if (Responsive.isDesktop(context)) {
                return const Expanded(child: SideMenu());
              } else {
                return const SizedBox();
              }
            }),

            // It takes 5/6 part of the screen
            Expanded(
              flex: 6,
              child: Dashboard(routerTable: routerTable),
            ),
          ],
        ),
      ),
    );
  }
}
