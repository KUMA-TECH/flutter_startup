import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_startup/config/global_config.dart';

class Dashboard extends StatelessWidget {

  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    log(">>>> size:$size");

    return  Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/login/bg_login_form.avif"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      width: GlobalConfig.DEFAULT_SIZE.width,
      height: GlobalConfig.DEFAULT_SIZE.height,
      // constraints:  BoxConstraints(
      //     minWidth: GlobalConfig.DEFAULT_SIZE.width,
      //     minHeight: GlobalConfig.DEFAULT_SIZE.height),
      child: Row(
          children: [
            Text("menu"),
            Text("container"),
            Text("info container"),
          ]
      ),
    );
  }
}
