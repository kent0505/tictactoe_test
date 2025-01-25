import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tennis_event.dart';
part 'tennis_state.dart';

class TennisBloc extends Bloc<TennisEvent, TennisState> {
  TennisBloc() : super(TennisInitial()) {
    on<LoadTennis>((event, emit) async {
      emit(TennisLoading());

      await Future.delayed(
        Duration(seconds: 2),
        () {
          emit(TennisLoaded());
        },
      );
    });
  }
}
