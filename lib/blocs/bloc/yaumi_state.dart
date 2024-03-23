part of 'yaumi_bloc.dart';

class YaumiState extends Equatable {
  final List<Yaumi> allYaumis;
  const YaumiState({
    this.allYaumis = const <Yaumi>[],
  });

  @override
  List<Object> get props => [allYaumis];
}
