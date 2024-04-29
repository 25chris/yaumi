import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';
import 'package:yaumi/ui/views/absen/widgets/card_ijin.dart';
import 'package:yaumi/ui/views/absen/widgets/card_sakit.dart';
import 'package:yaumi/ui/views/absen/widgets/card_wfo.dart';

class AbsenForm extends StatefulWidget {
  final AbsenViewModel viewModel;
  final Absen absen;
  final GoogleSignInAccount userAccount;
  const AbsenForm(
      {super.key,
      required this.viewModel,
      required this.absen,
      required this.userAccount});

  @override
  State<AbsenForm> createState() => _AbsenFormState();
}

class _AbsenFormState extends State<AbsenForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CardWfo(
            viewModel: widget.viewModel,
            userAccount: widget.userAccount,
            datum: null,
          ),
        ),
        CardIjin(viewModel: widget.viewModel, userAccount: widget.userAccount),
        CardSakit(viewModel: widget.viewModel, userAccount: widget.userAccount),
      ],
    );
  }
}
