import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'dzikir_dialog_model.dart';

const double _graphicSize = 60;

class DzikirDialog extends StackedView<DzikirDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DzikirDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DzikirDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: BlocBuilder<YaumiBloc, YaumiState>(
        builder: (context, state) {
          final yaumi =
              state.allYaumis.firstWhere((e) => e.date == request.data);
          final todayDzikirScore = [
            yaumi.dzikirPagi,
            yaumi.dzikirPetang,
          ].fold(0,
              (previousValue, element) => previousValue + (element ? 50 : 0));
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Dzikir Pagi & Petang",
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
                                    text: "Poin dzikir hari ini:",
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins")),
                                TextSpan(
                                    text: "\n$todayDzikirScore",
                                    style: ktsBodyLarge.copyWith(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w800,
                                        color: todayDzikirScore < 49
                                            ? Colors.red
                                            : Colors.green))
                              ]),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 3,
                        mainAxisCellCount: 1.8,
                        child: Column(
                          children: [
                            Checkbox(
                                value: yaumi.dzikirPagi,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi: yaumi.copyWith(dzikirPagi: val)));
                                }),
                            Text(
                              "Dzikir Pagi",
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
                                value: yaumi.dzikirPetang,
                                onChanged: (val) {
                                  context.read<YaumiBloc>().add(UpdateYaumi(
                                      yaumi:
                                          yaumi.copyWith(dzikirPetang: val)));
                                }),
                            Text(
                              "Dzikir Petang",
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
  DzikirDialogModel viewModelBuilder(BuildContext context) =>
      DzikirDialogModel();
}
