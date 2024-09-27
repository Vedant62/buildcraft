import 'package:buildcraft/services/firestore.dart';
import 'package:buildcraft/widgets/task_item.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key, required this.projectId});

  final String projectId;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  FirestoreService firestoreService = FirestoreService();
  late String _projectId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _projectId = widget.projectId;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
      stream: firestoreService.getProjectTasks(_projectId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("There's been some error"),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No tasks found',
            ),
          );
        }

        final tasks = snapshot.data;
        return ListView.builder(
          itemCount: tasks!.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskItem(task: tasks[index]);
          },
        );
      },
    );
  }
}
