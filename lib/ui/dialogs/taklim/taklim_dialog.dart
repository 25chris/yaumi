import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/models/yaumi.dart';
import 'package:yaumi/ui/common/app_colors.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'taklim_dialog_model.dart';

const double _graphicSize = 60;

class TaklimDialog extends StackedView<TaklimDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const TaklimDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TaklimDialogModel viewModel,
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Taklim",
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
                                    text: "Taklim hari ini:",
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins")),
                                TextSpan(
                                    text: yaumi.taklim != Taklim.tidakTaklim
                                        ? "\n100.00"
                                        : "\n-",
                                    style: ktsBodyLarge.copyWith(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w800,
                                        color:
                                            yaumi.taklim != Taklim.tidakTaklim
                                                ? Colors.green
                                                : Colors.red))
                              ]),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 2,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Taklim>(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              value: yaumi.taklim,
                              hint: Text('Select Taklim'),
                              onChanged: (Taklim? val) {
                                context.read<YaumiBloc>().add(UpdateYaumi(
                                    yaumi: yaumi.copyWith(taklim: val)));
                              },
                              items: Taklim.values.map((Taklim classType) {
                                return DropdownMenuItem<Taklim>(
                                  value: classType,
                                  child: Text(classType
                                      .toString()
                                      .split('.')
                                      .last
                                      .replaceAll('taklim', ' Taklim ')
                                      .trim()), // Beautify the enum name
                                );
                              }).toList(),
                            ),
                          ),
                        ))
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
  TaklimDialogModel viewModelBuilder(BuildContext context) =>
      TaklimDialogModel();
}