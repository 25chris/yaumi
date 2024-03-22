import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool fardhu;
  final bool tahajud;

  const SettingsState({required this.fardhu, required this.tahajud});

  @override
  List<Object> get props => [fardhu, tahajud];

  SettingsState copyWith({bool? fardhu, bool? tahajud}) {
    return SettingsState(
      fardhu: fardhu ?? this.fardhu,
      tahajud: tahajud ?? this.tahajud,
    );
  }
}
