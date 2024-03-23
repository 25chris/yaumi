import 'package:equatable/equatable.dart';

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
  final int poin;

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
    required this.poin,
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
    int? poin,
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
      poin: poin ?? this.poin,
    );
  }

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
      'poin': poin,
    };
  }

  factory Yaumi.fromMap(Map<String, dynamic> map) {
    try {
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
        poin: map['poin'],
      );
    } catch (e) {
      throw FormatException('Error parsing Yaumi from Map: $e');
    }
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
        poin
      ];
}
