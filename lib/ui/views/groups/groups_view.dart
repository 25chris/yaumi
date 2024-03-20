import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'groups_viewmodel.dart';

class GroupsView extends StackedView<GroupsViewModel> {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GroupsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group"),
      ),
      body: ListView(
        children: List.generate(
            1,
            (index) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://picsum.photos/300"),
                    ),
                    title: Text("Nama Group"),
                    subtitle: Text("Jumlah Anggota"),
                    trailing: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.add),
                    ),
                  ),
                )),
      ),
    );
  }

  @override
  GroupsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GroupsViewModel();
}
