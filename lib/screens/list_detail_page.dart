import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/add_edit_dialogs.dart';

class ListDetailPage extends StatefulWidget {
  final String listName;
  final List<Task> initialTasks;

  const ListDetailPage({Key? key, required this.listName, this.initialTasks = const []})
      : super(key: key);

  @override
  State<ListDetailPage> createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = List.from(widget.initialTasks);
  }

  Future<void> _addTask() async {
    final title = await showAddDialog(context);
    if (title != null && title.trim().isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: title.trim()));
      });
    }
  }

  Future<void> _editTask(int index) async {
    final task = _tasks[index];
    final newTitle = await showEditDialog(context, task.title);
    if (newTitle != null && newTitle.trim().isNotEmpty) {
      setState(() {
        _tasks[index] = Task(title: newTitle.trim(), completed: task.completed);
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleComplete(int index, bool? value) {
    setState(() {
      _tasks[index].completed = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.listName)),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            leading: Checkbox(
              value: task.completed,
              onChanged: (value) => _toggleComplete(index, value),
            ),
            title: Text(
              task.title,
              style: task.completed
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editTask(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteTask(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}

