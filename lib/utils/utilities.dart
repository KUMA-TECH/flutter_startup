import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> resizePCWindow({double width = 600, double height = 400}) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(width, height),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

bool isDesktop() {
  try {
    return Platform.isLinux ||
        Platform.isMacOS ||
        Platform.isWindows ||
        Platform.isFuchsia;
  } catch (e) {
    log('Platform API is unsupported on Web application!!');
    return false;
  }
}

bool isMobile() {
  try {
    return Platform.isAndroid || Platform.isIOS;
  } catch (e) {
    log('Platform API is unsupported on Web application!!');
    return false;
  }
}

bool isWeb() {
  return !isMobile() && !isDesktop();
}
