import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_startup/app/widgets/container/dashboard_header.dart';
import 'package:flutter_startup/app/widgets/toast.dart';
import 'package:flutter_startup/res/dimensions.dart';
import 'package:flutter_startup/utils/crypto.dart';

const int cryptoURL = 0;
const int cryptoUTF8 = 1;
const int cryptoBase64 = 2;
const int cryptoMD5 = 3;

/// 加密解密 base 样式
class CryptoScreen extends StatefulWidget {
  final int type;
  final String title;
  final Crypto crypto;

  final int maxLines;
  final int minLines;

  CryptoScreen(
      {super.key,
      required this.title,
      this.type = cryptoURL,
      this.minLines = 5,
      this.maxLines = 30})
      : crypto = Crypto();

  @override
  State<StatefulWidget> createState() => CryptoState();

  /// for override
  String encode(String? input) {
    String result = '';
    if (input?.isEmpty ?? true) return result;
    input = input!.trim();
    switch (type) {
      case cryptoUTF8:
        var list = utf8.encode(input);
        for (var element in list) {
          result += '\\x${element.toRadixString(16)}';
        }
        log('encode:$result');
        break;
      case cryptoBase64:
        result = crypto.base64Encrypt(input);
        break;
      case cryptoMD5:
        result = crypto.md5Encrypt(input);
        break;
      default:
        result = crypto.urlEncrypt(input);
        break;
    }
    return result;
  }

  /// for override
  String decode(String? input) {
    String result = '';
    if (input?.isEmpty ?? true) return result;
    input = input!.trim();
    switch (type) {
      case cryptoUTF8:
        var bytes =
            input.split("\\x").skip(1).map((e) => int.parse(e, radix: 16));
        result = String.fromCharCodes(bytes);
        break;
      case cryptoBase64:
        result = crypto.base64Decrypt(input);
        break;
      default:
        result = crypto.urlDecrypt(input);
        break;
    }
    return result;
  }

  /// 是否可解密
  bool decryptable() => (type == cryptoMD5) ? false : true;

  /// 自动加解密
  bool auto() => true;
}

class CryptoState<T extends CryptoScreen> extends State<T> {
  String? _input;
  String? _output;

  void _encode(String? input) {
    String result = widget.encode(input);
    setState(() => _output = result);
  }

  void _decode(String? input) {
    String result = widget.decode(input);
    setState(() => _output = result);
  }

  Widget? buildExtension() {
    return null;
  }

  Widget? buildHeaderExtension() {
    return null;
  }

  _buildCrpytoForm() {
    var decryptable = widget.decryptable();
    bool auto = widget.auto();
    return Row(children: [
      Expanded(
        flex: 1,
        child: TextField(
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          textAlignVertical: TextAlignVertical.top,
          onChanged: ((value) {
            setState(() => _input = value);
            if (!widget.auto()) return;
            _encode(value);
          }),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Text',
            alignLabelWithHint: true,
          ),
        ),
      ),
      Padding(
        padding: defaultPadding,
        child: Column(children: [
          ElevatedButton(
              onPressed: () => {_encode(_input)}, child: const Text("加密")),
          const SizedBox(height: defaultPaddingValue),
          decryptable
              ? ElevatedButton(
                  onPressed: () => {_decode(_input)}, child: const Text("解密"))
              : const SizedBox(),
        ]),
      ),
      Expanded(
        flex: 1,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            TextField(
              controller: TextEditingController(text: _output),
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              enabled: false,
              onChanged: (value) {},
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Result',
                alignLabelWithHint: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: defaultPaddingValue / 2,
                bottom: defaultPaddingValue / 2,
              ),
              child: IconButton(
                onPressed: () {
                  if (_output?.isEmpty ?? true) return;
                  Clipboard.setData(ClipboardData(text: _output));
                  toast(context, "Result copied");
                },
                icon: const Icon(Icons.copy),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardHeader(title: widget.title),
        const SizedBox(height: 3 * defaultPaddingValue),
        buildHeaderExtension() ?? const SizedBox(),
        const SizedBox(height: defaultPaddingValue),
        _buildCrpytoForm(),
        const SizedBox(height: defaultPaddingValue),
        buildExtension() ?? const SizedBox(),
      ],
    );
  }
}
