import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';

class WorkPhotoButtons extends StatelessWidget {
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
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for "Photo Masuk Kerja" function
                print('Photo Masuk Kerja button pressed');
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
