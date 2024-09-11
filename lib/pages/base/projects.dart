import 'package:buildcraft/data/projects.dart';
import 'package:buildcraft/widgets/project_card.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (BuildContext context, int index) {
      return ProjectCard(project: projects[index]);
    },);
  }
}
