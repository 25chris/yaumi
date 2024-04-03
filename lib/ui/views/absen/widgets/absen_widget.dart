import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';
import 'package:yaumi/ui/views/absen/widgets/absen_form.dart';

class AbsenWidget extends StatelessWidget {
  final AbsenViewModel viewModel;
  final Absen absen;
  const AbsenWidget({super.key, required this.viewModel, required this.absen});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpService().getAbsenByDateAndMail(
          email: 'zatunur.badar@gmail.com',
          date: DateFormat("yyyy-MM-dd").format(viewModel.selectedDateTime)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Datum> result = snapshot.data.data;
          if (result.isEmpty) {
            return Center(
              child: AbsenForm(
                viewModel: viewModel,
                absen: absen,
              ),
            );
          } else {
            Datum datum = result.first;
            return Center(
              child: Text('data loaded as: ${datum.attributes!.approval}'),
            );
          }
        } else {
          return const Center(
            child: Text("Error Somehow"),
          );
        }
      },
    );
  }
}
