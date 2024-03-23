import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'fardhu_dialog_model.dart';

const double _graphicSize = 60;

class FardhuDialog extends StackedView<FardhuDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const FardhuDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FardhuDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<YaumiBloc, YaumiState>(
          builder: (context, state) {
            final yaumi = state.allYaumis
                .where((element) =>
                    element.date ==
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day))
                .first;
            final todayFardhuScore = [
              yaumi.shubuh,
              yaumi.dhuhur,
              yaumi.ashar,
              yaumi.maghrib,
              yaumi.isya,
            ].fold(0,
                (previousValue, element) => previousValue + (element ? 20 : 0));
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Shalat Fardhu",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                verticalSpaceSmall,
                StaggeredGrid.count(
                  crossAxisCount: 6,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 1.5,
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "Poin shalat fardhu hari ini:",
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins")),
                                TextSpan(
                                    text: "\n$todayFardhuScore",
                                    style: ktsBodyLarge.copyWith(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w800,
                                        color: todayFardhuScore < 50
                                            ? Colors.red
                                            : todayFardhuScore < 70
                                                ? Colors.amber
                                                : Colors.green))
                              ]),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                    //Shubuh
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.8,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.shubuh,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(shubuh: val)));
                                }),
                            Text(
                              "Shubuh",
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                    //Dhuhur
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.8,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.dhuhur,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(dhuhur: val)));
                                }),
                            Text(
                              "Dhuhur",
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.8,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.ashar,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(ashar: val)));
                                }),
                            Text(
                              "Ashar",
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 3,
                        mainAxisCellCount: 1.8,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.maghrib,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(maghrib: val)));
                                }),
                            Text(
                              "Maghrib",
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 3,
                        mainAxisCellCount: 1.8,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.isya,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(isya: val)));
                                }),
                            Text(
                              "Isya",
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                  ],
                ),
                verticalSpaceMedium,
                GestureDetector(
                  onTap: () => completer(DialogResponse(confirmed: true)),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  FardhuDialogModel viewModelBuilder(BuildContext context) =>
      FardhuDialogModel();
}
