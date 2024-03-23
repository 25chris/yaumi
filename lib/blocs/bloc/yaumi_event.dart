part of 'yaumi_bloc.dart';

sealed class YaumiEvent extends Equatable {
  const YaumiEvent();

  @override
  List<Object> get props => [];
}

class AddYaumi extends YaumiEvent {
  final Yaumi yaumi;
  const AddYaumi({required this.yaumi});

  @override
  List<Object> get props => [yaumi];
}

class UpdateYaumi extends YaumiEvent {
  final Yaumi yaumi;
  const UpdateYaumi({required this.yaumi});

  @override
  List<Object> get props => [yaumi];
}

class DeleteYaumi extends YaumiEvent {
  final Yaumi yaumi;
  const DeleteYaumi({required this.yaumi});

  @override
  List<Object> get props => [yaumi];
}
