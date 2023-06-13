import 'package:flutter_startup/app/screen/crypto/crypto_screen.dart';

class Md5Screen extends CryptoScreen {
  Md5Screen({super.key}) : super(title: "MD5加密");

  @override
  String encode(String? input) {
    return crypto.md5Encrypt(input);
  }
}
