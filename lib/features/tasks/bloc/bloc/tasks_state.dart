part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  final List<TasksModel> task;
  const TasksState(this.task);
  
  @override
  List<Object> get props => [task];
}

final class TasksInitial extends TasksState {
  const TasksInitial(super.task);
}
