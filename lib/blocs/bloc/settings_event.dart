import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class FardhuChanged extends SettingsEvent {
  final bool value;

  const FardhuChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class TahajudChanged extends SettingsEvent {
  final bool value;

  const TahajudChanged({required this.value});

  @override
  List<Object> get props => [value];
}
