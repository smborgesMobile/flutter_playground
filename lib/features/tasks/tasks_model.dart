import 'dart:convert';

import 'package:equatable/equatable.dart';

class TasksModel extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  TasksModel({
    required this.title,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TasksModel copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TasksModel(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TasksModel.fromMap(Map<String, dynamic> map) {
    return TasksModel(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  List<Object> get props => [title, isDone, isDeleted];

  String toJson() => json.encode(toMap());

  factory TasksModel.fromJson(String source) => TasksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
