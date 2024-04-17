import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/common/app_colors.dart';
import 'package:yaumi/ui/views/home/widgets/dashboard_menu/dashboard_menu.dart';
import 'package:yaumi/ui/views/home/widgets/user_bar.dart';
import 'package:yaumi/ui/views/home/widgets/waktu_sholat.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  final GoogleSignInAccount? currentUser;
  const HomeView({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcVeryLightGrey,
      body: SafeArea(
        child: ListView(
          children: [
            WaktuSholat(),
            UserBar(
              viewModel: viewModel,
              currentUser: currentUser!,
            ),
            DashboardMenu(
              viewModel: viewModel,
              userAccount: currentUser!,
            )
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
