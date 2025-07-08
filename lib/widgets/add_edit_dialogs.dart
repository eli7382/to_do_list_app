import 'package:flutter/material.dart';
import '../models/task.dart';
import '../models/todo_list.dart';

/// Show a simple dialog that collects a single line of input.
Future<String?> showAddDialog(BuildContext context) {
  final controller = TextEditingController();
  return showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Add Item'),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text('Add'),
        ),
      ],
    ),
  );
}

/// Dialog for adding a new task.
Future<Task?> showAddTaskDialog(BuildContext context) {
  return showTaskDialog(context);
}

/// Dialog for editing an existing task.
Future<Task?> showEditTaskDialog(BuildContext context, Task task) {
  return showTaskDialog(context, task: task);
}

/// Internal helper that builds the task dialog UI.
Future<Task?> showTaskDialog(BuildContext context, {Task? task}) {
  final controller = TextEditingController(text: task?.title ?? '');
  bool completed = task?.completed ?? false;
  return showDialog<Task>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(task == null ? 'Add Task' : 'Edit Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            CheckboxListTile(
              title: const Text('Completed'),
              value: completed,
              onChanged: (value) => setState(() => completed = value ?? false),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final title = controller.text.trim();
              if (title.isNotEmpty) {
                Navigator.pop(context, Task(title: title, completed: completed));
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ),
  );
}

/// Dialog for adding a new to do list.
Future<TodoList?> showAddTodoListDialog(BuildContext context) {
  return showTodoListDialog(context);
}

/// Dialog for editing an existing to do list.
Future<TodoList?> showEditTodoListDialog(BuildContext context, TodoList list) {
  return showTodoListDialog(context, list: list);
}

/// Internal helper that builds the to do list dialog UI.
Future<TodoList?> showTodoListDialog(BuildContext context, {TodoList? list}) {
  final controller = TextEditingController(text: list?.name ?? '');
  return showDialog<TodoList>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(list == null ? 'Add List' : 'Edit List'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Name'),
      ),

Future<String?> showEditDialog(BuildContext context, String initial) {
  final controller = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Edit Item'),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final name = controller.text.trim();
            if (name.isNotEmpty) {
              Navigator.pop(
                context,
                TodoList(name: name, tasks: list?.tasks ?? const []),
              );
            }
          },
=======
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text('Save'),
        ),
      ],
    ),
  );
}

