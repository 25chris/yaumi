import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_bloc.dart';
import 'package:yaumi/blocs/bloc/settings_state.dart';
import 'package:yaumi/models/strapi/yaumi_strapi.dart';

class YaumiEdittingForm extends StatelessWidget {
  final Datum datum;
  const YaumiEdittingForm({super.key, required this.datum});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            state.fardhu
                ? ListTile(
                    title: Text("Sholat Fardhu"),
                    subtitle: Text("Sholat berjama'ah: "),
                  )
                : Container()
          ],
        );
      },
    );
  }
}
