import 'dart:developer';

import 'package:flutter_startup/app/screen/crypto/crypto_screen.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class UUIDScreen extends CryptoScreen {
  final uuid = const Uuid();
  UUIDScreen({super.key}) : super(title: "UUID");

  @override
  String encode(String? input) {
    var number = 1;
    if (input?.isNotEmpty ?? false) {
      try {
        number = int.parse(input!);
      } catch (e) {
        log('ignore format exception:$input');
      }
    }
    var result = '';
    for (var i = 0; i < number; i++) {
      result += '${uuid.v4()}\n';
    }
    return result;
  }

  @override
  String decode(String? input) => '';

  @override
  bool decryptable() => false;

  @override
  bool auto() => false;

  @override
  String? encodeButtonText() => '生成UUID';

  @override
  String? encodeLabel() =>
      'Enter the number of uuid you want to generate!(default one)';
}
