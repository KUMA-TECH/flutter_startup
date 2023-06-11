import 'package:flutter/material.dart';
import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/data/menu.dart';
import 'package:flutter_startup/res/dimensions.dart';
import 'package:flutter_startup/utils/navigator/navigator_compat.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(builder: (context, provider, child) {
      MenuListModel? model = provider.menuModel;
      if (model == null) {
        return const SizedBox();
      }
      var menus = model.menus[provider.currentIndex];
      return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListView(children: [
          const SizedBox(height: defaultPaddingValue),
          ...menus.children!.map((e) {
            return Consumer<NavigatorCompat>(
                builder: (context, navigator, child) {
              return ListTile(
                  title: Text(e.title,
                      style: Theme.of(context).textTheme.labelMedium),
                  onTap: () {
                    if (e.route?.isNotEmpty ?? false) {
                      // ignore '/' for now
                      if (e.route == '/') return;
                      navigator.pushNamed(context, e.route!);
                    }
                  });
            });
          })
        ]),
      );
    });
  }
}
