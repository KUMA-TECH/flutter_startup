import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_startup/app/widgets/container/dashboard_header.dart';
import 'package:flutter_startup/app/widgets/toast.dart';
import 'package:flutter_startup/res/dimensions.dart';
import 'package:flutter_startup/utils/crypto.dart';

/// 加密解密 base 样式
class CryptoScreen extends StatefulWidget {
  final String title;
  final Crypto crypto;

  final int maxLines;
  final int minLines;

  CryptoScreen(
      {super.key, required this.title, this.minLines = 5, this.maxLines = 30})
      : crypto = Crypto();

  @override
  State<StatefulWidget> createState() => CryptoState();

  /// for override
  String encode(String? input) {
    return '';
  }

  /// for override
  String decode(String? input) {
    return '';
  }
}

class CryptoState<T extends CryptoScreen> extends State<T> {
  String? _input;
  String? _output;

  void _encode(String? input) {
    setState(() => _input = input);
    String result = widget.encode(input);
    setState(() => _output = result);
  }

  void _decode(String? input) {
    setState(() => _input = input);
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
    return Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              textAlignVertical: TextAlignVertical.top,
              onChanged: ((value) => _encode(value)),
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
              ElevatedButton(
                  onPressed: () => {_decode(_input)}, child: const Text("解密")),
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
