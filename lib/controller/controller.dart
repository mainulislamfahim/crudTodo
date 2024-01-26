import 'package:crudtodo/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) => TaskNotifier(),
);

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([Task('Task 1')]);

  void add(String title) {
    state = [...state, Task(title)];
  }

  void remove(Task task) {
    state = [...state.where((element) => element != task)];
  }

  void update(Task task, String updateTitle) {
    final updateList = <Task>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == task) {
        updateList.add(Task(updateTitle));
      } else {
        updateList.add(state[i]);
      }
    }
    state = updateList;
  }
}
 
 