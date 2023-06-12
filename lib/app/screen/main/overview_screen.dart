import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_startup/app/widgets/container/dashboard_header.dart";
import "package:flutter_startup/res/dimensions.dart";

/// Overview 介绍页
class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          DashboardHeader(title: 'Overview'),
        ],
      ),
    );
  }
}
