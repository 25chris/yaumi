import 'package:flutter/material.dart';
import 'package:yaumi/ui/views/home/home_viewmodel.dart';

class UserBar extends StatelessWidget {
  final HomeViewModel viewModel;
  const UserBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: ListTile(
            leading: const CircleAvatar(),
            title: const Text("Nama Pengguna"),
            subtitle: const Text("Nama Group"),
            trailing: IconButton(
                onPressed: () => viewModel.toSettings(),
                icon: const Icon(Icons.settings)),
          ),
        ));
  }
}
