import 'package:flutter/material.dart';
import 'package:td_dos/UI/MyApi.dart';
import '../modele/todo.dart';
import 'DetailScreen.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myAPI = MyAPI();

    return FutureBuilder<List<Todo>>(
      future: myAPI.getTodo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final todos = snapshot.data!;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${todo.id}')),
                title: Text('${todo.userId}'),
                subtitle: Text(todo.title),
                trailing: Text('${todo.completed}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => DetailScreen(todo: todos[index]),
                    ),
                  );
                },
              );
            },
          );
        }
        return const Center(child: Text('Aucun todo trouvée.'));
      },
    );
  }
}