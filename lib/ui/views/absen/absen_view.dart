import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/absen/widgets/absen_date_picker.dart';
import 'package:yaumi/ui/views/absen/widgets/main_widget.dart';

import 'absen_viewmodel.dart';

class AbsenView extends StackedView<AbsenViewModel> {
  const AbsenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Absen ",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 30.0,
                      color: Colors.blueGrey[600],
                      fontStyle: FontStyle.italic,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: "Kerja",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 30.0,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800),
                )
              ])),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.green,
                    )),
              ),
            ],
          ),
        ),
        StaggeredGrid.count(
          crossAxisCount: 6,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 6,
                mainAxisCellCount: 1.5,
                child: AbsenDatePicker()),
            StaggeredGridTile.count(
                crossAxisCellCount: 6,
                mainAxisCellCount: 4.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: MainWidget(
                      viewModel: viewModel,
                    ),
                  ),
                )),
          ],
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/300"),
            ),
            title: Text("Masuk Jam 08.00"),
            subtitle: Text("Lokasi absen kerja: Lokasi, Kota"),
            trailing: IconButton(
              onPressed: null,
              icon: Icon(Icons.info),
            ),
          ),
        )
      ],
    ));
  }

  @override
  AbsenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenViewModel();
}
