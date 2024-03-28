import 'package:flutter/material.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/views/yaumi/widgets/yaumi_editting_form.dart';
import 'package:yaumi/ui/views/yaumi/widgets/yaumi_list_tiles.dart';
import 'package:yaumi/ui/views/yaumi/yaumi_viewmodel.dart';

class YaumiSubmissionForm extends StatelessWidget {
  final YaumiViewModel viewModel;
  const YaumiSubmissionForm({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HttpService().getYaumiByDateAndMail(
            email: 'zatunur.badar@gmail.com',
            date: viewModel.selectedDateTime.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final result = snapshot.data!.data;
            if (result!.isEmpty) {
              return Column(
                children: [
                  FardhuListTile(
                    datum: null,
                    viewModel: viewModel,
                  ),
                  TahajudListTile(
                    viewModel: viewModel,
                  ),
                  DhuhaListTile(viewModel: viewModel),
                  RawatibListTile(viewModel: viewModel),
                  TilawahListTile(
                    viewModel: viewModel,
                  ),
                  ShaumListTile(viewModel: viewModel),
                  SedekahListTile(viewModel: viewModel),
                  DzikirListTile(viewModel: viewModel),
                  TaklimListTile(
                    viewModel: viewModel,
                  ),
                  IstighfarListTile(viewModel: viewModel),
                  ShalawatListTile(viewModel: viewModel),
                ],
              );
            } else {
              if (result.isEmpty) {
                return Container();
              } else {
                return Column(
                  children: [
                    FardhuListTile(viewModel: viewModel, datum: result.first)
                  ],
                );
              }
            }
          } else {
            return Container(
              child: Center(
                child: Text("Error"),
              ),
            );
          }
        });
  }
}
