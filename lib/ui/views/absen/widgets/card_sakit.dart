import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class CardSakit extends StatelessWidget {
  final AbsenViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const CardSakit(
      {super.key, required this.viewModel, required this.userAccount});

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
                    "Ijin tidak masuk kerja karena sakit wajib untuk melampirkan surat keterangan sakit dari dokter. Surat Keterangan sakit boleh diupload maksimal 2x24 jam setelah ijin karena sakit dibuat. Pastikan juga untuk mengabari atasan langsung atau bagian administrasi.",
                    textAlign: TextAlign.center,
                    style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                  ),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    viewModel.toAbsenSakit(userAccount: userAccount);
                  },
                  icon: Icon(Icons.abc),
                  label: Text("Sakit"))
            ],
          ),
        ),
      ),
    );
  }
}
