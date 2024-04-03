import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/common/yaumi_temp.dart';

import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class WorkPhotoButtons extends StatelessWidget {
  final AbsenViewModel viewModel;
  const WorkPhotoButtons({super.key, required this.viewModel});
  @override
  Widget build(BuildContext context) {
    print('imageFilePath: $imageFilePath');
    return Column(
      children: [
        verticalSpaceSmall,
        Text(
          "Masuk kerja 07.30, kepulangan 16.30",
          style: TextStyle(fontSize: 13, color: Colors.blueGrey[600]),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                viewModel.toAbsenSelfie(
                    selectedDatetime: viewModel.selectedDateTime);
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Selfie Masuk'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for "Pulang Kerja" function
                print('Pulang Kerja button pressed');
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Selfie Pulang'),
            ),
          ],
        ),
      ],
    );
  }
}
