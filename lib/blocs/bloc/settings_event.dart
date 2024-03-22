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

class RawatibChanged extends SettingsEvent {
  final bool value;

  const RawatibChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class DhuhaChanged extends SettingsEvent {
  final bool value;

  const DhuhaChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class TilawahChanged extends SettingsEvent {
  final bool value;

  const TilawahChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class ShaumChanged extends SettingsEvent {
  final bool value;

  const ShaumChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class SedekahChanged extends SettingsEvent {
  final bool value;

  const SedekahChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class DzikirChanged extends SettingsEvent {
  final bool value;

  const DzikirChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class TaklimChanged extends SettingsEvent {
  final bool value;

  const TaklimChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class IstighfarChanged extends SettingsEvent {
  final bool value;

  const IstighfarChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class ShalawatChanged extends SettingsEvent {
  final bool value;

  const ShalawatChanged({required this.value});

  @override
  List<Object> get props => [value];
}
