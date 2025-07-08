import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?>? onChanged;

  const TaskTile({Key? key, required this.task, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(task.title),
      value: task.completed,
      onChanged: onChanged,
    );
  }
}

