import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/views/absen_selfie/widgets/absen_selfie_main.dart';

import 'absen_selfie_viewmodel.dart';

class AbsenSelfieView extends StackedView<AbsenSelfieViewModel> {
  final GoogleSignInAccount userAccount;
  final DateTime selectedDatetime;
  const AbsenSelfieView(
      {Key? key, required this.selectedDatetime, required this.userAccount})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenSelfieViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: AbsenSelfieMain(
        selectedDate: selectedDatetime,
        userAccount: userAccount,
      ),
    );
  }

  @override
  AbsenSelfieViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenSelfieViewModel();
}
