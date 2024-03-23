import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/ui/common/app_colors.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'rawatib_dialog_model.dart';

const double _graphicSize = 60;

class RawatibDialog extends StackedView<RawatibDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const RawatibDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RawatibDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: BlocBuilder<YaumiBloc, YaumiState>(
        builder: (context, state) {
          final yaumi = state.allYaumis
              .where((element) =>
                  element.date ==
                  DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day))
              .first;
          final todayRawatibScore = [
            yaumi.qshubuh,
            yaumi.qdhuhur,
            yaumi.bdhuhur,
            yaumi.bmaghrib,
            yaumi.bisya,
          ].fold(0,
              (previousValue, element) => previousValue + (element ? 20 : 0));

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Shalat Rawatib",
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
                                    text: "Poin shalat rawatib hari ini:",
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins")),
                                TextSpan(
                                    text: todayRawatibScore == 0
                                        ? "-"
                                        : "\n$todayRawatibScore",
                                    style: ktsBodyLarge.copyWith(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w800,
                                        color: todayRawatibScore < 30
                                            ? Colors.red
                                            : todayRawatibScore < 70
                                                ? Colors.amber
                                                : Colors.green))
                              ]),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )), //Shubuh
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.1,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.qshubuh,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(qshubuh: val)));
                                }),
                            Text(
                              "Qobla\nShubuh",
                              textAlign: TextAlign.center,
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
                        mainAxisCellCount: 2.1,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.qdhuhur,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(qdhuhur: val)));
                                }),
                            Text(
                              "Qobla\nDhuhur",
                              textAlign: TextAlign.center,
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.1,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.bdhuhur,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(bdhuhur: val)));
                                }),
                            Text(
                              "Ba'da\nDhuhur",
                              textAlign: TextAlign.center,
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 3,
                        mainAxisCellCount: 2.1,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.bmaghrib,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(bmaghrib: val)));
                                }),
                            Text(
                              "Ba'da\nMaghrib",
                              textAlign: TextAlign.center,
                              style: ktsBodyRegular.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 3,
                        mainAxisCellCount: 2.1,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.bisya,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(bisya: val)));
                                }),
                            Text(
                              "Ba'da\nIsya",
                              textAlign: TextAlign.center,
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
            ),
          );
        },
      ),
    );
  }

  @override
  RawatibDialogModel viewModelBuilder(BuildContext context) =>
      RawatibDialogModel();
}
