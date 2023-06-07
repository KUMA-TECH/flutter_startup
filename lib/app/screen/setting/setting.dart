import "package:flutter/material.dart";
import "package:flutter/src/widgets/framework.dart";
import "package:flutter_startup/app/screen/setting/components/setting_panel.dart";
import "package:flutter_startup/app/screen/setting/components/settinig_title.dart";
import "package:flutter_startup/app/screen/setting/components/theme_setting.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [SettingPanel(title: "主题设置", child: ThemeSetting())],
      ),
    );
  }
}
