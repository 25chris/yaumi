import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/common/login_api.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';

import 'strapi_login_viewmodel.dart';

class StrapiLoginView extends StackedView<StrapiLoginViewModel> {
  final GoogleSignInAccount? currentUser;
  const StrapiLoginView({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StrapiLoginViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 6,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Strapi"),
                  verticalSpaceSmall,
                  ElevatedButton(
                      onPressed: () => viewModel.toLogin(),
                      child: Text("Logout"))
                ],
              ),
            ),
          );
  }

  @override
  StrapiLoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrapiLoginViewModel();
}
