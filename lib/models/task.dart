class Task {
  final String id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  bool completed;
  final int priority;
  final String? notes;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.completed = false,
    this.priority = 0,
    this.notes,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      completed: json['completed'] as bool? ?? false,
      priority: json['priority'] as int? ?? 0,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'dueDate': dueDate?.toIso8601String(),
        'completed': completed,
        'priority': priority,
        'notes': notes,
      };
}
