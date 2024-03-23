import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/models/yaumi.dart';

class FardhuDialogModel extends BaseViewModel {
  void shubuhChange({required BuildContext context, required Yaumi yaumi}) {
    BlocProvider.of<YaumiBloc>(context).add(AddYaumi(yaumi: yaumi));
    rebuildUi();
  }
}
