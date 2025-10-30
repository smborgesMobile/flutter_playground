import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/features/tasks/bloc/bloc/tasks_bloc.dart';
import 'package:flutter_playground/features/tasks/tasks_model.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksBloc()..add(LoadTasks()),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Minhas tarefas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<TasksBloc, TasksState>(
                  builder: (context, state) {
                    final items = state.task;
                    if (items.isEmpty) {
                      return const Center(child: Text('Nenhuma tarefa ainda.'));
                    }
                    return ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final t = items[index];
                        return ListTile(
                          key: ValueKey(t.title),
                          title: Text(t.title),
                          leading: IconButton(
                            icon: Icon(
                              t.isDone
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: t.isDone ? Colors.green : null,
                            ),
                            onPressed: () => context.read<TasksBloc>().add(
                              ToggleTaskCompleted(t.title),
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => context.read<TasksBloc>().add(
                              RemoveTask(t.title),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton.extended(
              label: const Text("Add"),
              icon: const Icon(Icons.add),
              foregroundColor: Colors.amberAccent,
              backgroundColor: Colors.black,
              onPressed: () {
                final random = Random();
                final id = random.nextInt(999999);
                final name = 'Task $id';
                context.read<TasksBloc>().add(AddTask(TasksModel(title: name)));
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Adicionada: $name')));
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}
