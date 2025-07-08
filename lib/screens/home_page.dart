import 'package:flutter/material.dart';

import '../models/todo_list.dart';
import '../widgets/add_edit_dialogs.dart';
import 'list_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoList> _lists = [];

  Future<void> _addList() async {
    final name = await showAddDialog(context);
    if (name != null && name.trim().isNotEmpty) {
      setState(() {
        _lists.add(TodoList(name: name.trim()));
      });
    }
  }

  Future<void> _renameList(int index) async {
    final controller = TextEditingController(text: _lists[index].name);
    final newName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rename List'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Rename'),
          ),
        ],
      ),
    );

    if (newName != null && newName.trim().isNotEmpty) {
      setState(() {
        _lists[index] =
            TodoList(name: newName.trim(), tasks: _lists[index].tasks);
      });
    }
  }

  void _deleteList(int index) {
    setState(() {
      _lists.removeAt(index);
    });
  }

  void _openList(TodoList list) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ListDetailPage(listName: list.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To Do Lists')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addList,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _lists.length,
        itemBuilder: (context, index) {
          final list = _lists[index];
          return ListTile(
            title: Text(list.name),
            onTap: () => _openList(list),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _renameList(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteList(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

