import 'dart:math';

import 'package:crudtodo/addTaskDialog.dart';
import 'package:crudtodo/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await showDialog<String>(
            context: context,
            builder: (context) {
              return AddTaskDialog();
            },
          );

          if (newTask != null && newTask.isNotEmpty) {
            ref.read(taskProvider.notifier).add(newTask);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: tasks
              .map(
                (task) => Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                    title: Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        ref.read(taskProvider.notifier).remove(task);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () async {
                      final updatedTask = await showDialog<String>(
                        context: context,
                        builder: (context) {
                          return UpdateTaskDialog(task: task);
                        },
                      );

                      if (updatedTask != null && updatedTask.isNotEmpty) {
                        ref
                            .read(taskProvider.notifier)
                            .update(task, updatedTask);
                      }
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
