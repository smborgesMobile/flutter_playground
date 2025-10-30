part of 'cards_screen_bloc.dart';

class CardsScreenState extends Equatable {
  final ScreenDefinition? definition;
  final bool isLoading;
  final String? error;

  const CardsScreenState({this.definition, this.isLoading = false, this.error});

  const CardsScreenState.initial() : this(definition: null, isLoading: false, error: null);
  const CardsScreenState.loading() : this(definition: null, isLoading: true, error: null);
  const CardsScreenState._loaded(ScreenDefinition def) : this(definition: def, isLoading: false, error: null);
  const CardsScreenState._failure(String message) : this(definition: null, isLoading: false, error: message);

  factory CardsScreenState.loaded(ScreenDefinition def) => CardsScreenState._loaded(def);
  factory CardsScreenState.failure(String message) => CardsScreenState._failure(message);

  @override
  List<Object?> get props => [definition, isLoading, error];
}
