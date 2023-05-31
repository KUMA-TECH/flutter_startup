import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/dashboard.dart';
import 'package:flutter_startup/app/screen/main/main_screen.dart';
import 'package:flutter_startup/app/state/MenuAppController.dart';
import 'package:flutter_startup/config/global_config.dart';
import 'package:flutter_startup/res/theme/theme.dart';
import 'package:flutter_startup/utils/utilities.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  resizePCWindow(
      width: GlobalConfig.defaultWindowSize.width,
      height: GlobalConfig.defaultWindowSize.height);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bejson',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: Theme.of(context).colorScheme.background,
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      //       .apply(bodyColor: Colors.white),
      //   canvasColor: Theme.of(context).colorScheme.secondary,
      // ),
      theme: ThemeProvider.dartTheme(),
      darkTheme: ThemeProvider.dartTheme(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}

// class Launcher extends StatelessWidget {
//   const Launcher({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeProvider.lightTheme(),
//       darkTheme: ThemeProvider.dartTheme(),
//       home: Scaffold(
//         appBar: AppBar(
//           leading: const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null,
//           ),
//           title: const Text('Start up'),
//           actions: const [
//             IconButton(
//               icon: Icon(Icons.search),
//               tooltip: 'Search',
//               onPressed: null,
//             ),
//           ],
//         ),
//         body: DashboardScreen(),
//         floatingActionButton: const FloatingActionButton(
//           tooltip: 'Add',
//           onPressed: null,
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

