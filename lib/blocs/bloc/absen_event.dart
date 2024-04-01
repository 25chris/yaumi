part of 'absen_bloc.dart';

sealed class AbsenEvent extends Equatable {
  const AbsenEvent();

  @override
  List<Object> get props => [];
}

class AddAbsen extends AbsenEvent {
  final Absen absen;
  const AddAbsen({required this.absen});

  @override
  List<Object> get props => [absen];
}

class UpdateAbsen extends AbsenEvent {
  final Absen absen;
  const UpdateAbsen({required this.absen});

  @override
  List<Object> get props => [absen];
}

class DeleteAbsen extends AbsenEvent {
  final Absen absen;
  const DeleteAbsen({required this.absen});

  @override
  List<Object> get props => [absen];
}
