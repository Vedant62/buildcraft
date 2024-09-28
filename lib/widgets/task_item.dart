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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: _task.isCompleted,
            checkColor: Theme.of(context).colorScheme.primary,
            // checkColor: Colors.black38,
            activeColor: Theme.of(context).colorScheme.tertiaryContainer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            visualDensity: VisualDensity(horizontal: -3.5, vertical: -0.5),
            onChanged: (value) async {
              try {
                await firestoreService.toggleTaskCompletion(_task.id!);
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
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  decoration: _task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
          )
        ],
      ),
    );
  }
}
