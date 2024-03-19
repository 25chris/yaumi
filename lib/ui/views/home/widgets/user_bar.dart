import 'package:flutter/material.dart';

class UserBar extends StatelessWidget {
  const UserBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: ListTile(
            leading: CircleAvatar(),
            title: Text("Nama Pengguna"),
            subtitle: Text("Nama Group"),
            trailing: Icon(Icons.settings),
          ),
        ));
  }
}
