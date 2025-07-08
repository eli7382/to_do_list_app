import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(const ToDoListApp());

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({Key? key}) : super(key: key);

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
