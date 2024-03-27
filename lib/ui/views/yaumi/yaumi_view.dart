import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/blocs/bloc/settings_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_state.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/models/yaumi.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/yaumi/widgets/yaumi_date_picker.dart';
import 'package:yaumi/ui/views/yaumi/widgets/yaumi_list_tiles.dart';

import 'yaumi_viewmodel.dart';

class YaumiView extends StackedView<YaumiViewModel> {
  const YaumiView({Key? key}) : super(key: key);

  get context => this.context;

  @override
  Widget builder(
    BuildContext context,
    YaumiViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          var activedYaumi = (state.fardhu ? 1 : 0) +
              (state.tahajud ? 1 : 0) +
              (state.dhuha ? 1 : 0) +
              (state.rawatib ? 1 : 0) +
              (state.tilawah ? 1 : 0) +
              (state.shaum ? 1 : 0) +
              (state.sedekah ? 1 : 0) +
              (state.dzikir ? 1 : 0) +
              (state.taklim ? 1 : 0) +
              (state.istighfar ? 1 : 0) +
              (state.shalawat ? 1 : 0);
          return BlocBuilder<YaumiBloc, YaumiState>(
            builder: (context, state) {
              if (state.allYaumis
                  .where((e) => e.date == viewModel.selectedDateTime)
                  .isEmpty) {
                context.read<YaumiBloc>().add(AddYaumi(
                    yaumi: Yaumi(
                        date: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day),
                        shubuh: false,
                        dhuhur: false,
                        ashar: false,
                        maghrib: false,
                        isya: false,
                        tahajud: 0,
                        dhuha: 0,
                        qshubuh: false,
                        qdhuhur: false,
                        bdhuhur: false,
                        bmaghrib: false,
                        bisya: false,
                        tilawah: 0,
                        poin: 0,
                        shaumSunnah: ShaumSunnah.tidakShaum,
                        sedekah: false,
                        dzikirPagi: false,
                        dzikirPetang: false,
                        taklim: Taklim.tidakTaklim,
                        istighfar: false,
                        shalawat: false)));

                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 6,
                  ),
                );
              } else {
                final yaumi = state.allYaumis
                    .firstWhere((e) => e.date == viewModel.selectedDateTime);
                var todayPoin = viewModel.totalPoin(
                    shubuh: yaumi.shubuh,
                    dhuhur: yaumi.dhuhur,
                    ashar: yaumi.ashar,
                    maghrib: yaumi.maghrib,
                    isya: yaumi.isya,
                    tahajud: yaumi.tahajud,
                    dhuha: yaumi.dhuha,
                    qshubuh: yaumi.qshubuh,
                    qdhuhur: yaumi.qdhuhur,
                    bdhuhur: yaumi.bdhuhur,
                    bmaghrib: yaumi.bmaghrib,
                    bisya: yaumi.bisya,
                    tilawah: yaumi.tilawah,
                    shaumSunnah: yaumi.shaumSunnah,
                    sedekah: yaumi.sedekah,
                    dzikirPagi: yaumi.dzikirPagi,
                    dzikirPetang: yaumi.dzikirPetang,
                    taklim: yaumi.taklim,
                    istighfar: yaumi.istighfar,
                    shalawat: yaumi.shalawat,
                    activedYaumi: activedYaumi);
                var lengthOfYaumis =
                    state.allYaumis.where((element) => element.poin > 0).length;
                var poinSums = state.allYaumis.map((e) => e.poin).toList().fold(
                    0.0, (previousValue, element) => previousValue + element);
                var dailyAveragePoin = poinSums / lengthOfYaumis;
                Map<String, double> percentages = viewModel
                    .calculateAndComparePercentage(state.allYaumis, 1000.0);
                return SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "Muthaba'ah ",
                              style: ktsBodyLarge.copyWith(
                                  fontSize: 30.0,
                                  color: Colors.blueGrey[600],
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w800),
                            ),
                            TextSpan(
                              text: "Yaumiah",
                              style: ktsBodyLarge.copyWith(
                                  fontSize: 30.0,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w800),
                            )
                          ])),
                          FutureBuilder(
                              future: HttpService().getYaumiByDateAndMail(
                                  email: 'zatunur.badar@gmail.com',
                                  date: '2024-03-27'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return IconButton(
                                      onPressed: () {
                                        viewModel.checkUser(
                                            email: 'zatunur.badar@gmail.com');
                                      },
                                      icon: const Icon(
                                        Icons.settings,
                                        color: Colors.green,
                                      ));
                                } else {
                                  return Container();
                                }
                              }),
                        ],
                      ),
                      verticalSpaceSmall,
                      StaggeredGrid.count(
                        crossAxisCount: 6,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        children: [
                          StaggeredGridTile.count(
                              crossAxisCellCount: 3,
                              mainAxisCellCount: 1.5,
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Pencapaian periode sebelumnya:\n",
                                      style: ktsBodyLarge.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.blue)),
                                  TextSpan(
                                      text:
                                          "${percentages.values.last.toStringAsFixed(2)} %",
                                      style: ktsBodyLarge.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey[800]))
                                ])),
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 3,
                              mainAxisCellCount: 1.5,
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Pencapaian periode sekarang:\n",
                                      style: ktsBodyLarge.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.blue)),
                                  TextSpan(
                                      text:
                                          "${percentages.values.first.toStringAsFixed(2)} %",
                                      style: ktsBodyLarge.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey[800]))
                                ])),
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 6,
                              mainAxisCellCount: 1,
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Rata-rata pencapaian harian: ",
                                      style: ktsBodyLarge.copyWith(
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w800,
                                          color: Colors.blueGrey[500])),
                                  TextSpan(
                                      text: dailyAveragePoin.toStringAsFixed(2),
                                      style: ktsBodyLarge.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey[800]))
                                ])),
                              )),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 6,
                            mainAxisCellCount: 1.5,
                            child: YaumiDatePicker(
                              viewModel: viewModel,
                            ),
                          ),
                          // Padding(
                          // padding: const EdgeInsets.all(16.0),
                          // child: Text(
                          // 'Selected date: _selectedDate.toString().split(' ')[0]}'),
                          // ),
                        ],
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FardhuListTile(
                                viewModel: viewModel,
                              ),
                              TahajudListTile(
                                viewModel: viewModel,
                              ),
                              DhuhaListTile(viewModel: viewModel),
                              RawatibListTile(viewModel: viewModel),
                              TilawahListTile(
                                viewModel: viewModel,
                              ),
                              ShaumListTile(viewModel: viewModel),
                              SedekahListTile(viewModel: viewModel),
                              DzikirListTile(viewModel: viewModel),
                              TaklimListTile(
                                viewModel: viewModel,
                              ),
                              IstighfarListTile(viewModel: viewModel),
                              ShalawatListTile(viewModel: viewModel),
                            ],
                          ),
                        ),
                      )),
                      Container(
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () async {
                                context.read<YaumiBloc>().add(UpdateYaumi(
                                    yaumi: yaumi.copyWith(
                                        poin: double.parse(todayPoin))));

                                await viewModel.submitYaumiData(
                                    email: 'zatunur.badar@gmail.com',
                                    date: viewModel.selectedDateTime.toString(),
                                    poin: yaumi.poin,
                                    shubuh: yaumi.shubuh,
                                    dhuhur: yaumi.dhuhur,
                                    ashar: yaumi.ashar,
                                    maghrib: yaumi.maghrib,
                                    isya: yaumi.isya,
                                    tahajud: yaumi.tahajud,
                                    dhuha: yaumi.dhuha,
                                    qshubuh: yaumi.qshubuh,
                                    qdhuhur: yaumi.qdhuhur,
                                    bdhuhur: yaumi.bdhuhur,
                                    bmaghrib: yaumi.bmaghrib,
                                    bisya: yaumi.bisya,
                                    tilawah: yaumi.tilawah,
                                    shaumSunnah: yaumi.shaumSunnah,
                                    sedekah: yaumi.sedekah,
                                    dzikirPagi: yaumi.dzikirPagi,
                                    dzikirPetang: yaumi.dzikirPetang,
                                    taklim: yaumi.taklim,
                                    istighfar: yaumi.istighfar,
                                    shalawat: yaumi.shalawat);
                              },
                              child: Text("SUBMIT $todayPoin Poin")))
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }

  @override
  YaumiViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      YaumiViewModel();

  @override
  void onViewModelReady(YaumiViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
  }
}
