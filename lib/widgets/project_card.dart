import 'package:buildcraft/utils/dateFormat.dart';
import 'package:buildcraft/utils/timeFormat.dart';
import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late final Project _project;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _project = widget.project;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(_project.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.arrow_forward_rounded),
                  )
                ],
              ),
              Text("Created at: ${formatDateClean(_project.createdAt)}"),
              Text("Daily check-in time: ${formatTimeOfDay(_project.checkInTime)}"),
              Text("ends on ${formatDateClean(_project.endDate)}"),
            ],
          ),
        ),
      ),
    );
  }
}
