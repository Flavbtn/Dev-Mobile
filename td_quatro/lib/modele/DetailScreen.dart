import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_dos/modele/todo.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
              Card(
                child: ListTile(title: Text(todo.title)),
              ),
              Card(
                child: ListTile(title: Text('${todo.id}')),
              ),
              Card(
                child: ListTile(title: Text('${todo.userId}')),
              ),
              Card(
                child: ListTile(title: Text('${todo.completed}')),
              )
          ],
        ),
      ),
    );
  }
}
