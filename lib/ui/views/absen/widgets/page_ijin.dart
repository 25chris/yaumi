import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class PageIjin extends StatefulWidget {
  final AbsenViewModel viewModel;
  final Datum datum;
  const PageIjin({super.key, required this.viewModel, required this.datum});

  @override
  State<PageIjin> createState() => _PageIjinState();
}

class _PageIjinState extends State<PageIjin> {
  @override
  Widget build(BuildContext context) {
    return !widget.datum.attributes!.approval!
        ? Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        "Permohonan cuti sudah masuk.\nMenunggu approval dari direksi / atasan langsung.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular,
                      ),
                    )),
              ],
            ),
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      // tanggal & jam
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
                      )
                      //pesan ijin
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
