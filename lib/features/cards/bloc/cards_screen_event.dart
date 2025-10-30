part of 'cards_screen_bloc.dart';

sealed class CardsScreenEvent extends Equatable {
  const CardsScreenEvent();

  @override
  List<Object?> get props => [];
}

class CardsScreenRequested extends CardsScreenEvent {
  const CardsScreenRequested();
}
