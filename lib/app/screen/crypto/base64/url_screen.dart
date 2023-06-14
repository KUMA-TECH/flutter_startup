import 'package:flutter_startup/app/screen/crypto/crypto_screen.dart';

class URLScreen extends CryptoScreen {
  URLScreen({super.key}) : super(title: "URL加密/解密");

  @override
  String encode(String? input) {
    return crypto.urlEncrypt(input);
  }

  @override
  String decode(String? input) {
    return crypto.urlDecrypt(input);
  }
}
