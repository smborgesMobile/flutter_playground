import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playground/features/tasks/data/tasks_storage.dart';
import 'package:flutter_playground/features/tasks/tasks_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial(const <TasksModel>[])) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<RemoveTask>(_onRemoveTask);
    on<ToggleTaskCompleted>(_onToggleTaskCompleted);
    on<UpdateTask>(_onUpdateTask);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    final storage = await TasksStorage.create();
    final tasks = await storage.loadTasks();
    emit(TasksInitial(tasks));
  }

  Future<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final storage = await TasksStorage.create();
    final current = List<TasksModel>.from(state.task);
    current.add(event.task);
    await storage.saveTasks(current);
    emit(TasksInitial(List.unmodifiable(current)));
  }

  Future<void> _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) async {
    final storage = await TasksStorage.create();
    final updated = state.task.where((t) => t.title != event.taskId).toList(growable: false);
    await storage.saveTasks(updated);
    emit(TasksInitial(updated));
  }

  Future<void> _onToggleTaskCompleted(ToggleTaskCompleted event, Emitter<TasksState> emit) async {
    final storage = await TasksStorage.create();
    final updated = state.task.map((t) {
      if (t.title == event.taskId) {
        return t.copyWith(isDone: !t.isDone);
      }
      return t;
    }).toList(growable: false);
    await storage.saveTasks(updated);
    emit(TasksInitial(updated));
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) async {
    final storage = await TasksStorage.create();
    final updated = state.task.map((t) {
      if (t.title == event.task.title) {
        return event.task;
      }
      return t;
    }).toList(growable: false);
    await storage.saveTasks(updated);
    emit(TasksInitial(updated));
  }
}

