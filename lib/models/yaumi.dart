import 'package:equatable/equatable.dart';

enum ShaumSunnah {
  tidakShaum,
  shaumKafarat,
  shaumNazar,
  shaumQadha,
  shaumDaud,
  shaumSeninKamis,
  shaumAyyamulBidh,
  shaumSyawal,
  shaumArafah,
  shaumAsyura,
  shaumTasuA,
  shaumSyaBan,
  shaumBulanHaram,
  shaumRamadhan;

  String get name {
    switch (this) {
      case ShaumSunnah.tidakShaum:
        return "tidak Shaum";
      case ShaumSunnah.shaumKafarat:
        return "Shaum Kafarat";
      case ShaumSunnah.shaumNazar:
        return "Shaum Nazar";
      case ShaumSunnah.shaumQadha:
        return "Shaum Qadha";
      case ShaumSunnah.shaumDaud:
        return "Shaum Daud";
      case ShaumSunnah.shaumSeninKamis:
        return "Shaum SeninKamis";
      case ShaumSunnah.shaumAyyamulBidh:
        return "Shaum AyyamulBidh";
      case ShaumSunnah.shaumSyawal:
        return "Shaum Syawal";
      case ShaumSunnah.shaumArafah:
        return "Shaum Arafah";
      case ShaumSunnah.shaumAsyura:
        return "Shaum Asyura";
      case ShaumSunnah.shaumTasuA:
        return "Shaum TasuA";
      case ShaumSunnah.shaumSyaBan:
        return "Shaum SyaBan";
      case ShaumSunnah.shaumBulanHaram:
        return "Shaum BulanHaram";
      case ShaumSunnah.shaumRamadhan:
        return "Shaum Ramadhan";
      default:
        return "Tidak Shaum";
    }
  }

  static ShaumSunnah fromName(String name) {
    for (ShaumSunnah value in ShaumSunnah.values) {
      if (value.name == name) {
        return value;
      }
    }
    throw ArgumentError('No matching ShaumSunnah for name $name');
  }
}

enum Taklim {
  tidakTaklim,
  tausiyahJumat,
  mqPagi,
  kultumApelPagi,
  marifatullah,
  bacaBuku,
  taklimOnline;

  String get name {
    switch (this) {
      case Taklim.tidakTaklim:
        return "Tidak Taklim";
      case Taklim.tausiyahJumat:
        return "Taushiyah Jum'at";
      case Taklim.mqPagi:
        return "MQ Pagi";
      case Taklim.kultumApelPagi:
        return "Kultum Apel Pagi";
      case Taklim.marifatullah:
        return "Ma'rifatullah";
      case Taklim.bacaBuku:
        return "Baca Buku";
      case Taklim.taklimOnline:
        return "Taklim Online";
      default:
        return "Tidak Taklim";
    }
  }

  static Taklim fromName(String name) {
    for (Taklim value in Taklim.values) {
      if (value.name == name) {
        return value;
      }
    }
    throw ArgumentError('No matching Taklim for name $name');
  }
}

class Yaumi extends Equatable {
  final DateTime date;
  final bool shubuh;
  final bool dhuhur;
  final bool ashar;
  final bool maghrib;
  final bool isya;
  final int tahajud;
  final int dhuha;
  final bool qshubuh;
  final bool qdhuhur;
  final bool bdhuhur;
  final bool bmaghrib;
  final bool bisya;
  final int tilawah;
  final double poin;
  final ShaumSunnah shaumSunnah;
  final bool sedekah;
  final bool dzikirPagi;
  final bool dzikirPetang;
  final Taklim taklim;
  final bool istighfar;
  final bool shalawat;

  const Yaumi({
    required this.date,
    required this.shubuh,
    required this.dhuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.tahajud,
    required this.dhuha,
    required this.qshubuh,
    required this.qdhuhur,
    required this.bdhuhur,
    required this.bmaghrib,
    required this.bisya,
    required this.tilawah,
    required this.poin,
    required this.shaumSunnah,
    required this.sedekah,
    required this.dzikirPagi,
    required this.dzikirPetang,
    required this.taklim,
    required this.istighfar,
    required this.shalawat,
  });

