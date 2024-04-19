import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/views/absen_detail/widgets/detail_masuk.dart';
import 'package:yaumi/ui/views/absen_detail/widgets/detail_pulang.dart';
import 'absen_detail_viewmodel.dart';

class AbsenDetailView extends StackedView<AbsenDetailViewModel> {
  final Datum datum;
  final bool isDetailMasuk;
  const AbsenDetailView(
      {Key? key, required this.datum, required this.isDetailMasuk})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenDetailViewModel viewModel,
    Widget? child,
  ) {
    return isDetailMasuk
        ? DetailMasuk(
            datum: datum,
            viewModel: viewModel,
          )
        : const DetailPulang();
  }

  @override
  AbsenDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenDetailViewModel();
}
