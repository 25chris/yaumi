import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/ui/views/home/home_viewmodel.dart';

class UserBar extends StatelessWidget {
  final HomeViewModel viewModel;
  final GoogleSignInAccount? currentUser;
  const UserBar(
      {super.key, required this.viewModel, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: currentUser!.photoUrl != null
                  ? NetworkImage(currentUser!.photoUrl!)
                  : null,
            ),
            title: Text(currentUser!.displayName!),
            subtitle: const Text("Nama Group"),
            trailing: IconButton(
                onPressed: () => viewModel.toSettings(),
                icon: const Icon(Icons.settings)),
          ),
        ));
  }
}
