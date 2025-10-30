part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

final class LoadTasks extends TasksEvent {}

final class AddTask extends TasksEvent {
  final TasksModel task;
  const AddTask(this.task);

  @override
  List<Object> get props => [task];
}

final class RemoveTask extends TasksEvent {
  final String taskId;
  const RemoveTask(this.taskId);

  @override
  List<Object> get props => [taskId];
}

final class ToggleTaskCompleted extends TasksEvent {
  final String taskId;
  const ToggleTaskCompleted(this.taskId);

  @override
  List<Object> get props => [taskId];
}

final class UpdateTask extends TasksEvent {
  final TasksModel task;
  const UpdateTask(this.task);

  @override
  List<Object> get props => [task];
}
