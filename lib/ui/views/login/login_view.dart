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
    return viewModel.isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 6,
              ),
            ),
          )
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoginTitle(),
                LoginForm(
                  viewModel: viewModel,
                ),
                const LoginInfo()
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
