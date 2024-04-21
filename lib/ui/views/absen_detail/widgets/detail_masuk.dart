import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen_detail/absen_detail_viewmodel.dart';
import 'package:yaumi/widgets/input_field.dart';

@FormView(fields: [FormTextField(name: "udzurKeterlambatan")])
class DetailMasuk extends StatefulWidget {
  final Datum datum;
  final AbsenDetailViewModel viewModel;
  const DetailMasuk({super.key, required this.datum, required this.viewModel});

  @override
  State<DetailMasuk> createState() => _DetailMasukState();
}

class _DetailMasukState extends State<DetailMasuk> {
  final TextEditingController keterlambatanController = TextEditingController();
  final TextInputFormatter keterlambatanInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 6,
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                StaggeredGrid.count(
                  crossAxisCount: 7,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 7,
                        mainAxisCellCount: 1,
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_month),
                              horizontalSpaceSmall,
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: DateFormat("EEEE, ", "id_ID")
                                          .format(
                                              widget.datum.attributes!.date!),
                                      style: ktsBodyRegular.copyWith(
                                          fontFamily: "Montserrat",
                                          fontStyle: FontStyle.italic,
                                          fontSize: 17.5,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.blue[900])),
                                  TextSpan(
                                      text: DateFormat("dd MMMM yyyy", "id_ID")
                                          .format(
                                              widget.datum.attributes!.date!),
                                      style: ktsBodyRegular.copyWith(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.blueGrey[500]))
                                ]),
                                style: ktsBodyRegular.copyWith(
                                  fontFamily: "Poppins",
                                ),
                              )
                            ],
                          ),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 4,
                        child: Container()),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 5,
                        mainAxisCellCount: 4,
                        child: SizedBox(
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: Image.network(
                                  "https://amala-api.online${widget.datum.attributes!.selfieMasuk!.data!.attributes!.url!}")),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 4,
                        child: Container()),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 7,
                        mainAxisCellCount: 1.3,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: FDottedLine(
                              color: Colors.red,
                              height: 70.0,
                              width: 70.0,
                              strokeWidth: 2.0,
                              dottedLength: 10.0,
                              space: 2.0,
                              corner: FDottedLineCorner.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Jam masuk kerja standar adalah jam 08:00, toleransi keterlambatan 15 menit setelah jam masuk",
                                  textAlign: TextAlign.center,
                                  style: ktsBodyRegular.copyWith(
                                      fontFamily: "Poppins"),
                                ),
                              ),
                            ),
                          ),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 7,
                        mainAxisCellCount: TimeCheckService.checkForStaggerInt(
                            widget.datum.attributes!.jamMasuk!),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.abc),
                                title: const Text("Jam Masuk:"),
                                subtitle: Text(widget
                                    .datum.attributes!.jamMasuk!
                                    .replaceRange(5, null, "")),
                              ),
                              ListTile(
                                leading: const Icon(Icons.abc),
                                title: const Text("Status absen:"),
                                subtitle: TimeCheckService.checkTimeStatus(
                                    widget.datum.attributes!.jamMasuk!,
                                    widget
                                        .datum.attributes!.perbedaanWaktuMasuk),
                              ),
                              TimeCheckService.checkTimeInput(
                                  time: widget.datum.attributes!.jamMasuk!,
                                  keterlambatanController:
                                      keterlambatanController,
                                  keterlambatanInputFormatter:
                                      keterlambatanInputFormatter,
                                  viewModel: widget.viewModel,
                                  datum: widget.datum,
                                  context: context),
                              ListTile(
                                leading: Icon(Icons.abc),
                                title: Text("Lokasi Absen Masuk:"),
                                subtitle:
                                    Text(widget.datum.attributes!.lokasi!),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton.icon(
            icon: Icon(Icons.share),
            label: Text("SHARE"),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class TimeCheckService {
  // Helper method to parse time and create a DateTime object
  static DateTime parseInputTime(String time) {
    final timeParts = time.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);
    final seconds = int.parse(timeParts[2].split('.')[0]);
    return DateTime(0, 0, 0, hours, minutes, seconds);
  }

  // Helper method to get the comparison time
  static DateTime getComparisonTime() {
    return DateTime(0, 0, 0, 8, 15, 0);
  }

  // Method to check if the input time is after the comparison time
  static bool isTimeAfter(String time) {
    final inputTime = parseInputTime(time);
    final comparisonTime = getComparisonTime();
    return inputTime.isAfter(comparisonTime);
  }

  // Unified method to generate the widget based on time comparison
  static Widget checkTimeStatus(String time, int perbedaanWaktuMasuk) {
    final isLate = isTimeAfter(time);
    final isOnTime = TimeChecker.isTimeBetween(time);
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: "Masuk Kerja: ",
          style: ktsBodyRegular.copyWith(
            fontSize: 12.0,
            color: Colors.blueGrey[800],
          )),
      TextSpan(
          text: isLate
              ? "Terlambat\nDengan poin keterlambatan: ${-perbedaanWaktuMasuk} menit"
              : isOnTime
                  ? "Tepat Waktu"
                  : "Tepat Waktu\nDengan poin overtime: $perbedaanWaktuMasuk menit",
          style: ktsBodyRegular.copyWith(
              fontSize: 12.0,
              color: isLate ? Colors.red : Colors.green,
              fontWeight: FontWeight.w800))
    ]));
  }

  static Widget checkTimeInput(
      {required String time,
      required TextEditingController keterlambatanController,
      required TextInputFormatter keterlambatanInputFormatter,
      required AbsenDetailViewModel viewModel,
      required Datum datum,
      required BuildContext context}) {
    if (isTimeAfter(time)) {
      return datum.attributes!.udzurKeterlambatan != null
          ? ListTile(
              leading: Icon(Icons.abc),
              title: Text("Alasan Keterlambatan"),
              subtitle: Text(datum.attributes!.udzurKeterlambatan!),
            )
          : Column(
              children: [
                FDottedLine(
                  color: Colors.red,
                  height: 70.0,
                  width: 70.0,
                  strokeWidth: 2.0,
                  dottedLength: 10.0,
                  space: 2.0,
                  corner: FDottedLineCorner.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Rinci alasan keterlambatan masuk kerja, jika alasan bisa diterima maka poin keterlambatan akan dihapus.",
                      textAlign: TextAlign.center,
                      style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                InputField(
                    controller: keterlambatanController,
                    hintText: "Rincian alasan",
                    inputFormatters: [keterlambatanInputFormatter],
                    textInputType: TextInputType.name,
                    labelText: 'Alasan Keterlambatan'),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        viewModel.putKeterlambatan(
                            id: datum.id!,
                            keterlambatan: keterlambatanController.text);
                      },
                      icon: const Icon(Icons.work_history_outlined),
                      label: const Text("Submit")),
                )
              ],
            );
    } else {
      return Container();
    }
  }

  static double checkForStaggerInt(String time) {
    return isTimeAfter(time) ? 8 : 4.5;
  }
}

class TimeChecker {
  // Method to check if 'time' is between 'time1' and 'time2'
  static bool isTimeBetween(String time,
      {String startTime = "08:00", String endTime = "08:15"}) {
    // Parse the time strings to TimeOfDay
    TimeOfDay t = _parseTime(time);
    TimeOfDay start = _parseTime(startTime);
    TimeOfDay end = _parseTime(endTime);

    // Convert TimeOfDay to a comparable format (minutes since midnight)
    final minutesT = t.hour * 60 + t.minute;
    final minutesStart = start.hour * 60 + start.minute;
    final minutesEnd = end.hour * 60 + end.minute;

    // Check if the time is within the range
    bool isOnTime = minutesT >= minutesStart && minutesT <= minutesEnd;
    return isOnTime;
  }

  // Helper method to parse a string to TimeOfDay
  static TimeOfDay _parseTime(String time) {
    List<String> parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
