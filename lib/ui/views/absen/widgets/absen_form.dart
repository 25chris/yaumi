import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

bool done = false;

class AbsenForm extends StatefulWidget {
  final AbsenViewModel viewModel;
  final Absen absen;
  const AbsenForm({super.key, required this.viewModel, required this.absen});

  @override
  State<AbsenForm> createState() => _AbsenFormState();
}

class _AbsenFormState extends State<AbsenForm> {
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadStartTime();
  }

  void _loadStartTime() async {
    DateTime startTime = DateTime.parse("2024-04-03T01:45:00.000Z");

    final currentTime = DateTime.now();
    final difference = currentTime.difference(startTime);

    setState(() {
      _hours = difference.inHours;
      _minutes = difference.inMinutes % 60;
      _seconds = difference.inSeconds % 60;
    });

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
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

                  //info waktu kerja ideal
                  Text(
                    "Jadwal kerja general hari ini dari jam 07.30 sampai 16.30",
                    style: ktsBodyRegular.copyWith(
                      fontSize: 12.0,
                    ),
                  ),

                  //Tombol
                  done
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.all(8),
                                    backgroundColor: Colors.red),
                                onPressed: () {},
                                icon: const Icon(Icons.logout),
                                label: Text(
                                  "Pulang Kerja",
                                  style: ktsBodyRegular.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800),
                                )),
                          ],
                        )
                      : ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(8),
                              backgroundColor: Colors.blue[800]),
                          onPressed: () {
                            widget.viewModel.toAbsenSelfie(
                                selectedDatetime:
                                    widget.viewModel.selectedDateTime);
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
          ),
        ),
        verticalSpaceSmall,
        SizedBox(
          child: widget.absen.selfieMasuk != ''
              ? Image.file(File(widget.absen.selfieMasuk))
              : Container(),
        )
      ],
    );
  }
}
