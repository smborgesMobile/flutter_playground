import 'package:flutter/material.dart';
import 'package:flutter_playground/features/course/bloc/bloc/bloc_imports.dart';

class UdemyCourse extends StatelessWidget {
  const UdemyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text("Counter value is : ${state.counterValue}");
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.read<CounterBloc>().add(
                      CounterDecrementEvent(),
                    ),
                    child: Text("- Decrement"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.read<CounterBloc>().add(
                      CounterIncrementEvent(),
                    ),
                    child: Text("+ Increment"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
