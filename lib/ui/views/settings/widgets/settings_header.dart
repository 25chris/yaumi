import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Settings", style: ktsTitleText.copyWith(color: Colors.white));
  }
}
