import 'dart:async';
import 'dart:io';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

bool done = false;

class AbsenForm extends StatefulWidget {
  final AbsenViewModel viewModel;
  final Absen absen;
  final GoogleSignInAccount userAccount;
  const AbsenForm(
      {super.key,
      required this.viewModel,
      required this.absen,
      required this.userAccount});

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
  }

  void _loadStartTime({String? datetime}) async {
    DateTime startTime = DateTime.parse(datetime!);

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
                                    widget.viewModel.selectedDateTime,
                                userAccount: widget.userAccount);
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FDottedLine(
                    color: Colors.lightBlue[600]!,
                    height: 70.0,
                    width: 70.0,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2.0,
                    corner: FDottedLineCorner.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ijin cuti kerja memerlukan surat ijin cuti kerja yang ditandatangani oleh atasan langsung atau pihak direksi, silahkan siapkan surat ijin cuti kerja untuk diupload. Jika surat ijin cuti kerja belum ada silahkan ajukan ijin cuti kerja dengan tombol pengajuan cuti di bawah.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.abc),
                            label: Text("Ajukan Cuti")),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                            onPressed: () {
                              widget.viewModel.toAbsenIjinCuti();
                            },
                            icon: Icon(Icons.abc),
                            label: Text("Ijin Cuti Kerja")),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FDottedLine(
                    color: Colors.lightBlue[600]!,
                    height: 70.0,
                    width: 70.0,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2.0,
                    corner: FDottedLineCorner.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ijin tidak masuk kerja karena sakit wajib untuk melampirkan surat keterangan sakit dari dokter. Surat Keterangan sakit boleh diupload maksimal 2x24 jam setelah ijin karena sakit dibuat. Pastikan juga untuk mengabari atasan langsung atau bagian administrasi.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.abc),
                      label: Text("Sakit"))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FDottedLine(
                    color: Colors.lightBlue[600]!,
                    height: 70.0,
                    width: 70.0,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2.0,
                    corner: FDottedLineCorner.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Bekerja dari rumah hanya bisa dilakukan saat ada udzur darurat tertentu dan disetujui oleh atasan langsung. Silahkan lampirkan surat persetujuan tertulis dari atasan langsung atau direksi, atau upload bukti persetujuan via whatsapp.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.abc),
                      label: Text("Work From Home"))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
