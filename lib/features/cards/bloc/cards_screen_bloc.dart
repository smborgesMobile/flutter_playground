import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playground/features/cards/data/cards_screen_repository.dart';
import 'package:flutter_playground/features/cards/models/screen_definition.dart';

part 'cards_screen_event.dart';
part 'cards_screen_state.dart';

class CardsScreenBloc extends Bloc<CardsScreenEvent, CardsScreenState> {
  final CardsScreenRepository repository;
  CardsScreenBloc({required this.repository}) : super(const CardsScreenState.initial()) {
    on<CardsScreenRequested>(_onRequested);
  }

  Future<void> _onRequested(CardsScreenRequested event, Emitter<CardsScreenState> emit) async {
    emit(const CardsScreenState.loading());
    try {
      final def = await repository.fetchFromAssets();
      emit(CardsScreenState.loaded(def));
    } catch (e) {
      emit(CardsScreenState.failure(e.toString()));
    }
  }
}
