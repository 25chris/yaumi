import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class WorkPhotoButtons extends StatelessWidget {
  final AbsenViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const WorkPhotoButtons(
      {super.key, required this.viewModel, required this.userAccount});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceSmall,
        Text(
          "Masuk kerja 07.30, kepulangan 16.30",
          style: TextStyle(fontSize: 13, color: Colors.blueGrey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text('Selfie Masuk'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for "Pulang Kerja" function
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Selfie Pulang'),
            ),
          ],
        ),
      ],
    );
  }
}
