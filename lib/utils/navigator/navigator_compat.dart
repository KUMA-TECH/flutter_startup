import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_startup/utils/utilities.dart';

/// Navigator 适配器 
class NavigatorCompat extends ChangeNotifier {
  
  static final List<String> _stack = List.empty(growable: true);
  String _topScreen = "/";
  String get topScreen => _topScreen;

  static const int flagNewTask = 1;
  static const int flagClearTasks = 2;

  void pushNamed(BuildContext context, String routeName,{flag = flagNewTask}) {
    if (routeName.isEmpty) {
      log('Empty router, cannot navigate!!');
      return;
    }
    
    if (isMobile()) {
      // use flutter navigator framework
      Navigator.pushNamed(context, routeName);
    } else {
      // web or desktop, using custom navigator
      if(!_stack.contains(routeName)) {
        _stack.add(routeName);
      }
      _updateTopScreen(routeName);
      log('screen stack:${_stack.length}');
    }
    _printStacks();
  }

  void pop() {
    if(_stack.isEmpty) return;
    String top = _stack.first;
    bool rt = _stack.remove(top);
    _updateTopScreen(top);
    _printStacks();
    if(rt) {
      log('pop stack success');
    } else {
      log('pop statck:$top failed');
    }
  }

  void _updateTopScreen(routeName) {
    _topScreen = routeName;
    notifyListeners();
  }

  _printStacks() {
    log(_stack.toString());
  }
}
