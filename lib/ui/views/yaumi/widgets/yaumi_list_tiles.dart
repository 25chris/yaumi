import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_state.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/yaumi/yaumi_viewmodel.dart';

class YaumiListTiles extends StatefulWidget {
  final YaumiViewModel viewModel;
  const YaumiListTiles({super.key, required this.viewModel});

  @override
  State<YaumiListTiles> createState() => _YaumiListTilesState();
}

class _YaumiListTilesState extends State<YaumiListTiles> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FardhuListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const FardhuListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.fardhu
            ? Column(
                children: [
                  BlocBuilder<YaumiBloc, YaumiState>(
                    builder: (context, state) {
                      final yaumi = state.allYaumis
                          .where((element) =>
                              element.date ==
                              DateTime(DateTime.now().year,
                                  DateTime.now().month, DateTime.now().day))
                          .first;
                      final todayFardhuScore = [
                        yaumi.shubuh,
                        yaumi.dhuhur,
                        yaumi.ashar,
                        yaumi.maghrib,
                        yaumi.isya,
                      ].fold(
                          0,
                          (previousValue, element) =>
                              previousValue + (element ? 20 : 0));
                      return ListTile(
                        onTap: () => viewModel.showFardhuDialog(),
                        leading: Container(
                          alignment: Alignment.center,
                          width: 50,
                          child: Text(
                            todayFardhuScore == 0
                                ? "-"
                                : todayFardhuScore
                                    .toStringAsFixed(2)
                                    .toString(),
                            style: ktsBodyRegular.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: todayFardhuScore < 50
                                    ? Colors.red
                                    : todayFardhuScore < 70
                                        ? Colors.amber
                                        : Colors.green),
                          ),
                        ),
                        title: Text("Shalat Fardhu"),
                        subtitle: Text("Tepat waktu, berjama'ah & di masjid"),
                        trailing: Icon(Icons.chevron_right),
                      );
                    },
                  ),
                ],
              )
            : Container();
      },
    );
  }
}

class TahajudListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const TahajudListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.tahajud
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .where((element) =>
                          element.date ==
                          DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day))
                      .first;
                  double calculateTahajudPoin(int tahajud) {
                    // Calculate the percentage and limit the decimal places to 2
                    return double.parse(
                        ((tahajud / 11) * 100).toStringAsFixed(2));
                  }

                  return ListTile(
                    onTap: () {
                      viewModel.showTahajudDialog();
                    },
                    leading: Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: Text(
                        yaumi.tahajud == 0
                            ? "-"
                            : "${calculateTahajudPoin(yaumi.tahajud)}",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: yaumi.tahajud < 4
                                ? Colors.red
                                : yaumi.tahajud < 7
                                    ? Colors.amber
                                    : Colors.green),
                      ),
                    ),
                    title: Text("Shalat Tahajud"),
                    subtitle: Text("Sepertiga malam terakhir"),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class DhuhaListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const DhuhaListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.dhuha
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .where((element) =>
                          element.date ==
                          DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day))
                      .first;
                  double calculateDhuhaPoin(int dhuha) {
                    // Calculate the percentage and limit the decimal places to 2
                    return double.parse(
                        ((dhuha / 12) * 100).toStringAsFixed(2));
                  }

                  return ListTile(
                    onTap: () {
                      viewModel.showDhuhaDialog();
                    },
                    leading: Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: Text(
                        yaumi.dhuha == 0
                            ? "-"
                            : "${calculateDhuhaPoin(yaumi.dhuha).toStringAsFixed(2)}",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: yaumi.dhuha < 4
                                ? Colors.red
                                : yaumi.dhuha < 7
                                    ? Colors.amber
                                    : Colors.green),
                      ),
                    ),
                    title: Text("Shalat Dhuha"),
                    subtitle: Text("Shalat sunnah waktu Dhuha"),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class RawatibListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const RawatibListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.rawatib
            ? BlocBuilder<YaumiBloc, YaumiState>(
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
                  ].fold(
                      0,
                      (previousValue, element) =>
                          previousValue + (element ? 20 : 0));

                  return ListTile(
                    onTap: () {
                      viewModel.showRawatibDialog();
                    },
                    leading: Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: Text(
                        todayRawatibScore == 0
                            ? "-"
                            : todayRawatibScore.toStringAsFixed(2).toString(),
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: todayRawatibScore < 30
                                ? Colors.red
                                : todayRawatibScore < 70
                                    ? Colors.amber
                                    : Colors.green),
                      ),
                    ),
                    title: Text("Shalat Rawatib"),
                    subtitle: Text("Shalat sunnah rawatib"),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}
