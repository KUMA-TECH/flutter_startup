import 'package:flutter/material.dart';
import 'package:flutter_startup/res/dimensions.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            // navigator
            Padding(
              padding: defaultPadding,
              child: Row(
                children: [
                  Text("Dashboard > projects"),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).dividerTheme.color,
            ),
            Row(
              children: [
                Card(
                  color: Colors.white,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Row(children: const [
                      Text("project1"),
                    ]),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Row(children: const [
                      Text("project2"),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
