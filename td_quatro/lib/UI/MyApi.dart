import 'dart:convert';

import 'package:flutter/services.dart';

import '../modele/task.dart';
import '../modele/todo.dart';
import 'package:http/http.dart' as http;

class MyAPI{
  Future<List<Task>> getTasks() async{
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('data/tasks.json');
    final Map<String,dynamic> json = jsonDecode(dataString);
    if (json['tasks']!=null){
      final tasks = <Task>[];
      json['tasks'].forEach((element){
        tasks.add(Task.fromJson(element));
      });
      return tasks;
    }else{
      return [];
    }
  }
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
  Future<List<Todo>> getTodo() async{
    await Future.delayed(Duration(seconds: 1));
    final dataString = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));
    if (dataString.statusCode==200) {
      final List<dynamic> json = jsonDecode(dataString.body);
      final todos = <Todo>[];
      for(var element in json) {
        todos.add(Todo.fromJson(element));
      }
      return todos;
    }else{
      return [];
    }
  }
}