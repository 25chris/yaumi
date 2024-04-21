import 'dart:io';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen_pulang/absen_pulang_viewmodel.dart';
import 'package:yaumi/widgets/input_field.dart';

@FormView(fields: [FormTextField(name: 'pulangAwal')])
class PromptPulang extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final String imagePath;
  final DateTime selectedDate;
  final Absen absen;
  final Datum datum;
  final AbsenPulangViewModel viewModel;
  const PromptPulang(
      {super.key,
      required this.userAccount,
      required this.imagePath,
      required this.selectedDate,
      required this.absen,
      required this.datum,
      required this.viewModel});

  @override
  State<PromptPulang> createState() => _PromptPulangState();
}

class _PromptPulangState extends State<PromptPulang> {
  final TextEditingController pulangAwalController = TextEditingController();
  final TextInputFormatter pulangAwalInputFormatter =
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
                      widget.userAccount.displayName!,
                      style: ktsBodyRegular.copyWith(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Poppins"),
                    ),
                    verticalSpaceTiny,
                    Text(widget.userAccount.email,
                        style: ktsBodyRegular.copyWith(
                            fontSize: 13,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins")),
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
                Column(
                  children: [
                    Text("Jam Pulang",
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
                    formPulangAwal(
                        checkOutDifference: widget.viewModel.checkOutDifference(
                            widget.selectedDate.toString(),
                            DateFormat("HH:mm:ss").format(DateTime.now()))),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200]),
                        child: widget.viewModel.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 6,
                                  color: Colors.black,
                                ),
                              )
                            : Row(
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
                              widget.viewModel.fetchAdreess();
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        icon: const Icon(Icons.logout),
                        onPressed: () {
                          widget.viewModel.putAbsenKeluar(
                              id: widget.datum.id!,
                              pathToImage: widget.imagePath,
                              pulangLebihAwal: pulangAwalController.text,
                              date: widget.datum.attributes!.date!.toString(),
                              jamMasuk: widget.datum.attributes!.jamMasuk!,
                              jamPulang:
                                  DateFormat("HH:mm:ss").format(DateTime.now()),
                              userAccount: widget.userAccount);
                        },
                        label: const Text("Catat Jam Pulang")),
                  ),
                )
              ],
            ),
          ]);
  }

  Widget formPulangAwal({
    required int checkOutDifference,
  }) {
    return checkOutDifference < 0
        ? Column(
            children: [
              Text(
                "Poin negatif jam kerja sebesar: ${-checkOutDifference} menit",
                style: ktsBodyRegular.copyWith(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w800),
              ),
              InputField(
                  controller: pulangAwalController,
                  hintText: "Rincian alasan pulang lebih awal",
                  inputFormatters: [pulangAwalInputFormatter],
                  textInputType: TextInputType.text,
                  labelText: 'Alasan Pulang Lebih Awal'),
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
                      "Rinci alasan pulang lebih awal, jika alasan bisa diterima maka poin negatif jam kerja akan dihapus.",
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
