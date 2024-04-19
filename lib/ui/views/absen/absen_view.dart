import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/blocs/bloc/absen_bloc.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/absen/widgets/absen_date_picker.dart';
import 'package:yaumi/ui/views/absen/widgets/absen_widget.dart';
import 'package:yaumi/ui/views/absen/widgets/main_widget.dart';
import 'package:yaumi/ui/views/absen/widgets/wfo_masuk_card.dart';
import 'package:yaumi/ui/views/absen/widgets/wfo_pulang_card.dart';

import 'absen_viewmodel.dart';

class AbsenView extends StackedView<AbsenViewModel> {
  final GoogleSignInAccount userAccount;
  const AbsenView({Key? key, required this.userAccount}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: BlocBuilder<AbsenBloc, AbsenState>(
          builder: (context, state) {
            final absen = state.allAbsen;
            if (absen
                .where((element) => element.date == viewModel.selectedDateTime)
                .isEmpty) {
              context.read<AbsenBloc>().add(AddAbsen(
                  absen: Absen(
                      date: viewModel.selectedDateTime,
                      statusKehadiran: StatusKehadiran.alpha,
                      lokasi: '',
                      jamMasuk: '',
                      jamPulang: '',
                      selfieMasuk: '',
                      selfiePulang: '',
                      alasanIjin: '',
                      dokumenIjin: '',
                      namaPenyakit: '',
                      dokumenSakit: '',
                      alasanWfh: '',
                      dokumenWfh: '')));
              return Container();
            } else {
              final selectedAbsen = absen.firstWhere(
                  (element) => element.date == viewModel.selectedDateTime);
              return SafeArea(
                child: Column(
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
                                  Icons.list_alt,
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
                            child: AbsenDatePicker(
                              viewModel: viewModel,
                            )),
                      ],
                    ),
                    Expanded(
                        child: AbsenWidget(
                      viewModel: viewModel,
                      absen: selectedAbsen,
                      userAccount: userAccount,
                    ))
                  ],
                ),
              );
            }
          },
        ));
  }

  @override
  AbsenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenViewModel();
}
