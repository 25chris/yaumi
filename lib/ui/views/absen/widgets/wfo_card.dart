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

  @override
  void initState() {
    if (widget.datum != null) {
      print(widget.datum!.attributes!.timeStamp.toString());
      _loadStartTime(datetime: widget.datum!.attributes!.timeStamp.toString());
    } else {
      return;
    }

    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Update the seconds and handle minute and hour incrementation
      setState(() {
        _seconds++;
        if (_seconds >= 60) {
          _seconds = 0;
          _minutes++;
        }
        if (_minutes >= 60) {
          _minutes = 0;
          _hours++;
        }

        // Check if the total hours have reached 8, then stop the timer
        if (_hours >= 8) {
          _hours = 8; // Ensure hours display stops at 8
          _timer?.cancel(); // Stop the timer
        }
      });
    });
  }

  void _loadStartTime({String? datetime}) async {
    try {
      // Parse the UTC datetime string
      DateTime utcStartTime = DateTime.parse(datetime!);

      // Convert UTC time to UTC+7
      DateTime localStartTime = utcStartTime.subtract(Duration(hours: 7));

      final currentTime = DateTime.now();
      final difference = currentTime.difference(localStartTime);

      int initialHours = difference.inHours;
      if (initialHours >= 8) {
        _hours = 8; // Stop the hours at 8
        _minutes = 0;
        _seconds = 0;
        return; // Do not start the timer if already at or beyond 8 hours
      } else {
        setState(() {
          _hours = initialHours;
          _minutes = difference.inMinutes % 60;
          _seconds = difference.inSeconds % 60;
        });

        _startTimer();
      }
    } catch (e) {
      // Handle parsing error or show error message
      print('Error parsing datetime: $e');
    }
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

            _hours == 8
                ?
                //info waktu kerja ideal
                Text(
                    "\nHari ini anda telah menunaikan 8 jam kerja.\n",
                    textAlign: TextAlign.center,
                    style: ktsBodyRegular.copyWith(
                      fontSize: 12.0,
                    ),
                  )
                :

                //info waktu kerja ideal
                Text(
                    "\nGeneral hours dari jam 08.00 sampai 16.00, total 8 Jam\n",
                    textAlign: TextAlign.center,
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
}
