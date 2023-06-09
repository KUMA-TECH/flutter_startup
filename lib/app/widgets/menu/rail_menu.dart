import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/data/menu.dart';
import 'package:flutter_startup/res/dimensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavRailMenu extends StatefulWidget {
  final String configAsset;

  const NavRailMenu({super.key, required this.configAsset});

  @override
  State<NavRailMenu> createState() => _NavRailMenuState();
}

class _NavRailMenuState extends State<NavRailMenu> {
  NavigationRailLabelType labelType = NavigationRailLabelType.selected;
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
          return Future.value(MenuListModel.fromJson(config));
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Consumer<MenuProvider>(builder: (context, provider, child) {
            var source = snapshot.data!.menus;
            provider.cacheMenuModel(snapshot.data!);

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

            return Container(
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   children: [
                  //     const Text('Jackson'),
                  //     const SizedBox(width: 20),
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(100),
                  //       child: Image.network(
                  //         'https://images.unsplash.com/photo-1678875922894-7d3210b0787d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDI2fHRvd0paRnNrcEdnfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
                  //         width: 64,
                  //         height: 64,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: defaultPaddingValue),
                  Expanded(
                    child: NavigationRail(
                      minWidth: 96,
                      selectedIndex: provider.currentIndex,
                      groupAlignment: groupAlignment,
                      onDestinationSelected: (index) =>
                          provider.updateSelection(index),
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
                                // more functions
                              },
                              icon: const Icon(Icons.more_horiz),
                            )
                          : const SizedBox(),
                      destinations: destinations,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // change theme: dark or light
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                  ),
                  const SizedBox(height: defaultPaddingValue),
                ],
              ),
            );
          });
        });
  }
}
