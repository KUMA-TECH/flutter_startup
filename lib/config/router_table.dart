import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/crypto/index.dart';
import 'package:flutter_startup/app/screen/crypto/uuid/uuid_screen.dart';
import 'package:flutter_startup/app/screen/json/format/json_format.dart';
import 'package:flutter_startup/app/screen/main/main_screen.dart';
import 'package:flutter_startup/app/screen/main/overview_screen.dart';
import 'package:flutter_startup/app/screen/setting/setting.dart';

/// 路由注册表
Map<String, WidgetBuilder> routerTable = {
  '/': (context) => const MainScreen(), // home 入口
  '/overview': (context) => const OverviewScreen(),
  '/json': (context) => const JsonFormatScreen(),
  '/setting': (context) => const SettingScreen(),

  // 加解密
  '/desAes': (context) => SymmetryScreen(),
  '/rsa': (context) => RSAScreen(),
  '/sha': (context) => SHAScreen(),
  '/base64': (context) =>
      CryptoScreen(title: "Base64加密/解密", type: cryptoBase64),
  '/md5': (context) => CryptoScreen(title: "MD5加密", type: cryptoMD5),
  '/utf8': (context) => CryptoScreen(title: "UTF8加密/解密", type: cryptoUTF8),
  '/url': (context) => CryptoScreen(title: "URL加密/解密", type: cryptoURL),
  '/uuid': (context) => UUIDScreen(),
  // '/uriHex': (context) => URLScreen(),
  // '/unicode': (context) => URLScreen(),
};
