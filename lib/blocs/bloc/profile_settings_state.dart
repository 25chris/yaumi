// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_settings_bloc.dart';

class ProfileSettingsState extends Equatable {
  final String name;
  final String pictureLink;
  const ProfileSettingsState({required this.name, required this.pictureLink});

  @override
  List<Object> get props => [name, pictureLink];

  ProfileSettingsState copyWith({
    String? name,
    String? pictureLink,
  }) {
    return ProfileSettingsState(
      name: name ?? this.name,
      pictureLink: pictureLink ?? this.pictureLink,
    );
  }
}
