import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_startup/data/Menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadStructuredData('assets/config/menu.json', (value) {
        Map<String, dynamic> config = jsonDecode(value);

        return Future.value(DrawerEntity.fromJson(config));
      }),
      builder: (context, snapshot) {
        Widget container;
        if (snapshot.connectionState != ConnectionState.done) {
          container = const Center(child: CircularProgressIndicator());
        } else {
          var header = snapshot.data!.header;
          var source = snapshot.data!.menus;

          List<Widget> children = [
            DrawerHeader(
              child: Image.asset(header.icon),
            )
          ];

          children.addAll(source
              .map((menu) => DrawerListTile(
                    title: menu.title,
                    svgSrc: menu.icon ?? '',
                    press: () {
                      print(menu.route);
                    },
                  ))
              .toList());

          container = ListView(
            children: children,
          );
        }
        return Drawer(
          child: container,
        );
      },
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
