import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/views/absen_pulang/widgets/camera_pulang.dart';

import 'absen_pulang_viewmodel.dart';

class AbsenPulangView extends StackedView<AbsenPulangViewModel> {
  final DateTime selectedDate;
  final GoogleSignInAccount userAccount;
  final Datum datum;
  const AbsenPulangView(
      {Key? key,
      required this.selectedDate,
      required this.userAccount,
      required this.datum})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenPulangViewModel viewModel,
    Widget? child,
  ) {
    return CameraPulang(
      selectedDate: selectedDate,
      userAccount: userAccount,
      datum: datum,
    );
  }

  @override
  AbsenPulangViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenPulangViewModel();
}
