import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

bool done = false;

class WfoCard extends StatefulWidget {
  final AbsenViewModel viewModel;
  final GoogleSignInAccount userAccount;
  final Datum? datum;
  const WfoCard(
      {super.key,
      required this.viewModel,
      required this.userAccount,
      required this.datum});

  @override
  State<WfoCard> createState() => _WfoCardState();
}

class _WfoCardState extends State<WfoCard> {
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;
  DateTime? _jamPulang;

  @override
  void initState() {
    super.initState();
    if (widget.datum != null && widget.datum!.attributes != null) {
      DateTime defaultDate = widget.datum!.attributes!.date!;
      String baseDate =
          "${defaultDate.year}-${defaultDate.month.toString().padLeft(2, '0')}-${defaultDate.day.toString().padLeft(2, '0')}";

      DateTime jamMasuk =
          DateTime.parse("$baseDate ${widget.datum!.attributes!.jamMasuk}");
      if (widget.datum!.attributes!.jamPulang != null) {
        _jamPulang =
            DateTime.parse("$baseDate ${widget.datum!.attributes!.jamPulang}");
      }

      _startTimer(jamMasuk);
    }
  }

  void _startTimer(DateTime startTime) {
    final maxDuration = Duration(hours: 8);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        DateTime currentTime = DateTime.now();
        Duration currentDuration = currentTime.difference(startTime);

        if (_jamPulang != null) {
          Duration endDuration = _jamPulang!.difference(startTime);
          if (currentDuration >= endDuration) {
            _timer?.cancel();
            currentDuration = endDuration; // Cap the time at jamPulang
          }
        }

        if (currentDuration >= maxDuration) {
          _timer?.cancel();
          currentDuration = maxDuration; // Cap the time at 8 hours
        }

        _hours = currentDuration.inHours;
        _minutes = currentDuration.inMinutes % 60;
        _seconds = currentDuration.inSeconds % 60;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            //tanggal & jam
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    horizontalSpaceTiny,
                    Text(DateFormat("dd MMM yyyy", "id_ID")
                        .format(widget.viewModel.selectedDateTime))
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    horizontalSpaceTiny,
                    Text(DateFormat.Hm().format(DateTime.now()))
                  ],
                )
              ],
            ),

            //durasi waktu kerja
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200]),
                    child: Text(_hours.toString().padLeft(2, '0'),
                        style: const TextStyle(fontSize: 20)),
                  ),
                  horizontalSpaceTiny,
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200]),
                    child: Text(_minutes.toString().padLeft(2, '0'),
                        style: const TextStyle(fontSize: 20)),
                  ),
                  horizontalSpaceTiny,
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200]),
                    child: Text(_seconds.toString().padLeft(2, '0'),
                        style: const TextStyle(fontSize: 20)),
                  ),
                  horizontalSpaceTiny,
                  Text(
                    "HRS",
                    style: ktsBodyRegular.copyWith(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.blueGrey[700]),
                  )
                ],
              ),
            ),

            widget.datum != null
                ? Text(
                    _determineMessage(),
                    textAlign: TextAlign.center,
                    style: ktsBodyRegular.copyWith(
                      fontSize: 12.0,
                    ),
                  )
                : Text(
                    "General jam kerja dari pukul 08:00 hingga 16:00 sekitar 8 jam.",
                    style: ktsBodyRegular.copyWith(
                      fontSize: 12.0,
                    ),
                  ),

            //Tombol
            widget.datum != null
                ? widget.datum!.attributes!.jamPulang == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.all(8),
                                  backgroundColor: Colors.white),
                              onPressed: null,
                              icon: const Icon(Icons.cases_outlined),
                              label: Text(
                                "Sedang Bekerja",
                                style: ktsBodyRegular.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w800),
                              )),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.all(8),
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                widget.viewModel.toAbsenPulang(
                                    selectedDatetime:
                                        widget.viewModel.selectedDateTime,
                                    userAccount: widget.userAccount,
                                    datum: widget.datum!);
                              },
                              icon: const Icon(Icons.logout),
                              label: Text(
                                "Selesai bekerja",
                                style: ktsBodyRegular.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w800),
                              )),
                        ],
                      )
                    : Container()
                : ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        backgroundColor: Colors.blue[800]),
                    onPressed: () {
                      widget.viewModel.toAbsenMasuk(
                        selectedDatetime: widget.viewModel.selectedDateTime,
                        userAccount: widget.userAccount,
                      );
                    },
                    icon: const Icon(Icons.login),
                    label: Text(
                      "Masuk Kerja",
                      style: ktsBodyRegular.copyWith(
                          fontSize: 12.0, fontWeight: FontWeight.w800),
                    ))
          ],
        ),
      ),
    );
  }

  String _determineMessage() {
    String message =
        "Working..."; // Default message if none of the conditions are met

    // Handle null jamMasuk or jamPulang
    if (widget.datum!.attributes!.jamMasuk == null &&
        widget.datum!.attributes!.jamPulang == null) {
      return "General jam kerja dari pukul 08:00 hingga 16:00 sekitar 8 jam.";
    } else if (widget.datum!.attributes!.jamPulang == null) {
      return "General jam kerja dari pukul 08:00 hingga 16:00 sekitar 8 jam.";
    }

    // Parse the times
    DateTime startTime = DateTime.parse(
        '${widget.viewModel.selectedDateTime.toIso8601String().split('T')[0]} ${widget.datum!.attributes!.jamMasuk}');
    DateTime endTime = DateTime.parse(
        '${widget.viewModel.selectedDateTime.toIso8601String().split('T')[0]} ${widget.datum!.attributes!.jamPulang}');

    // Calculate the worked duration
    Duration workedDuration = endTime.difference(startTime);
    int workedHours = workedDuration.inHours;

    // Define work and home time windows
    DateTime homeStart = DateTime(
        widget.viewModel.selectedDateTime.year,
        widget.viewModel.selectedDateTime.month,
        widget.viewModel.selectedDateTime.day,
        16,
        00);
    DateTime homeEnd = DateTime(
        widget.viewModel.selectedDateTime.year,
        widget.viewModel.selectedDateTime.month,
        widget.viewModel.selectedDateTime.day,
        16,
        30);
    DateTime workStartGraceBegin = DateTime(
        widget.viewModel.selectedDateTime.year,
        widget.viewModel.selectedDateTime.month,
        widget.viewModel.selectedDateTime.day,
        8,
        00);
    DateTime workStartGraceEnd = DateTime(
        widget.viewModel.selectedDateTime.year,
        widget.viewModel.selectedDateTime.month,
        widget.viewModel.selectedDateTime.day,
        8,
        15);

    // Initialize overtime and late minutes
    int overtimeMinutes = 0;
    int lateMinutes = 0;

    // Calculate overtime for early start or late finish
    if (startTime.isBefore(workStartGraceBegin)) {
      overtimeMinutes += workStartGraceBegin.difference(startTime).inMinutes;
    }
    if (endTime.isAfter(homeEnd)) {
      overtimeMinutes += endTime.difference(homeEnd).inMinutes;
    }

    // Calculate late minutes for late start or early finish
    if (startTime.isAfter(workStartGraceEnd)) {
      lateMinutes += startTime.difference(workStartGraceEnd).inMinutes;
    }
    if (endTime.isBefore(homeStart)) {
      lateMinutes += homeStart.difference(endTime).inMinutes;
    }

    // Determine the appropriate message
    if (workedHours >= 8) {
      if (endTime.isBefore(homeStart)) {
        message =
            "Anda telah bekerja selama 8 jam, namun belum sampai jam pulang. Tunggu waktunya pulang.";
      } else if (endTime.isAfter(homeStart) && endTime.isBefore(homeEnd)) {
        message = "Anda telah bekerja selama 8 jam, Terima Kasih.";
      } else if (endTime.isAfter(homeEnd)) {
        message =
            "Anda telah bekerja lebih dari 8 jam, anda memiliki overtime. Kerja baik!!";
      }
      if (overtimeMinutes > 0 || lateMinutes > 0) {
        message +=
            " Note: Anda memiliki $overtimeMinutes menit poin overtime dan terkena $lateMinutes menit poin keterlambatan.";
      }
    }

    return message;
  }
}
