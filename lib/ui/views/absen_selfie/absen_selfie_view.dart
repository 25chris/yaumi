import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/views/absen_selfie/widgets/absen_selfie_main.dart';

import 'absen_selfie_viewmodel.dart';

class AbsenSelfieView extends StackedView<AbsenSelfieViewModel> {
  const AbsenSelfieView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenSelfieViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: AbsenSelfieMain(),
    );
  }

  @override
  AbsenSelfieViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenSelfieViewModel();
}
