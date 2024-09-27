import 'package:buildcraft/widgets/tasks.dart';
import 'package:flutter/material.dart';

class TasksCard extends StatefulWidget {
  const TasksCard({super.key, required this.projectId});

  final String projectId;

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Container(
        height: MediaQuery.sizeOf(context).height*0.35,
        width: MediaQuery.sizeOf(context).width*0.95,
        child: Tasks(projectId: widget.projectId),
      ),
    );
  }
}
