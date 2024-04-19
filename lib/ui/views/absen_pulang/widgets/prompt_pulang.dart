import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen_pulang/absen_pulang_viewmodel.dart';

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
  String location = '';
  @override
  Widget build(BuildContext context) {
    return widget.viewModel.isLoading
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: Colors.black,
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
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
                    Text("Jam Masuk",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 13,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins")),
                    verticalSpaceSmall,
                    Text(DateFormat("hh:mm:ss").format(DateTime.now()),
                        style: ktsBodyRegular.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins")),
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
                              child: Text(location,
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
                                HttpService()
                                    .showAddress()
                                    .then((value) => location = value);
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
                              userAccount: widget.userAccount);
                        },
                        label: const Text("Catat Jam Pulang")),
                  ),
                )
              ],
            ),
          );
  }
}
