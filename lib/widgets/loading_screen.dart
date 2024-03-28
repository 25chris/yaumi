import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';

class YaumiSubmissionLoadingScreen extends StatelessWidget {
  const YaumiSubmissionLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Menyimpan Data\nYaumi",
              textAlign: TextAlign.center,
              style: ktsBodyRegular.copyWith(
                  fontSize: 13,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            verticalSpaceSmall,
            const CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 6,
            )
          ],
        ),
      ),
    );
  }
}
