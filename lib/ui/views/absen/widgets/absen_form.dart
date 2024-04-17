import 'dart:async';
import 'dart:io';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';
import 'package:yaumi/ui/views/absen/widgets/wfo_card.dart';

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
          child: WfoCard(
            viewModel: widget.viewModel,
            userAccount: widget.userAccount,
            datum: null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FDottedLine(
                    color: Colors.lightBlue[600]!,
                    height: 70.0,
                    width: 70.0,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2.0,
                    corner: FDottedLineCorner.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ijin cuti kerja memerlukan surat ijin cuti kerja yang ditandatangani oleh atasan langsung atau pihak direksi, silahkan siapkan surat ijin cuti kerja untuk diupload. Jika surat ijin cuti kerja belum ada silahkan ajukan ijin cuti kerja dengan tombol pengajuan cuti di bawah.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.abc),
                            label: Text("Ajukan Cuti")),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                            onPressed: () {
                              widget.viewModel.toAbsenIjinCuti();
                            },
                            icon: Icon(Icons.abc),
                            label: Text("Ijin Cuti Kerja")),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FDottedLine(
                    color: Colors.lightBlue[600]!,
                    height: 70.0,
                    width: 70.0,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2.0,
                    corner: FDottedLineCorner.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ijin tidak masuk kerja karena sakit wajib untuk melampirkan surat keterangan sakit dari dokter. Surat Keterangan sakit boleh diupload maksimal 2x24 jam setelah ijin karena sakit dibuat. Pastikan juga untuk mengabari atasan langsung atau bagian administrasi.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.abc),
                      label: Text("Sakit"))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FDottedLine(
                    color: Colors.lightBlue[600]!,
                    height: 70.0,
                    width: 70.0,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2.0,
                    corner: FDottedLineCorner.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Bekerja dari rumah hanya bisa dilakukan saat ada udzur darurat tertentu dan disetujui oleh atasan langsung. Silahkan lampirkan surat persetujuan tertulis dari atasan langsung atau direksi, atau upload bukti persetujuan via whatsapp.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.abc),
                      label: Text("Work From Home"))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
