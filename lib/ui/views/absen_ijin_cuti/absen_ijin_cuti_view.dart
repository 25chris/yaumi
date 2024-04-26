import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/views/absen_ijin_cuti/widgets/loa_emergency_form.dart';
import 'package:yaumi/ui/views/absen_ijin_cuti/widgets/loa_form.dart';

import 'absen_ijin_cuti_viewmodel.dart';

class AbsenIjinCutiView extends StackedView<AbsenIjinCutiViewModel> {
  final DateTime selectedDateTime;
  final bool isEmergency;
  final GoogleSignInAccount userAccount;
  const AbsenIjinCutiView(
      {Key? key,
      required this.selectedDateTime,
      required this.isEmergency,
      required this.userAccount})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenIjinCutiViewModel viewModel,
    Widget? child,
  ) {
    return isEmergency
        ? LoaEmergencyForm(
            viewModel: viewModel,
            selectedDateTime: selectedDateTime,
            userAccount: userAccount,
          )
        : LOAForm(
            viewModel: viewModel,
            selectedDateTime: selectedDateTime,
            userAccount: userAccount);
  }

  @override
  AbsenIjinCutiViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenIjinCutiViewModel();
}
