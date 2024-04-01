import 'package:equatable/equatable.dart';

enum StatusKehadiran {
  alpha,
  wfo,
  ijin,
  sakit,
  wfh;

  String get name {
    switch (this) {
      case StatusKehadiran.alpha:
        return "Alpha";
      case StatusKehadiran.wfo:
        return "Work From Office (WFO)";
      case StatusKehadiran.ijin:
        return "Ijin";
      case StatusKehadiran.sakit:
        return "Sakit";
      case StatusKehadiran.wfh:
        return "Work From Home (WFH)";
      default:
        return "Alpha";
    }
  }

  static StatusKehadiran fromName(String name) {
    for (StatusKehadiran value in StatusKehadiran.values) {
      if (value.name == name) {
        return value;
      }
    }
    throw ArgumentError('No matching StatusKehadiran for name $name');
  }
}

class Absen extends Equatable {
  final DateTime date;
  final StatusKehadiran statusKehadiran;
  final String lokasi;
  final String jamMasuk;
  final String jamPulang;
  final String selfieMasuk;
  final String selfiePulang;
  final String alasanIjin;
  final String dokumenIjin;
  final String namaPenyakit;
  final String dokumenSakit;
  final String alasanWfh;
  final String dokumenWfh;
  Absen({
    required this.date,
    required this.statusKehadiran,
    required this.lokasi,
    required this.jamMasuk,
    required this.jamPulang,
    required this.selfieMasuk,
    required this.selfiePulang,
    required this.alasanIjin,
    required this.dokumenIjin,
    required this.namaPenyakit,
    required this.dokumenSakit,
    required this.alasanWfh,
    required this.dokumenWfh,
  });

  Absen copyWith({
    DateTime? date,
    StatusKehadiran? statusKehadiran,
    String? lokasi,
    String? jamMasuk,
    String? jamPulang,
    String? selfieMasuk,
    String? selfiePulang,
    String? alasanIjin,
    String? dokumenIjin,
    String? namaPenyakit,
    String? dokumenSakit,
    String? alasanWfh,
    String? dokumenWfh,
  }) {
    return Absen(
      date: date ?? this.date,
      statusKehadiran: statusKehadiran ?? this.statusKehadiran,
      lokasi: lokasi ?? this.lokasi,
      jamMasuk: jamMasuk ?? this.jamMasuk,
      jamPulang: jamPulang ?? this.jamPulang,
      selfieMasuk: selfieMasuk ?? this.selfieMasuk,
      selfiePulang: selfiePulang ?? this.selfiePulang,
      alasanIjin: alasanIjin ?? this.alasanIjin,
      dokumenIjin: dokumenIjin ?? this.dokumenIjin,
      namaPenyakit: namaPenyakit ?? this.namaPenyakit,
      dokumenSakit: dokumenSakit ?? this.dokumenSakit,
      alasanWfh: alasanWfh ?? this.alasanWfh,
      dokumenWfh: dokumenWfh ?? this.dokumenWfh,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        date,
        statusKehadiran,
        lokasi,
        jamMasuk,
        jamPulang,
        selfieMasuk,
        selfiePulang,
        alasanIjin,
        dokumenIjin,
        namaPenyakit,
        dokumenSakit,
        alasanWfh,
        dokumenWfh,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'statusKehadiran': statusKehadiran.name,
      'lokasi': lokasi,
      'jamMasuk': jamMasuk,
      'jamPulang': jamPulang,
      'selfieMasuk': selfieMasuk,
      'selfiePulang': selfiePulang,
      'alasanIjin': alasanIjin,
      'dokumenIjin': dokumenIjin,
      'namaPenyakit': namaPenyakit,
      'dokumenSakit': dokumenSakit,
      'alasanWfh': alasanWfh,
      'dokumenWfh': dokumenWfh,
    };
  }

  factory Absen.fromMap(Map<String, dynamic> map) {
    return Absen(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      statusKehadiran: StatusKehadiran.fromName(map['statusKehadiran']),
      lokasi: map['lokasi'],
      jamMasuk: map['jamMasuk'],
      jamPulang: map['jamPulang'],
      selfieMasuk: map['selfieMasuk'],
      selfiePulang: map['selfiePulang'],
      alasanIjin: map['alasanIjin'],
      dokumenIjin: map['dokumenIjin'],
      namaPenyakit: map['namaPenyakit'],
      dokumenSakit: map['dokumenSakit'],
      alasanWfh: map['alasanWfh'],
      dokumenWfh: map['dokumenWfh'],
    );
  }
}
