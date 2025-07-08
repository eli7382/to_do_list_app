import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?>? onChanged;

  const TaskTile({Key? key, required this.task, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dueText = task.dueDate != null
        ? DateFormat.yMMMd().format(task.dueDate!)
        : null;

    return CheckboxListTile(
      title: Text(task.title),
      subtitle: dueText != null ? Text('Due: $dueText') : null,
      value: task.completed,
      onChanged: onChanged,
    );
  }
}

