import 'package:flutter/material.dart';
import 'package:flutter_startup/app/widgets/container/dashboard_header.dart';
import 'package:flutter_startup/res/dimensions.dart';

class JsonFormatScreen extends StatelessWidget {
  const JsonFormatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardHeader(title: 'Json格式化'),
        const SizedBox(height: defaultPaddingValue),
        Row(children: const [
          Expanded(
            flex: 1,
            child: TextField(
              maxLines: 30,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Json text',
                alignLabelWithHint: true,
              ),
            ),
          ),
          Icon(Icons.arrow_right, size: 48),
          Expanded(
            flex: 1,
            child: TextField(
              maxLines: 30,
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Format Result',
                alignLabelWithHint: true,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
