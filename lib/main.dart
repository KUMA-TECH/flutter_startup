import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/main/main_screen.dart';
import 'package:flutter_startup/app/state/MenuAppController.dart';
import 'package:flutter_startup/app/state/ThemeController.dart';
import 'package:flutter_startup/config/global_config.dart';
import 'package:flutter_startup/res/theme/theme.dart';
import 'package:flutter_startup/utils/utilities.dart';
import 'package:provider/provider.dart';

void main() {
  if (isPC()) {
    resizePCWindow(
        width: GlobalConfig.defaultWindowSize.width,
        height: GlobalConfig.defaultWindowSize.height);
  }

  runApp(const Launcher());
}

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(create: (conttext) => ThemeController())
        ],
        child: Consumer<ThemeController>(
          builder: (context, themeController, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'bejson',
              themeMode: themeController.themeMode,
              theme: ThemeProvider.lightTheme(),
              darkTheme: ThemeProvider.dartTheme(),
              home: const MainScreen(),
            );
          },
        ));
  }
}
