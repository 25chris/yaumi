part of 'profile_settings_bloc.dart';

sealed class ProfileSettingsEvent extends Equatable {
  const ProfileSettingsEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends ProfileSettingsEvent {
  final String value;

  const NameChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class PictureLinkChanged extends ProfileSettingsEvent {
  final String value;

  const PictureLinkChanged({required this.value});

  @override
  List<Object> get props => [value];
}
