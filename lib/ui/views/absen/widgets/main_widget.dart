import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/widgets/button_row_widget.dart';
import 'package:yaumi/ui/views/absen/widgets/upload_button.dart';
import 'package:yaumi/ui/views/absen/widgets/work_photo_button.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _activeButton = 0; // No button is active by default

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonRowWidget(
          onButtonPressed: (int index) {
            setState(() {
              _activeButton = index;
            });
          },
        ),
        verticalSpaceTiny,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pin_drop_rounded,
                  color: Colors.red,
                ),
                horizontalSpaceTiny,
                Text(
                  "Lokasi, Kota",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 12.0, color: Colors.blueGrey),
                )
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.alarm,
                  color: Colors.red,
                ),
                horizontalSpaceTiny,
                Text(
                  DateFormat(
                    "EEEE, dd MMM yy",
                    "id_ID",
                  ).format(DateTime.now()),
                  style: ktsBodyRegular.copyWith(
                      fontSize: 12.0, color: Colors.blueGrey),
                )
              ],
            )),
          ],
        ),
        Expanded(
          child: Container(
            child: _getCorrespondingWidget(_activeButton),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(onPressed: () {}, child: Text("SUBMIT")),
        ),
        verticalSpaceSmall
      ],
    );
  }

  Widget _getCorrespondingWidget(int index) {
    switch (index) {
      case 0:
        return WorkPhotoButtons();
      case 1:
      case 2:
      case 3:
        return ContainerWithTextAndUploadButton(index == 1
            ? "Upload surat ijin atau screenshot ijin di Whatsapp jika darurat"
            : index == 2
                ? "Upload surat sakit atau screenshot ijin di Whatsapp jika darurat"
                : "Upload konfirmasi atasan untuk kerja di rumah (surat / whatsapp)");
      default:
        return Container(); // Returns an empty container when no button is active
    }
  }
}

class ContainerWithText extends StatelessWidget {
  final String text;
  ContainerWithText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(fontSize: 24)),
    );
  }
}
