import 'package:flutter/material.dart';
import 'package:flutter_startup/app/screen/crypto/crypto_screen.dart';
import 'package:flutter_startup/res/dimensions.dart';

class RSAScreen extends CryptoScreen {
  String secretKey = "";
  String publicKey = "";
  int type = 0; // 0: aes, 1: des

  RSAScreen({super.key}) : super(title: "RSA");

  @override
  String encode(String? input) {
    if (secretKey.isEmpty) return "";
    return type == 0
        ? crypto.rsa(input, secretKey, '', true)
        : crypto.rsa(input, secretKey, '', true);
  }

  @override
  String decode(String? input) {
    if (secretKey.isEmpty) return "";
    return crypto.aes(input, secretKey, false);
  }

  @override
  State<StatefulWidget> createState() => RSAState();
}

class RSAState extends CryptoState<RSAScreen> {
  int _index = 0;
  String? _errorKey;

  @override
  Widget? buildHeaderExtension() {
    return Row(
      children: [
        ChoiceChip(
          onSelected: (value) {
            setState(() {
              _index = 0;
              widget.type = _index;
            });
          },
          label: const Text("RSA"),
          selected: _index == 0,
        ),
        const SizedBox(width: defaultPaddingValue),
        ChoiceChip(
          onSelected: (value) {
            setState(() {
              _index = 1;
              widget.type = _index;
            });
          },
          label: const Text("RSA2"),
          selected: _index == 1,
        ),
        const SizedBox(width: defaultPaddingValue),
      ],
    );
  }

  @override
  Widget? buildExtension() {
    return Column(
      children: [
        TextField(
          onChanged: ((value) {
            widget.secretKey = value;
            if (value.isEmpty ||
                value.length == 16 ||
                value.length == 24 ||
                value.length == 32) {
              setState(() => _errorKey = null);
            } else {
              setState(() => _errorKey = "Key length should be 16/24/32");
            }
          }),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: '公钥',
            alignLabelWithHint: true,
            errorText: _errorKey,
          ),
        ),
        TextField(
          onChanged: ((value) {
            widget.publicKey = value;
            if (value.isEmpty ||
                value.length == 16 ||
                value.length == 24 ||
                value.length == 32) {
              setState(() => _errorKey = null);
            } else {
              setState(() => _errorKey = "Key length should be 16/24/32");
            }
          }),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: '私钥',
            alignLabelWithHint: true,
            errorText: _errorKey,
          ),
        ),
      ],
    );
  }
}
