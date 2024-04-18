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

class AbsenKeluarPrompt extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final String? imagePath;
  final Absen absen;
  final DateTime selectedDate;
  final Datum datum;
  const AbsenKeluarPrompt(
      {super.key,
      required this.userAccount,
      required this.imagePath,
      required this.absen,
      required this.datum,
      required this.selectedDate});

  @override
  State<AbsenKeluarPrompt> createState() => _AbsenKeluarPromptState();
}

class _AbsenKeluarPromptState extends State<AbsenKeluarPrompt> {
  String? location;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              File(widget.imagePath!),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text("Jam Keluar",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 13,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins")),
              verticalSpaceSmall,
              Text(DateFormat("HH:MM:ss").format(DateTime.now()),
                  style: ktsBodyRegular.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Poppins")),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pin_drop),
                      Flexible(
                        child: Text(location ?? 'Lokasi tidak ditemukan',
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
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  icon: Icon(Icons.login),
                  onPressed: () {
                    try {
                      HttpService().putAbsenKeluarData(
                          id: widget.datum.id!,
                          pathToImage: widget.absen.selfieMasuk);
                    } catch (e) {
                      print('Error with: $e');
                    }
                  },
                  label: Text("Catat Jam Keluar")),
            ),
          )
        ],
      ),
    );
  }
}
