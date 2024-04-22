import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/views/absen_detail/widgets/detail_masuk.dart';
import 'package:yaumi/ui/views/absen_detail/widgets/detail_pulang.dart';
import 'absen_detail_viewmodel.dart';

class AbsenDetailView extends StackedView<AbsenDetailViewModel> {
  final Datum datum;
  final bool isDetailMasuk;
  final GoogleSignInAccount userAccount;
  const AbsenDetailView(
      {Key? key,
      required this.datum,
      required this.isDetailMasuk,
      required this.userAccount})
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
            userAccount: userAccount,
            viewModel: viewModel,
          )
        : DetailPulang(
            datum: datum,
            viewModel: viewModel,
          );
  }

  @override
  AbsenDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenDetailViewModel();
}
