import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/views/absen_sakit/widgets/absen_sakit_form.dart';

import 'absen_sakit_viewmodel.dart';

class AbsenSakitView extends StackedView<AbsenSakitViewModel> {
  final GoogleSignInAccount userAccount;
  const AbsenSakitView({Key? key, required this.userAccount}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenSakitViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AbsenSakitForm(
        viewModel: viewModel,
        userAccount: userAccount,
      ),
    ));
  }

  @override
  AbsenSakitViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenSakitViewModel();
}
