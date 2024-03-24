import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_state.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/models/yaumi.dart';
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
                      final yaumi = state.allYaumis.firstWhere(
                          (e) => e.date == viewModel.selectedDateTime);
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
                          width: 60,
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
                        title: Text(
                          "Shalat Fardhu",
                          style: ktsBodyLarge.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat",
                              color: Colors.blueGrey[700]),
                        ),
                        subtitle: Text(
                          "Tepat waktu, berjama'ah & di masjid",
                          style: ktsBodyRegular.copyWith(
                              fontFamily: "Poppins",
                              color: Colors.blueGrey[700]),
                        ),
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
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
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
                      width: 60,
                      child: Text(
                        yaumi.tahajud == 0
                            ? "-"
                            : calculateTahajudPoin(yaumi.tahajud)
                                .toStringAsFixed(2),
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
                    title: Text(
                      "Shalat Tahajud",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Sepertiga malam terakhir",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
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
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
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
                      width: 60,
                      child: Text(
                        yaumi.dhuha == 0
                            ? "-"
                            : "${calculateDhuhaPoin(yaumi.dhuha)}",
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
                    title: Text(
                      "Shalat Dhuha",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Shalat sunnah waktu Dhuha",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
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
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
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
                      width: 60,
                      child: Text(
                        todayRawatibScore == 0
                            ? "-"
                            : todayRawatibScore.toStringAsFixed(2),
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
                    title: Text(
                      "Shalat Rawatib",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Shalat sunnah rawatib",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class TilawahListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const TilawahListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.tilawah
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
                  double calculateTilawahPoin(int tilawah) {
                    // Calculate the percentage and limit the decimal places to 2
                    return double.parse(
                        ((tilawah / 20) * 100).toStringAsFixed(2));
                  }

                  return ListTile(
                    onTap: () {
                      viewModel.showTilawahDialog();
                    },
                    leading: Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(
                        calculateTilawahPoin(yaumi.tilawah) == 0
                            ? "-"
                            : calculateTilawahPoin(yaumi.tilawah)
                                .toStringAsFixed(2),
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: calculateTilawahPoin(yaumi.tilawah) < 30
                                ? Colors.red
                                : calculateTilawahPoin(yaumi.tilawah) < 70
                                    ? Colors.amber
                                    : Colors.green),
                      ),
                    ),
                    title: Text(
                      "Tilawah Qur'an",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "1 hari 1 Juz",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class ShaumListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const ShaumListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.shaum
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
                  return ListTile(
                    onTap: () {
                      viewModel.showShaumDialog();
                    },
                    leading: Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(
                        yaumi.shaumSunnah != ShaumSunnah.tidakShaum
                            ? "100.00"
                            : "-",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: yaumi.shaumSunnah != ShaumSunnah.tidakShaum
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                    title: Text(
                      "Shaum Sunnah / Fardhu",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Shaum sesuai sunnah",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class SedekahListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const SedekahListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.sedekah
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
                  return ListTile(
                    onTap: () {},
                    leading: Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(
                        yaumi.sedekah ? "100.00" : "-",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: yaumi.sedekah ? Colors.green : Colors.red),
                      ),
                    ),
                    title: Text(
                      "Sedekah",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Sedekah harta di jalan Allah",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Checkbox(
                        value: yaumi.sedekah,
                        onChanged: (val) {
                          context.read<YaumiBloc>().add(
                              UpdateYaumi(yaumi: yaumi.copyWith(sedekah: val)));
                        }),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class DzikirListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const DzikirListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.dzikir
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
                  final todayDzikirScore = [
                    yaumi.dzikirPagi,
                    yaumi.dzikirPetang,
                  ].fold(
                      0,
                      (previousValue, element) =>
                          previousValue + (element ? 50 : 0));
                  return ListTile(
                    onTap: () {
                      viewModel.showDzikirDialog();
                    },
                    leading: Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(
                        todayDzikirScore < 49
                            ? "-"
                            : todayDzikirScore.toStringAsFixed(2),
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: todayDzikirScore < 49
                                ? Colors.red
                                : Colors.green),
                      ),
                    ),
                    title: Text(
                      "Dzikir Pagi & Petang",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Dzikir sesuai sunnah",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class TaklimListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const TaklimListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.taklim
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
                  return ListTile(
                    onTap: () {
                      viewModel.showTaklimrDialog();
                    },
                    leading: Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(
                        yaumi.taklim != Taklim.tidakTaklim ? "100.00" : "-",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: yaumi.taklim != Taklim.tidakTaklim
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                    title: Text(
                      "Taklim",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Tambah ilmu setiap hari",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class IstighfarListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const IstighfarListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.istighfar
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
                  return ListTile(
                    onTap: () {},
                    leading: Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(
                        yaumi.istighfar ? "100.00" : "-",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: yaumi.istighfar ? Colors.green : Colors.red),
                      ),
                    ),
                    title: Text(
                      "Istighfar",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Dzikir Istighfar 100x per hari",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Checkbox(
                        value: yaumi.istighfar,
                        onChanged: (val) {
                          context.read<YaumiBloc>().add(UpdateYaumi(
                              yaumi: yaumi.copyWith(istighfar: val)));
                        }),
                  );
                },
              )
            : Container();
      },
    );
  }
}

class ShalawatListTile extends StatelessWidget {
  final YaumiViewModel viewModel;
  const ShalawatListTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.shalawat
            ? BlocBuilder<YaumiBloc, YaumiState>(
                builder: (context, state) {
                  final yaumi = state.allYaumis
                      .firstWhere((e) => e.date == viewModel.selectedDateTime);
                  return ListTile(
                    onTap: () {},
                    leading: Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(
                        yaumi.shalawat ? "100.00" : "-",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: yaumi.shalawat ? Colors.green : Colors.red),
                      ),
                    ),
                    title: Text(
                      "Shalawat",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          color: Colors.blueGrey[700]),
                    ),
                    subtitle: Text(
                      "Dzikir Shalawat setiap hari",
                      style: ktsBodyRegular.copyWith(
                          fontFamily: "Poppins", color: Colors.blueGrey[700]),
                    ),
                    trailing: Checkbox(
                        value: yaumi.shalawat,
                        onChanged: (val) {
                          context.read<YaumiBloc>().add(UpdateYaumi(
                              yaumi: yaumi.copyWith(shalawat: val)));
                        }),
                  );
                },
              )
            : Container();
      },
    );
  }
}
