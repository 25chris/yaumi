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
  DateTimeRange? dateRange;
  final TextEditingController _reasonController = TextEditingController();

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: dateRange,
      locale: const Locale('id'), // Specify the Indonesian locale
    );

    if (newDateRange != null) {
      setState(() {
        dateRange = newDateRange;
      });
    }
  }

  void _submitForm() {
    // Here you can handle the form submission, e.g., validation and sending data to a backend or another screen
    print('Submit the form with:');
    print('Date Range: ${dateRange.toString()}');
    print('Reason for LOA: ${_reasonController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  onPressed: () => _selectDateRange(context),
                  child: Text('Pilih tanggal cuti'),
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
                          title: Text("Dari tanggal:"),
                          subtitle: dateRange != null
                              ? Text(
                                  DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                      .format(dateRange!.start),
                                  style:
                                      ktsBodyRegular.copyWith(fontSize: 12.0),
                                )
                              : Text("-"),
                        ),
                      )),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 3,
                      mainAxisCellCount: 1.2,
                      child: Card(
                        child: ListTile(
                          title: Text("Sampai tanggal:"),
                          subtitle: dateRange != null
                              ? Text(
                                  DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                      .format(dateRange!.start),
                                  style:
                                      ktsBodyRegular.copyWith(fontSize: 12.0),
                                )
                              : Text("-"),
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
