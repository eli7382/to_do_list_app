import 'package:flutter/material.dart';

class ListDetailPage extends StatelessWidget {
  final String listName;

  const ListDetailPage({Key? key, required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(listName)),
      body: const Center(child: Text('List Details')),
    );
  }
}

