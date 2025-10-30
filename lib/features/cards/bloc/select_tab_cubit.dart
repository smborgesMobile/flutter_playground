import 'package:bloc/bloc.dart';

class SelectedTabCubit extends Cubit<int> {
  SelectedTabCubit() : super(0);
  void select(int index) => emit(index);
}