  Yaumi copyWith({
    DateTime? date,
    bool? shubuh,
    bool? dhuhur,
    bool? ashar,
    bool? maghrib,
    bool? isya,
    int? tahajud,
    int? dhuha,
    bool? qshubuh,
    bool? qdhuhur,
    bool? bdhuhur,
    bool? bmaghrib,
    bool? bisya,
    int? tilawah,
    double? poin,
    ShaumSunnah? shaumSunnah,
    bool? sedekah,
    bool? dzikirPagi,
    bool? dzikirPetang,
    Taklim? taklim,
    bool? istighfar,
    bool? shalawat,
  }) {
    return Yaumi(
      date: date ?? this.date,
      shubuh: shubuh ?? this.shubuh,
      dhuhur: dhuhur ?? this.dhuhur,
      ashar: ashar ?? this.ashar,
      maghrib: maghrib ?? this.maghrib,
      isya: isya ?? this.isya,
      tahajud: tahajud ?? this.tahajud,
      dhuha: dhuha ?? this.dhuha,
      qshubuh: qshubuh ?? this.qshubuh,
      qdhuhur: qdhuhur ?? this.qdhuhur,
      bdhuhur: bdhuhur ?? this.bdhuhur,
      bmaghrib: bmaghrib ?? this.bmaghrib,
      bisya: bisya ?? this.bisya,
      tilawah: tilawah ?? this.tilawah,
      poin: poin ?? this.poin,
      shaumSunnah: shaumSunnah ?? this.shaumSunnah,
      sedekah: sedekah ?? this.sedekah,
      dzikirPagi: dzikirPagi ?? this.dzikirPagi,
      dzikirPetang: dzikirPetang ?? this.dzikirPetang,
      taklim: taklim ?? this.taklim,
      istighfar: istighfar ?? this.istighfar,
      shalawat: shalawat ?? this.shalawat,
    );
  }

  @override
  List<Object?> get props => [
        date,
        shubuh,
        dhuhur,
        ashar,
        maghrib,
        isya,
        tahajud,
        dhuha,
        qshubuh,
        qdhuhur,
        bdhuhur,
        bmaghrib,
        bisya,
        tilawah,
        poin,
        shaumSunnah,
        sedekah,
        dzikirPagi,
        dzikirPetang,
        taklim,
        istighfar,
        shalawat,
      ];

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'shubuh': shubuh,
      'dhuhur': dhuhur,
      'ashar': ashar,
      'maghrib': maghrib,
      'isya': isya,
      'tahajud': tahajud,
      'dhuha': dhuha,
      'qshubuh': qshubuh,
      'qdhuhur': qdhuhur,
      'bdhuhur': bdhuhur,
      'bmaghrib': bmaghrib,
      'bisya': bisya,
      'tilawah': tilawah,
      'poin': poin,
      'shaumSunnah': shaumSunnah.name,
      'sedekah': sedekah,
      'dzikirPagi': dzikirPagi,
      'dzikirPetang': dzikirPetang,
      'taklim': taklim.name,
      'istighfar': istighfar,
      'shalawat': shalawat,
    };
  }

  factory Yaumi.fromMap(Map<String, dynamic> map) {
    return Yaumi(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      shubuh: map['shubuh'],
      dhuhur: map['dhuhur'],
      ashar: map['ashar'],
      maghrib: map['maghrib'],
      isya: map['isya'],
      tahajud: map['tahajud'],
      dhuha: map['dhuha'],
      qshubuh: map['qshubuh'],
      qdhuhur: map['qdhuhur'],
      bdhuhur: map['bdhuhur'],
      bmaghrib: map['bmaghrib'],
      bisya: map['bisya'],
      tilawah: map['tilawah'],
      poin: map['poin'],
      shaumSunnah: ShaumSunnah.fromName(map['shaumSunnah']),
      sedekah: map['sedekah'],
      dzikirPagi: map['dzikirPagi'],
      dzikirPetang: map['dzikirPetang'],
      taklim: Taklim.fromName(map['taklim']),
      istighfar: map['istighfar'],
      shalawat: map['shalawat'],
    );
  }
}
