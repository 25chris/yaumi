import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';

class AbsteinCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const AbsteinCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 25,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.red),
          ),
        ),
        title: Text(
          title,
          style: ktsBodyRegular.copyWith(
              color: Colors.red, fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
          subtitle,
          style: ktsBodyRegular.copyWith(
              color: Colors.blueGrey[800], fontSize: 11.5),
        ),
      ),
    );
  }
}
