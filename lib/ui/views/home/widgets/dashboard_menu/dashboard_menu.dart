import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/home/home_viewmodel.dart';
import 'package:yaumi/ui/views/home/widgets/dashboard_menu/menu_content.dart';

class DashboardMenu extends StatelessWidget {
  final HomeViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const DashboardMenu(
      {super.key, required this.viewModel, required this.userAccount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            horizontalSpaceMedium,
            Text(
              "Menu Utama",
              style: ktsBodyLarge.copyWith(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.blueGrey,
                  fontFamily: "Montserrat"),
            ),
            horizontalSpaceSmall,
            Expanded(
                child: Container(
              height: 1,
              color: Colors.blueGrey,
            )),
            horizontalSpaceMedium,
          ],
        ),
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: .65,
              child: YaumiMenuContent(
                viewModel: viewModel,
                userAccount: userAccount,
              ),
            ),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: .65,
                child: AbsenMenuContent(
                  viewModel: viewModel,
                  userAccount: userAccount,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: .65,
                child: GroupMenuContent(
                  viewModel: viewModel,
                ))
          ],
        ),
      ],
    );
  }
}
