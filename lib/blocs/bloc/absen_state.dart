part of 'absen_bloc.dart';

class AbsenState extends Equatable {
  final List<Absen> allAbsen;
  const AbsenState({
    this.allAbsen = const <Absen>[],
  });

  @override
  List<Object> get props => [allAbsen];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allAbsen': allAbsen.map((x) => x.toMap()).toList(),
    };
  }

  factory AbsenState.fromMap(Map<String, dynamic> map) {
    return AbsenState(
      allAbsen:
          List<Absen>.from((map['allAbsen']?.map((x) => Absen.fromMap(x)))),
    );
  }
}
