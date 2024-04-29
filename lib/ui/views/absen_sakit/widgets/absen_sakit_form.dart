import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen_sakit/absen_sakit_viewmodel.dart';

class AbsenSakitForm extends StatefulWidget {
  final AbsenSakitViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const AbsenSakitForm(
      {super.key, required this.viewModel, required this.userAccount});

  @override
  State<AbsenSakitForm> createState() => _AbsenSakitFormState();
}

class _AbsenSakitFormState extends State<AbsenSakitForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Ijin ",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 27.0,
                      color: Colors.blueGrey[600],
                      fontStyle: FontStyle.italic,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: "Sakit",
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
              onPressed: () => widget.viewModel.selectDateRange(context),
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
                      subtitle: widget.viewModel.newDateRange != null
                          ? Text(
                              DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                  .format(widget.viewModel.newDateRange!.start),
                              style: ktsBodyRegular.copyWith(fontSize: 12.0),
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
                      subtitle: widget.viewModel.newDateRange != null
                          ? Text(
                              DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                  .format(widget.viewModel.newDateRange!.end),
                              style: ktsBodyRegular.copyWith(fontSize: 12.0),
                            )
                          : const Text("-"),
                    ),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 4,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: widget.viewModel.suratSakitImage != null
                        ? Container()
                        : const Icon(
                            Icons.image_outlined,
                            size: 75,
                            color: Colors.grey,
                          ),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1,
                  child: Card(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Upload Surat Sakit")))),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1,
                  child: Card(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Foto Surat Sakit")))),
            ],
          ),
          verticalSpaceSmall,
        ],
      )),
      bottomNavigationBar: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.medical_information_outlined),
          label: Text("Submit Ijin Sakit")),
    );
  }
}
