import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          TextSpan(text: "Yaumi App\n", style: ktsTitleText),
          TextSpan(text: "App Version 1.0.0", style: ktsBodyRegular)
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
