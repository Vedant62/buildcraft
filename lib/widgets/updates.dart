import 'package:buildcraft/models/update.dart';
import 'package:buildcraft/services/firestore.dart';
import 'package:buildcraft/widgets/update_card.dart';
import 'package:flutter/material.dart';

import '../models/project.dart';

class Updates extends StatefulWidget {
  const Updates({super.key, required this.project});

  final Project project;

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  late FirestoreService firestoreService;
  late Project _project;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firestoreService = FirestoreService();
    _project = widget.project;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Update>>(
        stream: firestoreService.getUpdates(_project.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("There's been some error: ${snapshot.error}"),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No updates yet',

              ),
            );
          }
          final updates = snapshot.data;
          return ListView.builder(
            itemCount: updates!.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: UpdateCard(update: updates[index]),
              );
            },
          );
        });
  }
}
