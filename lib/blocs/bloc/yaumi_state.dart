part of 'yaumi_bloc.dart';

class YaumiState extends Equatable {
  final List<Yaumi> allYaumis;
  const YaumiState({
    this.allYaumis = const <Yaumi>[],
  });

  @override
  List<Object> get props => [allYaumis];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allYaumis': allYaumis.map((x) => x.toMap()).toList(),
    };
  }

  factory YaumiState.fromMap(Map<String, dynamic> map) {
    return YaumiState(
      allYaumis: List<Yaumi>.from(
        (map['allYaumis']?.map((x) => Yaumi.fromMap(x))),
      ),
    );
  }
}
