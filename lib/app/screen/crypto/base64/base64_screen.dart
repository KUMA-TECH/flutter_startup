import 'dart:developer';

import 'package:flutter/material.dart';
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
  State<StatefulWidget> createState() => Base64State();
}

class Base64State extends CryptoState<Base64Screen> {
  bool _onUrlChecked = false;

  @override
  Widget? buildHeaderExtension() {
    return Row(
      children: [
        ChoiceChip(
          onSelected: (value) {
            setState(() => _onUrlChecked = value);
          },
          label: const Text("URL编码"),
          selected: _onUrlChecked,
        ),
      ],
    );
  }

  @override
  Widget? buildExtension() {
    //return Checkbox(value: false, onChanged: (checked) => {});
    return null;
  }
}
