import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';
import 'package:yaumi/ui/views/absen/widgets/absen_form.dart';
import 'package:yaumi/ui/views/absen/widgets/wfo_card.dart';
import 'package:yaumi/ui/views/absen/widgets/wfo_masuk_card.dart';

class AbsenWidget extends StatelessWidget {
  final AbsenViewModel viewModel;
  final Absen absen;
  final GoogleSignInAccount userAccount;
  const AbsenWidget(
      {super.key,
      required this.viewModel,
      required this.absen,
      required this.userAccount});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpService().getAbsenByDateAndMail(
          email: userAccount.email,
          date: DateFormat("yyyy-MM-dd").format(viewModel.selectedDateTime)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          try {
            List<Datum> result = snapshot.data.data;
            if (result.isEmpty) {
              return Center(
                child: AbsenForm(
                  viewModel: viewModel,
                  absen: absen,
                  userAccount: userAccount,
                ),
              );
            } else {
              Datum datum = result.first;
              return Column(
                children: [
                  WfoCard(
                    viewModel: viewModel,
                    userAccount: userAccount,
                    datum: datum,
                  ),
                  WfoMasukCard(viewModel: viewModel)
                ],
              );
            }
          } catch (e) {
            print(e);
            return Center(
              child: Text('data'),
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
