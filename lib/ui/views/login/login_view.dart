import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/views/login/widgets/login_form.dart';
import 'package:yaumi/ui/views/login/widgets/login_info.dart';
import 'package:yaumi/ui/views/login/widgets/login_title.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginTitle(),
          LoginForm(
            viewModel: viewModel,
          ),
          LoginInfo()
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
