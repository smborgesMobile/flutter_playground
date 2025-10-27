part of 'counter_bloc.dart';

@immutable
class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}
