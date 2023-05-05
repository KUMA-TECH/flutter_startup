import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/dashboard.dart';
import 'package:flutter_startup/config/global_config.dart';
import 'package:flutter_startup/res/theme/theme.dart';
import 'package:flutter_startup/utils/utilities.dart';

void main() {
  resizePCWindow(
      width: GlobalConfig.defaultWindowSize.width,
      height: GlobalConfig.defaultWindowSize.height);

  runApp(const Launcher());
}

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeProvider.lightTheme(),
      darkTheme: ThemeProvider.dartTheme(),
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: const Text('Start up'),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        body: DashboardScreen(),
        floatingActionButton: const FloatingActionButton(
          tooltip: 'Add',
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
