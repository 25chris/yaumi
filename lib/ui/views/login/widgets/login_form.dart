import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/login_api.dart';
import 'package:yaumi/ui/views/login/login_viewmodel.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginForm({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () async {
          await LoginApi.login();
          viewModel.login();
        },
        icon: Image.asset(
          "assets/images/search.png",
          scale: 20,
        ),
        label: Text(
          "Google Sign In",
          style: ktsBodyRegular.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins"),
        ));
  }
}
