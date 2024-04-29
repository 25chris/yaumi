import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen_ijin_cuti/absen_ijin_cuti_viewmodel.dart';
import 'package:yaumi/widgets/input_field.dart';

@FormView(fields: [FormTextField(name: "ijinCuti")])
class LoaEmergencyForm extends StatefulWidget {
  final DateTime selectedDateTime;
  final AbsenIjinCutiViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const LoaEmergencyForm(
      {super.key,
      required this.viewModel,
      required this.selectedDateTime,
      required this.userAccount});

  @override
  State<LoaEmergencyForm> createState() => _LoaEmergencyFormState();
}

class _LoaEmergencyFormState extends State<LoaEmergencyForm> {
  final TextEditingController ijinCutiController = TextEditingController();
  final TextInputFormatter ijinCutiInputFormatter =
      FilteringTextInputFormatter.deny(RegExp("`"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: widget.viewModel.formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Ijin Cuti ",
                      style: ktsBodyLarge.copyWith(
                          fontSize: 27.0,
                          color: Colors.blueGrey[600],
                          fontStyle: FontStyle.italic,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w800),
                    ),
                    TextSpan(
                      text: "Kerja Darurat",
                      style: ktsBodyLarge.copyWith(
                          fontSize: 27.0,
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w800),
                    )
                  ])),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.list_alt,
                          color: Colors.green,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.blueGrey[700],
                  ),
                  horizontalSpaceSmall,
                  Text(
                    DateFormat("EEEE, dd MMMM yyyy", "ID_id")
                        .format(widget.selectedDateTime),
                    style: ktsBodyLarge.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.blueGrey[700]),
                  ),
                ],
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
                    "Ini adalah form cuti kerja darurat yang hanya berlaku untuk 1 hari ini.",
                    style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InputField(
                  controller: ijinCutiController,
                  hintText: "Rincian ijin cuti kerja hari ini",
                  inputFormatters: [ijinCutiInputFormatter],
                  maxLines: 3,
                  textInputType: TextInputType.text,
                  validate: true,
                  labelText: "Alasan Ijin Cuti Kerja Hari Ini"),
              widget.viewModel.isLoading
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 6,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : ListTile(
                      leading: const Icon(Icons.pin_drop),
                      title: const Text("Lokasi input data:"),
                      subtitle: Text(widget.viewModel.location!),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: widget.viewModel.location == ""
            ? ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  widget.viewModel.fetchAdreess();
                },
                child: const Text('Perbaharui lokasi input data!'),
              )
            : ElevatedButton(
                onPressed: () {
                  if (widget.viewModel.formKey.currentState!.validate()) {
                    widget.viewModel.promptIjinDialog(
                        selectedDate: widget.selectedDateTime,
                        alasanIjin: ijinCutiController.text,
                        userAccount: widget.userAccount,
                        date: DateFormat("yyyy-MM-dd")
                            .format(widget.selectedDateTime),
                        timestamp: widget.selectedDateTime.toString(),
                        lokasi: widget.viewModel.location!,
                        yaumiUserId: 7);
                  }
                },
                child: const Text('Submit Cuti Kerja Darurat'),
              ),
      ),
    );
  }
}
