import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/home/home_viewmodel.dart';
import 'package:yaumi/ui/views/home/widgets/dashboard_menu/menu_content.dart';

class DashboardMenu extends StatelessWidget {
  final HomeViewModel viewModel;
  const DashboardMenu({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Menu Utama",
          style: ktsBodyLarge.copyWith(
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
              fontFamily: "Montserrat"),
        ),
        Divider(),
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: [
            YaumiMenuContent(
              viewModel: viewModel,
            ),
            AbsenMenuContent(
              viewModel: viewModel,
            )
          ],
        ),
      ],
    );
  }
}
