import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_dos/modele/task.dart';

import 'TaskViewModel.dart';

class AccueilPage extends StatelessWidget {
  AccueilPage({super.key});
  late List<Task> tasks;
  String tags='';
  @override
  Widget build(BuildContext context) {
    tasks = context.watch<TaskViewModel>().liste;
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: Text(tasks[index].title)),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}