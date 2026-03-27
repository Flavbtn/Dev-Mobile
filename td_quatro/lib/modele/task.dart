import 'dart:convert';

class Task {
  static int nb = 0;
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficulty,required this.description});
  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      tasks.add(Task(id: n, title: "title $n", tags: ['tag $n','tag ${n+1}'], nbhours: n, difficulty: n, description: '$n'));
      nb++;
    }
    return tasks;
  }

  static Task fromJson(Map<String, dynamic> json){
    final tags = <String>[];

    if (json['tags'] != null){
      json['tags'].forEach((t){
        tags.add(t);
      });
    }
    return Task(
        id: json['id'],
        title: json['title'],
        nbhours: json['nbhours'],
        difficulty: json['difficulty'],
        description: json['description'],
        tags: tags);
  }

  Map<String, dynamic> toJson(){
    return {'id':id, 'title':title, 'nbhours':nbhours, 'difficulty': difficulty, 'description':description, 'tags':tags};
  }

  factory Task.newTask(){
    Task task = Task(id: nb, title: 'title $nb', tags: ['tags $nb'], nbhours:
    nb, difficulty: nb%5, description: 'description $nb');
    nb++;
    return task;
  }

  factory Task.newTaskTitle(titre){
    Task task = Task(id: nb, title: titre, tags: ['tags $nb'], nbhours:
    nb, difficulty: nb%5, description: 'description $nb');
    nb++;
    return task;
  }

}