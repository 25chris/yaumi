import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';

class ContainerWithTextAndUploadButton extends StatelessWidget {
  final String text;
  ContainerWithTextAndUploadButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceSmall,
        Text(
          text,
          style: TextStyle(fontSize: 13, color: Colors.blueGrey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // Placeholder for upload function
          },
          icon: const Icon(Icons.cloud_upload),
          label: const Text('Upload'),
        ),
      ],
    );
  }
}
