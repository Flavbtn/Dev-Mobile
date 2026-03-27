import 'package:flutter/material.dart';
import 'package:td_dos/UI/MyApi.dart';
import '../modele/task.dart';

class RecherchePage extends StatelessWidget {
  const RecherchePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myAPI = MyAPI();

    return FutureBuilder<List<Task>>(
      future: myAPI.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${task.difficulty}')),
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: Text('${task.nbhours}h'),
              );
            },
          );
        }
        return const Center(child: Text('Aucune tâche trouvée.'));
      },
    );
  }
}