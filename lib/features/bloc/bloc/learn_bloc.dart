import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/features/bloc/bloc/learn_bloc_event.dart';
import 'package:flutter_playground/features/bloc/bloc/learn_bloc_state.dart';

class LearnBloc extends Bloc<LearnBlocEvent, LearnBlocState> {

  LearnBloc(): super(LearnBlocState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(
        LearnBlocState(state.counter + 1),
      );
    });
  }
}
