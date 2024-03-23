import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/ui/common/app_colors.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'tahajud_dialog_model.dart';

const double _graphicSize = 60;

class TahajudDialog extends StackedView<TahajudDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const TahajudDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TahajudDialogModel viewModel,
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
          double calculateTahajudPoin(int tahajud) {
            // Calculate the percentage and limit the decimal places to 2
            return double.parse(((tahajud / 11) * 100).toStringAsFixed(2));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Shalat Tahajud",
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
                                    text: "Poin shalat tahajud hari ini:",
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins")),
                                TextSpan(
                                    text: yaumi.tahajud == 0
                                        ? "\n-"
                                        : "\n${calculateTahajudPoin(yaumi.tahajud)}",
                                    style: ktsBodyLarge.copyWith(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w800,
                                        color: yaumi.tahajud < 4
                                            ? Colors.red
                                            : yaumi.tahajud < 7
                                                ? Colors.amber
                                                : Colors.green))
                              ]),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 1,
                        child: Slider(
                            min: 0,
                            max: 11,
                            label: yaumi.tahajud.toString(),
                            divisions: 10,
                            value: yaumi.tahajud.toDouble(),
                            onChanged: (val) {
                              context.read<YaumiBloc>().add(UpdateYaumi(
                                  yaumi: yaumi.copyWith(tahajud: val.toInt())));
                            }))
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
  TahajudDialogModel viewModelBuilder(BuildContext context) =>
      TahajudDialogModel();
}
