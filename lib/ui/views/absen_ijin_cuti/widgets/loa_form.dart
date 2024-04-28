import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen_ijin_cuti/absen_ijin_cuti_viewmodel.dart';
import 'package:yaumi/widgets/input_field.dart';

@FormView(fields: [FormTextField(name: "ijinCuti")])
class LOAForm extends StatefulWidget {
  final DateTime selectedDateTime;
  final AbsenIjinCutiViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const LOAForm(
      {super.key,
      required this.viewModel,
      required this.selectedDateTime,
      required this.userAccount});

  @override
  State<LOAForm> createState() => _LOAFormState();
}

class _LOAFormState extends State<LOAForm> {
  final TextEditingController ijinCutiController = TextEditingController();
  final TextInputFormatter ijinCutiInputFormatter =
      FilteringTextInputFormatter.deny(RegExp("`"));
  DateTimeRange? newDateRange;
  final _formKey = GlobalKey<FormState>();

  Future<void> selectDateRange(BuildContext context) async {
    while (true) {
      // Loop to allow re-selection if needed
      DateTimeRange? pickedRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDateRange: newDateRange,
      );

      if (pickedRange != null) {
        newDateRange = pickedRange; // Update with the newly picked range
        break; // Exit the loop as a valid range has been picked or edited
      } else {
        // Show dialog to enforce selection or allow cancellation
        bool shouldContinue = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Selection Required'),
                content: Text('You must select a date range to proceed.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('OK'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ) ??
            false; // Default to false if null

        if (!shouldContinue) break; // Exit if the user chooses to cancel
      }
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await selectDateRange(context);

      if (newDateRange != null) {
        // Here you can handle the form submission, e.g., validation and sending data to a backend or another screen
        FocusScope.of(context).requestFocus(FocusNode());
        print('Submit the form with:');
        print('Date Range: ${newDateRange.toString()}');
        print('Reason for LOA: ${ijinCutiController.text}');
      } else {
        // Handle the case where no date range is selected after all attempts
        print("No date range selected");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                          text: "Kerja",
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
                  verticalSpaceSmall,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => selectDateRange(context),
                      child: const Text('Pilih tanggal cuti'),
                    ),
                  ),
                  verticalSpaceSmall,
                  StaggeredGrid.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    children: [
                      StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 1.2,
                          child: Card(
                            child: ListTile(
                              title: const Text("Dari tanggal:"),
                              subtitle: newDateRange != null
                                  ? Text(
                                      DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                          .format(newDateRange!.start),
                                      style: ktsBodyRegular.copyWith(
                                          fontSize: 12.0),
                                    )
                                  : const Text("-"),
                            ),
                          )),
                      StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 1.2,
                          child: Card(
                            child: ListTile(
                              title: const Text("Sampai tanggal:"),
                              subtitle: newDateRange != null
                                  ? Text(
                                      DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                          .format(newDateRange!.start),
                                      style: ktsBodyRegular.copyWith(
                                          fontSize: 12.0),
                                    )
                                  : const Text("-"),
                            ),
                          ))
                    ],
                  ),
                  verticalSpaceSmall,
                  InputField(
                      controller: ijinCutiController,
                      hintText: "Rincian ijin cuti kerja hari ini",
                      inputFormatters: [ijinCutiInputFormatter],
                      maxLines: 3,
                      textInputType: TextInputType.text,
                      validate: true,
                      labelText: "Alasan Ijin Cuti Kerja Hari Ini"),
                  verticalSpaceSmall,
                  ListTile(
                    leading: const Icon(Icons.abc),
                    title: const Text("Durasi cuti (dalam hari):"),
                    subtitle: newDateRange != null
                        ? Text(
                            "${(newDateRange!.duration.inDays + 1).toString()} hari")
                        : const Text("-"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FDottedLine(
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
                          "Setelah pengajuan cuti diajukan, pihak administrasi akan membuat surat rekomendasi tertulis dan pengajuan akan diserahkan kepada pihak direktur.",
                          textAlign: TextAlign.center,
                          style: ktsBodyRegular.copyWith(fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
            onPressed: _submitForm,
            icon: const Icon(Icons.turn_left_outlined),
            label: const Text("Ajukan Cuti")),
      ),
    );
  }
}
