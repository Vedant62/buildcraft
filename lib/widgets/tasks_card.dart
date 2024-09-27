import 'package:buildcraft/models/task.dart';
import 'package:buildcraft/services/firestore.dart';
import 'package:buildcraft/widgets/tasks.dart';
import 'package:flutter/material.dart';

class TasksCard extends StatefulWidget {
  const TasksCard({super.key, required this.projectId});

  final String projectId;

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  FirestoreService firestoreService = FirestoreService();
  TextEditingController taskTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.35,
        width: MediaQuery.sizeOf(context).width * 0.95,
        child: Column(
          children: [
            Expanded(child: Tasks(projectId: widget.projectId)),
            OutlinedButton.icon(
              // color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                openDialog(context, taskTitle, firestoreService, widget.projectId);
              },
              icon: Icon(Icons.add),
              style: ElevatedButton.styleFrom(elevation: 5),
              label: Text('Add task'),
            )
          ],
        ),
      ),
    );
  }
}

Future openDialog(BuildContext context, TextEditingController taskTitle, FirestoreService firestoreService, String projectId) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          'New task',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w300),
        ),
        actions: [
          OutlinedButton(
            iconAlignment: IconAlignment.end,
            onPressed: () {
              firestoreService.createTask(Task(title: taskTitle.text, projectId: projectId, createdAt: DateTime.now()));
            },
            child: Text('Save', style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300, fontSize: 14),)
          )
        ],
        content: TextField(
          decoration: InputDecoration(
            hintText: "e.g. Review today's code",
            hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
          ),
          controller: taskTitle,
        ),
      ),
    );
