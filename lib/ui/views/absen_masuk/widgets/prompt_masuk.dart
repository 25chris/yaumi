import 'dart:io';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen_masuk/absen_masuk_viewmodel.dart';
import 'package:yaumi/widgets/input_field.dart';

@FormView(fields: [FormTextField(name: 'keterlambatan')])
class PromptMasuk extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final String imagePath;
  final DateTime selectedDate;
  final Absen absen;
  final AbsenMasukViewModel viewModel;
  const PromptMasuk(
      {super.key,
      required this.userAccount,
      required this.imagePath,
      required this.selectedDate,
      required this.absen,
      required this.viewModel});

  @override
  State<PromptMasuk> createState() => _PromptMasukState();
}

class _PromptMasukState extends State<PromptMasuk> {
  final TextEditingController keterlambatanController = TextEditingController();
  final TextInputFormatter keterlambatanInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));
  @override
  Widget build(BuildContext context) {
    return widget.viewModel.isLoading
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: Colors.black,
            ),
          )
        : ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    verticalSpaceLarge,
                    Text(
                      DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                          .format(widget.selectedDate),
                      style: ktsBodyRegular.copyWith(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Poppins"),
                    ),
                    verticalSpaceTiny,
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .50,
                  height: MediaQuery.of(context).size.height * .50,
                  child: Image.file(
                    File(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FDottedLine(
                    color: Colors.blue,
                    height: 70.0,
                    width: 70.0,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2.0,
                    corner: FDottedLineCorner.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Yakinkan bahwa foto selfie dengan latar belakang kantor GSP / Situs Proyek / Area Kerja.",
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text("Jam Masuk",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 13,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins")),
                    verticalSpaceSmall,
                    Text(DateFormat("HH:mm:ss").format(DateTime.now()),
                        style: ktsBodyRegular.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins")),
                    verticalSpaceSmall,
                    formKeterlambatan(
                        checkInDifference: widget.viewModel.checkInDifference(
                            DateFormat("yyyy-MM-dd")
                                .format(widget.selectedDate))),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.pin_drop),
                            Flexible(
                              child: Text(widget.viewModel.location,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: ktsBodyRegular.copyWith(
                                      fontSize: 13,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins")),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Lokasi tidak tepat? ",
                          style: ktsBodyRegular.copyWith(
                              fontSize: 13,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins")),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                HttpService().showAddress().then((value) =>
                                    widget.viewModel.location = value);
                              });
                            },
                          text: "Perbaharui lokasi",
                          style: ktsBodyRegular.copyWith(
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins"))
                    ])),
                  ],
                ),
                widget.viewModel.location != ""
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton.icon(
                              icon: const Icon(Icons.login),
                              onPressed: () {
                                widget.viewModel.postAbsenMasuk(
                                    selectedDate: widget.selectedDate,
                                    userAccount: widget.userAccount,
                                    absen: widget.absen,
                                    lokasi: widget.viewModel.location,
                                    keterlambatan: keterlambatanController.text,
                                    yaumiUserId: 7);
                              },
                              label: const Text("Catat Jam Masuk")),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton.icon(
                              icon: const Icon(Icons.pin_drop_outlined),
                              onPressed: () {
                                setState(() {
                                  HttpService().showAddress().then((value) =>
                                      widget.viewModel.location = value);
                                });
                              },
                              label: const Text("Perbaharui lokasi")),
                        ),
                      )
              ],
            ),
          ]);
  }

  Widget formKeterlambatan({
    required int checkInDifference,
  }) {
    return checkInDifference < 0
        ? Column(
            children: [
              Text(
                "Poin keterlambatan sebesar: ${-checkInDifference} menit",
                style: ktsBodyRegular.copyWith(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w800),
              ),
              InputField(
                  controller: keterlambatanController,
                  hintText: "Rincian alasan keterlambatan",
                  inputFormatters: [keterlambatanInputFormatter],
                  textInputType: TextInputType.text,
                  labelText: 'Alasan Keterlambatan'),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                      "Rinci alasan keterlambatan masuk kerja, jika alasan bisa diterima maka poin keterlambatan akan dihapus.",
                      textAlign: TextAlign.center,
                      style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
