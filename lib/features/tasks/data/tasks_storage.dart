import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_playground/features/tasks/tasks_model.dart';

class TasksStorage {
  static const String _kTasksKey = 'tasks_list';

  final SharedPreferences _prefs;
  TasksStorage(this._prefs);

  static Future<TasksStorage> create() async {
    final prefs = await SharedPreferences.getInstance();
    return TasksStorage(prefs);
    }

  Future<List<TasksModel>> loadTasks() async {
    final stored = _prefs.getStringList(_kTasksKey) ?? const <String>[];
    return stored.map((s) => TasksModel.fromJson(s)).toList(growable: false);
  }

  Future<void> saveTasks(List<TasksModel> tasks) async {
    final data = tasks.map((t) => t.toJson()).toList(growable: false);
    await _prefs.setStringList(_kTasksKey, data);
  }

  Future<void> clear() async {
    await _prefs.remove(_kTasksKey);
  }
}
