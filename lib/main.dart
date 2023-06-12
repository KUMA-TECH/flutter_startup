import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/main/main_screen.dart';
import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/app/state/theme_controller.dart';
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
          ChangeNotifierProvider(create: (context) => MenuProvider()),
          ChangeNotifierProvider(create: (conttext) => ThemeController())
        ],
        child: Consumer<ThemeController>(
            builder: (context, themeController, child) {
          return FutureBuilder(
              future: themeController.getThemeMode(),
              builder: (context, snapshot) {
                if (kDebugMode) {
                  print(snapshot.connectionState);
                  print(snapshot.data);
                }
                ThemeMode mode = snapshot.data ?? ThemeMode.system;
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'bejson',
                  themeMode: mode,
                  theme: ThemeProvider.lightTheme(),
                  darkTheme: ThemeProvider.dartTheme(),
                  home: const MainScreen(),
                );
              });
        }));
  }
}
