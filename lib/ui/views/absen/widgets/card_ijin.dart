import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class CardIjin extends StatefulWidget {
  final AbsenViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const CardIjin(
      {super.key, required this.viewModel, required this.userAccount});

  @override
  State<CardIjin> createState() => _CardIjinState();
}

class _CardIjinState extends State<CardIjin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        onPressed: () {
                          widget.viewModel
                              .toAbsenIjinCuti(userAccount: widget.userAccount);
                        },
                        icon: Icon(Icons.abc),
                        label: Text("Ajukan Cuti")),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          widget.viewModel.toAbsenIjinCutiDarurat(
                              userAccount: widget.userAccount);
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
    );
  }
}
