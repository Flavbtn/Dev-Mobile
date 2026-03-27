import 'dart:convert';

class Todo {
  int id;
  int userId;
  String title;
  bool completed;

  Todo({required this.id,required this.userId,required this.title,required
  this.completed});
  static List<Todo> generateTodo(int i){
    List<Todo> todos=[];
    for(int n=0;n<i;n++){
      todos.add(Todo(id: n, userId: n, title: "title $n",  completed: false));
    }
    return todos;
  }

  static Todo fromJson(Map<String, dynamic> json){
    return Todo(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        completed: json['completed'],
        );
  }

  Map<String, dynamic> toJson(){
    return {'id':id, 'userId':userId, 'title':title, 'completed':completed};
  }

}