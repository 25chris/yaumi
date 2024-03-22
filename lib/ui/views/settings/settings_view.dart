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
    return Scaffold(
      appBar: AppBar(
        title: SettingsHeader(),
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
            leading: CircleAvatar(),
            title: Text("Nama Pengguna"),
            subtitle: Text("Edit photo profile & nama"),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Email Pengguna"),
            subtitle: Text("Ganti password"),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
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
                leading: CircleAvatar(),
                title: Text("Sholat Fardhu Berjama'ah"),
                subtitle: Text("Tepat waktu & berjama'ah di masjid"),
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
                leading: CircleAvatar(),
                title: Text("Sholat Tahajud"),
                subtitle: Text("Sepertiga malam terakhir"),
                trailing: Switch(
                    value: state.tahajud,
                    onChanged: (val) {
                      BlocProvider.of<SettingsBloc>(context)
                          .add(TahajudChanged(value: val));
                    }),
              );
            },
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Sholat Rawatib"),
            subtitle: Text("Sholat sunnah 12 raka'at"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Sholat Dhuha"),
            subtitle: Text("Sholat sunnah"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Tilawah qur'an"),
            subtitle: Text("1 Juz per hari"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Shaum sunnah"),
            subtitle: Text("Minimal Senin & Kamis"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Sedekah"),
            subtitle: Text("Sedekah harta karena Allah"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Dzikir"),
            subtitle: Text("Dzikir pagi & petang"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Taklim"),
            subtitle: Text("Bertambah ilmu setiap hari"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Istighfar"),
            subtitle: Text("Istighfar 100x setiap hari"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Sholawat"),
            subtitle: Text("Tanda cinta kepada Nabi SAW"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          verticalSpaceMedium,
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () async {
                  await LoginApi.signOut;
                  viewModel.toLogin();
                },
                child: Text("LOGOUT")),
          ),
          verticalSpaceMedium,

          Center(child: Text("App version 1.0.0")),

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
