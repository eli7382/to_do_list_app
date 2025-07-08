import 'task.dart';

class TodoList {
  final String id;
  final String name;
  final List<Task> tasks;

  TodoList({required this.id, required this.name, this.tasks = const []});

  factory TodoList.fromJson(Map<String, dynamic> json) {
    return TodoList(
      id: json['id'] as String,
      name: json['name'] as String,
      tasks: json['tasks'] != null
          ? (json['tasks'] as List)
              .map((task) => Task(
                    title: task['title'] as String,
                    completed: task['completed'] ?? false,
                  ))
              .toList()
          : <Task>[],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tasks': tasks
            .map((task) => {'title': task.title, 'completed': task.completed})
            .toList(),
      };
}

