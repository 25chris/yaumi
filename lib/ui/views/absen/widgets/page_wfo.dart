import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';
import 'package:yaumi/ui/views/absen/widgets/abstein_card.dart';
import 'package:yaumi/ui/views/absen/widgets/card_wfo.dart';
import 'package:yaumi/ui/views/absen/widgets/wfo_masuk_card.dart';
import 'package:yaumi/ui/views/absen/widgets/wfo_pulang_card.dart';

class PageWfo extends StatelessWidget {
  final AbsenViewModel viewModel;
  final GoogleSignInAccount userAccount;
  final Datum datum;
  const PageWfo(
      {super.key,
      required this.viewModel,
      required this.userAccount,
      required this.datum});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWfo(
          viewModel: viewModel,
          userAccount: userAccount,
          datum: datum,
        ),
        WfoMasukCard(
            viewModel: viewModel, userAccount: userAccount, datum: datum),
        datum.attributes!.jamPulang == null &&
                viewModel.selectedDateTime !=
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day)
            ? const AbsteinCard(
                title: "Tidak melakukan absen pulang",
                subtitle: "Absen kerja hari ini akan dianggap alpha.")
            : datum.attributes!.jamPulang != null
                ? WfoPulangCard(
                    viewModel: viewModel,
                    userAccount: userAccount,
                    datum: datum,
                  )
                : Container()
      ],
    );
    ;
  }
}
