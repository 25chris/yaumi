import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class PageIjin extends StatefulWidget {
  final AbsenViewModel viewModel;
  final Datum datum;
  final GoogleSignInAccount userAccount;
  const PageIjin(
      {super.key,
      required this.viewModel,
      required this.datum,
      required this.userAccount});

  @override
  State<PageIjin> createState() => _PageIjinState();
}

class _PageIjinState extends State<PageIjin> {
  @override
  Widget build(BuildContext context) {
    return widget.datum.attributes!.approval == null
        ? Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/animated/signing.gif",
                  scale: 3,
                ),
                verticalSpaceSmall,
                Text(
                  "Permohonan Cuti Dalam Evaluasi.",
                  style: ktsBodyLarge.copyWith(
                      fontWeight: FontWeight.w800, color: Colors.blueGrey[800]),
                ),
                verticalSpaceSmall,
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
        : !widget.datum.attributes!.approval!
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                        .format(
                                            widget.viewModel.selectedDateTime))
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
                            //pesan ijin

                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                            ),

                            verticalSpaceSmall,
                            Text(
                              "Maaf permohonan ijin darurat anda hari ini ditolak, mohon untuk segera masuk kerja.",
                              textAlign: TextAlign.center,
                              style: ktsBodyRegular.copyWith(
                                  fontFamily: "Poppins",
                                  color: Colors.blueGrey[700]),
                            ),

                            verticalSpaceSmall,
                            ListTile(
                              leading: Icon(Icons.comment_rounded),
                              title: Text("Alasan Penolakan:"),
                              subtitle: Text("Rincian alasana penolakan."),
                            ),

                            verticalSpaceSmall,
                            ListTile(
                              leading: Icon(Icons.person_4_outlined),
                              title: Text("Pembuat Keputusan:"),
                              subtitle: Text("Nama Atasan"),
                            ),

                            verticalSpaceSmall,
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
                                    "Untuk dapat mengisi absen hari ini, silahkan hubungi pihak administrasi.",
                                    textAlign: TextAlign.center,
                                    style: ktsBodyRegular,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                        .format(
                                            widget.viewModel.selectedDateTime))
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
                            //pesan ijin

                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.thumb_up,
                                  color: Colors.green,
                                ),
                              ),
                            ),

                            verticalSpaceSmall,
                            Text(
                              "Permohonan ijin anda disetujui oleh atasan. Semoga segala urusan hari ini dimudahkan oleh Allah Ta'aalaa.",
                              textAlign: TextAlign.center,
                              style: ktsBodyRegular.copyWith(
                                  fontFamily: "Poppins",
                                  color: Colors.blueGrey[700]),
                            ),

                            verticalSpaceSmall,
                            ListTile(
                              leading: Icon(Icons.comment_rounded),
                              title: Text("Tanggal cuti kerja:"),
                              subtitle: Text("Rincian alasana penolakan."),
                            ),

                            verticalSpaceSmall,
                            ListTile(
                              leading: Icon(Icons.comment_rounded),
                              title: Text("Catatan atasan:"),
                              subtitle: Text("Rincian alasana penolakan."),
                            ),

                            verticalSpaceSmall,
                            ListTile(
                              leading: Icon(Icons.person_4_outlined),
                              title: Text("Pembuat Keputusan:"),
                              subtitle: Text("Nama Atasan"),
                            ),
                            verticalSpaceSmall,
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
                                    "Jika anda berubah fikiran dan berencana untuk masuk kerja hari ini, silahkan hubungi pihak administrasi.",
                                    textAlign: TextAlign.center,
                                    style: ktsBodyRegular,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
  }
}
