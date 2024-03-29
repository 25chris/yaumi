import 'package:flutter/material.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/views/yaumi/widgets/yaumi_list_tiles.dart';
import 'package:yaumi/ui/views/yaumi/yaumi_viewmodel.dart';

class YaumiSubmissionForm extends StatelessWidget {
  final YaumiViewModel viewModel;
  const YaumiSubmissionForm({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FardhuListTile(
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
  }
}
