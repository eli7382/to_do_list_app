import 'task.dart';

class TodoList {
  final String name;
  final List<Task> tasks;

  TodoList({required this.name, this.tasks = const []});
}

