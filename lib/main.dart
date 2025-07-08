import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(const ToDoListApp());

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To Do List',
      home: HomePage(),
    );
  }
}

