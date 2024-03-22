import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/blocs/bloc/settings_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_event.dart';
import 'package:yaumi/blocs/bloc/settings_state.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/login_api.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/settings/widgets/settings_header.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 6,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const SettingsHeader(),
            ),
            body: ListView(
              children: [
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Profile",
                    style: ktsBodyRegular.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                //nama
                ListTile(
                  onTap: () => viewModel.showDialog(),
                  leading: const CircleAvatar(),
                  title: const Text("Nama Pengguna"),
                  subtitle: const Text("Edit photo profile & nama"),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.chevron_right)),
                ),
                ListTile(
                  leading: const CircleAvatar(),
                  title: const Text("Email Pengguna"),
                  subtitle: const Text("Ganti password"),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.chevron_right)),
                ),
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Yaumi",
                    style: ktsBodyRegular.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Sholat Fardhu Berjama'ah"),
                      subtitle:
                          const Text("Tepat waktu & berjama'ah di masjid"),
                      trailing: Switch(
                          value: state.fardhu,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(FardhuChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Sholat Tahajud"),
                      subtitle: const Text("Sepertiga malam terakhir"),
                      trailing: Switch(
                          value: state.tahajud,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(TahajudChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Sholat Rawatib"),
                      subtitle: const Text("Sholat sunnah 12 raka'at"),
                      trailing: Switch(
                          value: state.rawatib,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(RawatibChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Sholat Dhuha"),
                      subtitle: const Text("Sholat sunnah"),
                      trailing: Switch(
                          value: state.dhuha,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(DhuhaChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Tilawah qur'an"),
                      subtitle: const Text("1 Juz per hari"),
                      trailing: Switch(
                          value: state.tilawah,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(TilawahChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Shaum sunnah"),
                      subtitle: const Text("Minimal Senin & Kamis"),
                      trailing: Switch(
                          value: state.shaum,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(ShaumChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Sedekah"),
                      subtitle: const Text("Sedekah harta karena Allah"),
                      trailing: Switch(
                          value: state.sedekah,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(SedekahChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Dzikir"),
                      subtitle: const Text("Dzikir pagi & petang"),
                      trailing: Switch(
                          value: state.dzikir,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(DzikirChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Taklim"),
                      subtitle: const Text("Bertambah ilmu setiap hari"),
                      trailing: Switch(
                          value: state.taklim,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(TaklimChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Istighfar"),
                      subtitle: const Text("Istighfar 100x setiap hari"),
                      trailing: Switch(
                          value: state.istighfar,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(IstighfarChanged(value: val));
                          }),
                    );
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("Sholawat"),
                      subtitle: const Text("Tanda cinta kepada Nabi SAW"),
                      trailing: Switch(
                          value: state.shalawat,
                          onChanged: (val) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(ShalawatChanged(value: val));
                          }),
                    );
                  },
                ),
                verticalSpaceMedium,
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () async {
                        viewModel.toLogin();
                      },
                      child: const Text("LOGOUT")),
                ),
                verticalSpaceMedium,

                const Center(child: Text("App version 1.0.0")),

                verticalSpaceMedium,
              ],
            ),
          );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
