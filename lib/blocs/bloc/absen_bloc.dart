import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yaumi/models/absen.dart';

part 'absen_event.dart';
part 'absen_state.dart';

class AbsenBloc extends Bloc<AbsenEvent, AbsenState> {
  AbsenBloc() : super(const AbsenState()) {
    on<AddAbsen>(_onAddAbsen);
    on<UpdateAbsen>(_onUpdateAbsen);
    on<DeleteAbsen>(_onDeleteAbsen);
  }

  void _onAddAbsen(AddAbsen event, Emitter<AbsenState> emit) {
    final state = this.state;
    emit(AbsenState(allAbsen: List.from(state.allAbsen)..add(event.absen)));
  }

  void _onUpdateAbsen(UpdateAbsen event, Emitter<AbsenState> emit) {
    final state = this.state;
    final updatedAbsen = state.allAbsen.map((absen) {
      return absen.date == event.absen.date ? event.absen : absen;
    }).toList();
    emit(AbsenState(allAbsen: updatedAbsen));
  }

  void _onDeleteAbsen(DeleteAbsen event, Emitter<AbsenState> emit) {}
}
