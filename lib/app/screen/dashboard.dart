// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_startup/app/widgets/container/dashboard.dart';
// import 'package:flutter_startup/app/widgets/container/notifications.dart';
// import 'package:flutter_startup/app/widgets/menu/drawer.dart';
// import 'package:flutter_startup/config/global_config.dart';

// class DashboardScreen extends StatelessWidget {
//   DashboardScreen({super.key});

//   Widget buildMenuDrawer(BuildContext context) {
//     return MenuDrawer();
//   }

//   Widget buildMainContainer(BuildContext context) {
//     return Dashboard();
//   }

//   Widget buildNotifications(BuildContext context) {
//     return NotifyContainer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //var query = MediaQuery.of(context);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         buildMenuDrawer(context),
//         VerticalDivider(
//           width: 1,
//           thickness: 1,
//           color: Theme.of(context).dividerTheme.color,
//         ),
//         buildMainContainer(context),
//         VerticalDivider(
//           width: 1,
//           thickness: 1,
//           color: Theme.of(context).dividerTheme.color,
//         ),
//         buildNotifications(context),
//       ],
//     );
//   }
// }
