import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/views/absen_masuk/widgets/camera_masuk.dart';

import 'absen_masuk_viewmodel.dart';

class AbsenMasukView extends StackedView<AbsenMasukViewModel> {
  final GoogleSignInAccount userAccount;
  final DateTime selectedDate;
  const AbsenMasukView(
      {Key? key, required this.selectedDate, required this.userAccount})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenMasukViewModel viewModel,
    Widget? child,
  ) {
    return CameraMasuk(
      selectedDate: selectedDate,
      userAccount: userAccount,
      viewModel: viewModel,
    );
  }

  @override
  AbsenMasukViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenMasukViewModel();
}
