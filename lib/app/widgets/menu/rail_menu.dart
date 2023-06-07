import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_startup/data/Menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavRailMenu extends StatefulWidget {
  final String configAsset;

  const NavRailMenu({super.key, required this.configAsset});

  @override
  State<NavRailMenu> createState() => _NavRailMenuState();
}

class _NavRailMenuState extends State<NavRailMenu> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = true;
  double groupAlignment = -1.0;

  _NavRailMenuState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadStructuredData(widget.configAsset, (value) {
        Map<String, dynamic> config = jsonDecode(value);
        return Future.value(MenuListEntity.fromJson(config));
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        var source = snapshot.data!.menus;
        List<NavigationRailDestination> destinations = [
          ...source
              .map((menu) => NavigationRailDestination(
                    icon: SvgPicture.asset(
                      menu.icon ?? '',
                      colorFilter: const ColorFilter.mode(
                          Colors.white54, BlendMode.srcIn),
                      height: Theme.of(context).iconTheme.size,
                    ),
                    // selectedIcon: Icon(Icons.favorite),
                    label: Text(menu.title),
                  ))
              .toList()
        ];

        return NavigationRail(
          minWidth: 96,
          selectedIndex: _selectedIndex,
          groupAlignment: groupAlignment,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
              //var menu = source[index];
              //menu.route;
            });
          },
          labelType: labelType,
          leading: showLeading
              ? FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(Icons.add),
                )
              : const SizedBox(),
          trailing: showTrailing
              ? IconButton(
                  onPressed: () {
                    // change theme: dark or light
                  },
                  icon: const Icon(Icons.wb_sunny_outlined),
                )
              : const SizedBox(),
          destinations: destinations,
        );
      },
    );
  }
}
