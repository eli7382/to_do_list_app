import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const TodoListTile({Key? key, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

