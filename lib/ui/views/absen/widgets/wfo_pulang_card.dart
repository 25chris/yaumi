import 'package:flutter/material.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class WfoPulangCard extends StatelessWidget {
  final AbsenViewModel viewModel;
  final Datum datum;
  const WfoPulangCard(
      {super.key, required this.viewModel, required this.datum});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        child: datum.attributes!.selfieMasuk!.data!.attributes!.url! != ""
            ? RotatedBox(
                quarterTurns: 1,
                child: Image.network(
                    "https://amala-api.online${datum.attributes!.selfieMasuk!.data!.attributes!.url!}"),
              )
            : SizedBox(),
      ),
      title: checkTimeStatus(datum.attributes!.jamPulang!),
      subtitle: Text(
        datum.attributes!.jamPulang!.replaceRange(5, null, ""),
        style: ktsBodyRegular.copyWith(
            fontSize: 17.0,
            color: Colors.blueGrey[800],
            fontWeight: FontWeight.w700),
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }
}

Widget checkTimeStatus(String time) {
  // Parse the input time string
  final timeParts = time.split(':');
  final hours = int.parse(timeParts[0]);
  final minutes = int.parse(timeParts[1]);
  final seconds = int.parse(timeParts[2].split('.')[0]);

  // Create a DateTime object for the given time (we don't care about the date part here)
  final inputTime = DateTime(0, 0, 0, hours, minutes, seconds);

  // Create a DateTime object for 08:00:00
  final comparisonTime = DateTime(0, 0, 0, 16, 0, 0);

  // Check if the input time is later than 08:00:00
  if (inputTime.isBefore(comparisonTime)) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: "Pulang Kerja: ",
          style: ktsBodyRegular.copyWith(
            fontSize: 12.0,
            color: Colors.blueGrey[800],
          )),
      TextSpan(
          text: "Pulang Awal",
          style: ktsBodyRegular.copyWith(
              fontSize: 12.0, color: Colors.red, fontWeight: FontWeight.w800))
    ]));
  } else {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: "Pulang Kerja: ",
          style: ktsBodyRegular.copyWith(
            fontSize: 12.0,
            color: Colors.blueGrey[800],
          )),
      TextSpan(
          text: "Tepat Waktu",
          style: ktsBodyRegular.copyWith(
              fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w800))
    ]));
  }
}
