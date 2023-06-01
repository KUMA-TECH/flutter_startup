// ignore_for_file: file_names

import 'dart:convert';

class DrawerEntity {
  final Header header;
  final List<Menu> menus;

  DrawerEntity(this.header, this.menus);

  factory DrawerEntity.fromJson(Map<String, dynamic> json) {
    var header = Header.fromJson(json['header']);
    List<dynamic> array = json['menu'];

    List<Menu> menu = array.map((e) => Menu.fromJson(e)).toList();
    return DrawerEntity(header, menu);
  }
}

class Menu {
  final String title;
  final String? icon;
  final String? route;

  final List<Menu>? children;

  Menu(this.title, this.icon, this.route, this.children);

  Menu.fromChild(Map<String, dynamic> json)
      : icon = json['icon'],
        title = json['title'],
        route = json['route'],
        children = null;

  factory Menu.fromJson(Map<String, dynamic> json) {
    var title = json['title'];
    var route = json['route'];
    var icon = json['icon'];

    List<dynamic> cJson = json['children'];
    var source = cJson.map((e) => Menu.fromChild(e)).toList();
    return Menu(title, icon, route, source);
  }

  Map<String, dynamic> toJson() =>
      {'title': title, 'icon': icon, 'route': route, 'children': children};
}

class Header {
  final String title;
  final String icon;

  Header(this.title, this.icon);

  Header.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        icon = json['icon'];
}
