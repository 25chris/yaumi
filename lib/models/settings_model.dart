import 'package:equatable/equatable.dart';

class SettingsModel extends Equatable {
  bool? fardhu;
  bool? tahajud;
  bool? rawatib;
  bool? dhuha;
  bool? tilawah;
  bool? shaum;
  bool? dzikir;
  bool? taklim;
  bool? istighfar;
  bool? shalawat;
  SettingsModel({
    this.fardhu,
    this.tahajud,
    this.rawatib,
    this.dhuha,
    this.tilawah,
    this.shaum,
    this.dzikir,
    this.taklim,
    this.istighfar,
    this.shalawat,
  }) {
    fardhu = fardhu ?? false;
    tahajud = tahajud ?? false;
    rawatib = rawatib ?? false;
    dhuha = dhuha ?? false;
    tilawah = tilawah ?? false;
    shaum = shaum ?? false;
    dzikir = dzikir ?? false;
    taklim = taklim ?? false;
    istighfar = istighfar ?? false;
    shalawat = shalawat ?? false;
  }

  SettingsModel copyWith({
    bool? fardhu,
    bool? tahajud,
    bool? rawatib,
    bool? dhuha,
    bool? tilawah,
    bool? shaum,
    bool? dzikir,
    bool? taklim,
    bool? istighfar,
    bool? shalawat,
  }) {
    return SettingsModel(
      fardhu: fardhu ?? this.fardhu,
      tahajud: tahajud ?? this.tahajud,
      rawatib: rawatib ?? this.rawatib,
      dhuha: dhuha ?? this.dhuha,
      tilawah: tilawah ?? this.tilawah,
      shaum: shaum ?? this.shaum,
      dzikir: dzikir ?? this.dzikir,
      taklim: taklim ?? this.taklim,
      istighfar: istighfar ?? this.istighfar,
      shalawat: shalawat ?? this.shalawat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fardhu': fardhu,
      'tahajud': tahajud,
      'rawatib': rawatib,
      'dhuha': dhuha,
      'tilawah': tilawah,
      'shaum': shaum,
      'dzikir': dzikir,
      'taklim': taklim,
      'istighfar': istighfar,
      'shalawat': shalawat,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      fardhu: map['fardhu'] != null ? map['fardhu'] as bool : null,
      tahajud: map['tahajud'] != null ? map['tahajud'] as bool : null,
      rawatib: map['rawatib'] != null ? map['rawatib'] as bool : null,
      dhuha: map['dhuha'] != null ? map['dhuha'] as bool : null,
      tilawah: map['tilawah'] != null ? map['tilawah'] as bool : null,
      shaum: map['shaum'] != null ? map['shaum'] as bool : null,
      dzikir: map['dzikir'] != null ? map['dzikir'] as bool : null,
      taklim: map['taklim'] != null ? map['taklim'] as bool : null,
      istighfar: map['istighfar'] != null ? map['istighfar'] as bool : null,
      shalawat: map['shalawat'] != null ? map['shalawat'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        fardhu,
        tahajud,
        rawatib,
        dhuha,
        tilawah,
        shaum,
        dzikir,
        taklim,
        istighfar,
        shalawat,
      ];
}
