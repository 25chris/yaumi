import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaumi/blocs/bloc/settings_event.dart';
import 'package:yaumi/blocs/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(const SettingsState(
            fardhu: false,
            tahajud: false,
            rawatib: false,
            dhuha: false,
            tilawah: false,
            shaum: false,
            sedekah: false,
            dzikir: false,
            taklim: false,
            istighfar: false,
            shalawat: false)) {
    _loadSettings();

    on<FardhuChanged>(_onFardhuChanged);
    on<TahajudChanged>(_onTahajudChanged);
    on<RawatibChanged>(_onRawatibChanged);
    on<DhuhaChanged>(_onDhuhaChanged);
    on<TilawahChanged>(_onTilawahChanged);
    on<ShaumChanged>(_onShaumChanged);
    on<SedekahChanged>(_onSedekahChanged);
    on<DzikirChanged>(_onDzikirChanged);
    on<TaklimChanged>(_onTaklimChanged);
    on<IstighfarChanged>(_onIstighfarChanged);
    on<ShalawatChanged>(_onShalawatChanged);
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final fardhu = prefs.getBool('fardhu') ?? false;
    final tahajud = prefs.getBool('tahajud') ?? false;
    final rawatib = prefs.getBool('rawatib') ?? false;
    final dhuha = prefs.getBool('dhuha') ?? false;
    final tilawah = prefs.getBool('tilawah') ?? false;
    final shaum = prefs.getBool('shaum') ?? false;
    final sedekah = prefs.getBool('sedekah') ?? false;
    final dzikir = prefs.getBool('dzikir') ?? false;
    final taklim = prefs.getBool('taklim') ?? false;
    final istighfar = prefs.getBool('istighfar') ?? false;
    final shalawat = prefs.getBool('shalawat') ?? false;
    emit(SettingsState(
        fardhu: fardhu,
        tahajud: tahajud,
        rawatib: rawatib,
        dhuha: dhuha,
        tilawah: tilawah,
        shaum: shaum,
        sedekah: sedekah,
        dzikir: dzikir,
        taklim: taklim,
        istighfar: istighfar,
        shalawat: shalawat));
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

  Future<void> _onRawatibChanged(
      RawatibChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rawatib', event.value);
    emit(state.copyWith(rawatib: event.value));
  }

  Future<void> _onDhuhaChanged(
      DhuhaChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dhuha', event.value);
    emit(state.copyWith(dhuha: event.value));
  }

  Future<void> _onTilawahChanged(
      TilawahChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tilawah', event.value);
    emit(state.copyWith(tilawah: event.value));
  }

  Future<void> _onShaumChanged(
      ShaumChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shaum', event.value);
    emit(state.copyWith(shaum: event.value));
  }

  Future<void> _onSedekahChanged(
      SedekahChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sedekah', event.value);
    emit(state.copyWith(sedekah: event.value));
  }

  Future<void> _onDzikirChanged(
      DzikirChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dzikir', event.value);
    emit(state.copyWith(dzikir: event.value));
  }

  Future<void> _onTaklimChanged(
      TaklimChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('taklim', event.value);
    emit(state.copyWith(taklim: event.value));
  }

  Future<void> _onIstighfarChanged(
      IstighfarChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('istighfar', event.value);
    emit(state.copyWith(istighfar: event.value));
  }

  Future<void> _onShalawatChanged(
      ShalawatChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shalawat', event.value);
    emit(state.copyWith(shalawat: event.value));
  }
}
