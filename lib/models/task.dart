class Task {
  final String title;
  final DateTime? dueDate;
  bool completed;

  Task({
    required this.title,
    this.dueDate,
    this.completed = false,
  });
}

