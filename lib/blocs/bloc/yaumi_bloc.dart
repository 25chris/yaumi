import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yaumi/models/yaumi.dart';

part 'yaumi_event.dart';
part 'yaumi_state.dart';

class YaumiBloc extends HydratedBloc<YaumiEvent, YaumiState> {
  YaumiBloc() : super(const YaumiState()) {
    on<AddYaumi>(_onAddYaumi);
    on<UpdateYaumi>(_onUpdateYaumi);
    on<DeleteYaumi>(_onDeleteYaumi);
  }

  void _onAddYaumi(AddYaumi event, Emitter<YaumiState> emit) {
    final state = this.state;
    emit(YaumiState(allYaumis: List.from(state.allYaumis)..add(event.yaumi)));
  }

  void _onUpdateYaumi(UpdateYaumi event, Emitter<YaumiState> emit) {
    final state = this.state;
    final updatedYaumis = state.allYaumis.map((yaumi) {
      return yaumi.date == event.yaumi.date ? event.yaumi : yaumi;
    }).toList();
    emit(YaumiState(allYaumis: updatedYaumis));
  }

  void _onDeleteYaumi(DeleteYaumi event, Emitter<YaumiState> emit) {}

  @override
  YaumiState? fromJson(Map<String, dynamic> json) {
    return YaumiState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(YaumiState state) {
    return state.toMap();
  }
}
