import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_settings_event.dart';
part 'profile_settings_state.dart';

class ProfileSettingsBloc
    extends Bloc<ProfileSettingsEvent, ProfileSettingsState> {
  ProfileSettingsBloc()
      : super(const ProfileSettingsState(name: '', pictureLink: '')) {
    _loadSettings();

    on<NameChanged>(_onNameChanged);
    on<PictureLinkChanged>(_onPictureLinkChanged);
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    final pictureLink = prefs.getString('pictureLink') ?? '';
    emit(ProfileSettingsState(name: name, pictureLink: pictureLink));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<ProfileSettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', event.value);
    emit(state.copyWith(name: event.value));
  }

  Future<void> _onPictureLinkChanged(
      PictureLinkChanged event, Emitter<ProfileSettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pictureLink', event.value);
    emit(state.copyWith(pictureLink: event.value));
  }
}
