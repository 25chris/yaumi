import 'package:equatable/equatable.dart';

/// Enum for different types of Sunnah fasting.
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
  shaumRamadhan,
}

enum Taklim {
  tidakTaklim,
  tausiyahJumat,
  mqPagi,
  kultumApelPagi,
  marifatullah,
  bacaBuku,
  taklimOnline
}

/// Represents daily activities tracking for prayers and additional religious practices.
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
  final int poin;
  final ShaumSunnah? shaumSunnah; // Optional field for type of Sunnah fasting
  final bool dzikirPagi;
  final bool dzikirPetang;
  final Taklim? taklim;
  final bool istighfar;
  final bool shalawat;

  const Yaumi(
      {required this.date,
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
      required this.dzikirPagi,
      required this.dzikirPetang,
      required this.taklim,
      required this.istighfar,
      required this.shalawat});

  Yaumi copyWith(
      {DateTime? date,
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
      int? poin,
      ShaumSunnah? shaumSunnah,
      bool? dzikirPagi,
      bool? dzikirPetang,
      Taklim? taklim,
      bool? istighfar,
      bool? shalawat}) {
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
        shaumSunnah: shaumSunnah ?? this.shaumSunnah, // Add to copyWith method
        dzikirPagi: dzikirPagi ?? this.dzikirPagi,
        dzikirPetang: dzikirPetang ?? this.dzikirPetang,
        taklim: taklim ?? this.taklim,
        istighfar: istighfar ?? this.istighfar,
        shalawat: shalawat ?? this.shalawat);
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
        shaumSunnah, // Add to props list for Equatable
        dzikirPagi,
        dzikirPetang,
        taklim,
        istighfar,
        shalawat
      ];
}
