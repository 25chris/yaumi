import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaumi/blocs/bloc/settings_event.dart';
import 'package:yaumi/blocs/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(fardhu: false, tahajud: false)) {
    _loadSettings();

    on<FardhuChanged>(_onFardhuChanged);

    on<TahajudChanged>(_onTahajudChanged);
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final fardhu = prefs.getBool('fardhu') ?? false;
    final tahajud = prefs.getBool('tahajud') ?? false;
    emit(SettingsState(fardhu: fardhu, tahajud: tahajud));
  }

  Future<void> _onFardhuChanged(
      FardhuChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fardhu', event.value);
    emit(state.copyWith(fardhu: event.value));
  }

  Future<void> _onTahajudChanged(
      TahajudChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tahajud', event.value);
    emit(state.copyWith(tahajud: event.value));
  }
}
