import 'package:buildcraft/data/projects.dart';
import 'package:buildcraft/services/firestore.dart';
import 'package:buildcraft/widgets/project_card.dart';
import 'package:flutter/material.dart';

import '../../models/project.dart';

class Projects extends StatefulWidget {
  const Projects({super.key, required this.userId});

  final String userId;

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Project>>(
      stream: _firestoreService.getUserProjects(widget.userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("There's been some error"),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No projects found',
            ),
          );
        }

        final projects = snapshot.data;
        return ListView.builder(
          itemCount: projects!.length,
          itemBuilder: (BuildContext context, int index) {
            return ProjectCard(project: projects[index]);
          },
        );
      },
    );
  }
}
