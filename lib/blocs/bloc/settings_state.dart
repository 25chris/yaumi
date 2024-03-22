// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool fardhu;
  final bool tahajud;
  final bool rawatib;
  final bool dhuha;
  final bool tilawah;
  final bool shaum;
  final bool sedekah;
  final bool dzikir;
  final bool taklim;
  final bool istighfar;
  final bool shalawat;

  const SettingsState({
    required this.fardhu,
    required this.tahajud,
    required this.rawatib,
    required this.dhuha,
    required this.tilawah,
    required this.shaum,
    required this.sedekah,
    required this.dzikir,
    required this.taklim,
    required this.istighfar,
    required this.shalawat,
  });

  @override
  List<Object> get props => [
        fardhu,
        tahajud,
        rawatib,
        dhuha,
        tilawah,
        shaum,
        sedekah,
        dzikir,
        taklim,
        istighfar,
        shalawat
      ];

  SettingsState copyWith({
    bool? fardhu,
    bool? tahajud,
    bool? rawatib,
    bool? dhuha,
    bool? tilawah,
    bool? shaum,
    bool? sedekah,
    bool? dzikir,
    bool? taklim,
    bool? istighfar,
    bool? shalawat,
  }) {
    return SettingsState(
      fardhu: fardhu ?? this.fardhu,
      tahajud: tahajud ?? this.tahajud,
      rawatib: rawatib ?? this.rawatib,
      dhuha: dhuha ?? this.dhuha,
      tilawah: tilawah ?? this.tilawah,
      shaum: shaum ?? this.shaum,
      sedekah: sedekah ?? this.sedekah,
      dzikir: dzikir ?? this.dzikir,
      taklim: taklim ?? this.taklim,
      istighfar: istighfar ?? this.istighfar,
      shalawat: shalawat ?? this.shalawat,
    );
  }
}
