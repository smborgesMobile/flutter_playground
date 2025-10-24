import 'package:flutter/material.dart';
import 'package:flutter_playground/features/bloc/bloc_page.dart';
import 'package:flutter_playground/features/home/home_page.dart';
import 'package:flutter_playground/widget/playground_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/bloc-router": (context) => BlocPage(),
      },
    );
  }
}
