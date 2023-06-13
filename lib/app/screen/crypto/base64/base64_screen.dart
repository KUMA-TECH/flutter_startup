import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_startup/app/screen/crypto/crypto_screen.dart';

class Base64Screen extends CryptoScreen {
  Base64Screen({super.key}) : super(title: "Base64加密/解密");

  @override
  String encode(String? input) {
    return crypto.base64Encrypt(input);
  }

  @override
  String decode(String? input) {
    return crypto.base64Decrypt(input);
  }

  @override
  Widget? buildExtension() {
    //return Checkbox(value: false, onChanged: (checked) => {});
    return null;
  }
}
