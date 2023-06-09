import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_startup/utils/utilities.dart';

class NavigatorCompat extends ChangeNotifier {
  void pushName(BuildContext context, String routeName) {
    if (routeName.isEmpty) {
      log('Empty router, cannot navigate!!');
      return;
    }

    if (isMobile()) {
      // use flutter navigator framework
      Navigator.pushNamed(context, routeName);
    } else {
      // web or desktop, using custom navigator
    }
  }
}
