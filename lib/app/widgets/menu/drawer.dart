import 'package:flutter/widgets.dart';
import 'package:flutter_startup/app/widgets/menu/header.dart';
import 'package:flutter_startup/config/global_config.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({super.key});

  final List<String> entries = <String>[
    'Favorites',
    'Dashboard',
    'Pages',
    'User profile',
    'Default',
    'Usages',
    'Projects'
  ];

  Widget buildMenuList(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(entries[index]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var headerHeight = 132;
    var containerHeight = GlobalConfig.defaultMenuSize.height - headerHeight;
    return Column(
      children: [
        const MenuHeader(),
        SizedBox(
          width: GlobalConfig.defaultMenuSize.width,
          height: containerHeight,
          // color: Colors.white24,
          child: buildMenuList(context),
        )
      ],
    );
  }
}
