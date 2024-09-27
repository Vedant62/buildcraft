import 'package:buildcraft/services/firestore.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late Task _task;
  FirestoreService firestoreService = FirestoreService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _task = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _task.isCompleted,
          checkColor: Colors.black38,
          activeColor: Theme.of(context).colorScheme.primary,
          visualDensity: VisualDensity(horizontal: -3.5, vertical: -0.5),
          onChanged: (value) async {
            try {
              await firestoreService.toggleTaskCompletion(_task.id);
              setState(() {
                _task.isCompleted = !_task.isCompleted;
              });
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Failed to update task: ${e.toString()}')),
              );
            }
          },
        ),
        Text(
          _task.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
