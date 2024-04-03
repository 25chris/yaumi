import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/yaumi_temp.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class WfoPulangCard extends StatelessWidget {
  final AbsenViewModel viewModel;
  const WfoPulangCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        child:
            imageFilePath != "" ? Image.file(File(imageFilePath)) : SizedBox(),
      ),
      title: Text.rich(TextSpan(children: [
        TextSpan(
            text: "Pulang Kerja: ",
            style: ktsBodyRegular.copyWith(
                fontSize: 15.0,
                color: Colors.blueGrey[800],
                fontWeight: FontWeight.w800)),
        TextSpan(
            text: "Tepat Waktu",
            style: ktsBodyRegular.copyWith(
                fontSize: 13.0,
                color: Colors.blue,
                fontWeight: FontWeight.w800)),
      ])),
      subtitle: Text(
        "16:20",
        style: ktsBodyRegular.copyWith(
            fontSize: 17.0,
            color: Colors.blueGrey[800],
            fontWeight: FontWeight.w700),
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
