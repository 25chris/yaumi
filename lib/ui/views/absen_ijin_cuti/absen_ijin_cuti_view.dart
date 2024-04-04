import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/views/absen_ijin_cuti/widgets/loa_form.dart';

import 'absen_ijin_cuti_viewmodel.dart';

class AbsenIjinCutiView extends StackedView<AbsenIjinCutiViewModel> {
  const AbsenIjinCutiView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenIjinCutiViewModel viewModel,
    Widget? child,
  ) {
    return LOAForm();
  }

  @override
  AbsenIjinCutiViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenIjinCutiViewModel();
}
