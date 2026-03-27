import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:td_dos/modele/task.dart';

import 'TaskViewModel.dart';

// Define a custom Form widget.
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  AddTaskState createState() {
    return AddTaskState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddTaskState extends State<AddTask> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormBuilderState>();
  final _enoncekey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold (appBar: AppBar(
      title: Text('Add Task'),
    ),
      body: FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            key: _enoncekey,
            name: 'Enoncé de la tache',
            decoration: const InputDecoration(labelText: 'Enonce'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              context.read<TaskViewModel>().addTask(Task.newTaskTitle(_enoncekey.currentState?.value));
              Navigator.pop(context);
            },
            child: const Text('New Task'),
          )
        ],
      ),
    ),
    );

  }
}
