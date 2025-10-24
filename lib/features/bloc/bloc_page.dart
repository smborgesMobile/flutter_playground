import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/features/bloc/bloc/learn_bloc.dart';
import 'package:flutter_playground/features/bloc/bloc/learn_bloc_state.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              const Text('You have pushed the button this many times:'),
              BlocBuilder<LearnBloc, LearnBlocState>(
                builder: (context, state) {
                  return Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
