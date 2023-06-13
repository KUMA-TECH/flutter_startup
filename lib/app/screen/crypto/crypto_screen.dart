import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_startup/app/widgets/container/dashboard_header.dart';
import 'package:flutter_startup/res/dimensions.dart';
import 'package:flutter_startup/utils/crypto.dart';

/// 加密解密 base 样式
class CryptoScreen extends StatefulWidget {
  final String title;
  final Crypto crypto;

  CryptoScreen({super.key, required this.title}) : crypto = Crypto();

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

  Widget? buildExtension() {
    return null;
  }
}

class CryptoState extends State<CryptoScreen> {
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

  _buildCrpytoForm() {
    return Row(children: [
      Expanded(
        flex: 1,
        child: TextField(
          maxLines: 5,
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
        child: TextField(
          controller: TextEditingController(text: _output),
          maxLines: 5,
          // enabled: false,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Result',
            alignLabelWithHint: true,
            suffixIcon: IconButton(
                onPressed: () {
                  if (_output?.isEmpty ?? true) return;

                  Clipboard.setData(ClipboardData(text: _output));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Result copied",
                        style: Theme.of(context).textTheme.labelMedium),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ));
                },
                icon: const Icon(Icons.copy)),
          ),
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
        _buildCrpytoForm(),
        const SizedBox(height: 3 * defaultPaddingValue),
        widget.buildExtension() ?? const SizedBox(),
      ],
    );
  }
}
