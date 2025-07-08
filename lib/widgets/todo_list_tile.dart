import 'package:flutter/material.dart';
import '../models/todo_list.dart';

/// A list tile that displays a [TodoList] with the number of incomplete tasks.
class TodoListTile extends StatelessWidget {
  /// The to do list to display.
  final TodoList todoList;

  /// Callback when the tile is tapped.
  final VoidCallback? onTap;

  const TodoListTile({Key? key, required this.todoList, this.onTap})
      : super(key: key);

  /// Returns the number of tasks in [todoList] that are not completed yet.
  int get _remainingTasks =>
      todoList.tasks.where((t) => !t.completed).length;

  @override
  Widget build(BuildContext context) {
    final remaining = _remainingTasks;
    final subtitle = '$remaining incomplete task${remaining == 1 ? '' : 's'}';

    return ListTile(
      title: Text(todoList.name),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

