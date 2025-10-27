import 'package:flutter/material.dart';
import 'package:flutter_playground/features/bloc/bloc_page.dart';
import 'package:flutter_playground/features/course/bloc/bloc/bloc_imports.dart';
import 'package:flutter_playground/features/course/udemy_course.dart';
import 'package:flutter_playground/features/home/home_page.dart';
import 'package:flutter_playground/features/tasks/tasks_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => HomePage(),
          "/bloc-router": (context) => BlocPage(),
          "/udemy-course": (context) => UdemyCourse(),
          "/tasks-page": (context) => TasksPage(),
        },
      ),
    );
  }
}
