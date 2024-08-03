import 'package:buildcraft/pages/forms/new_project.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Project'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/drone_fly.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('What are you planning to work on?', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w300),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NewProjectForm(),
            )
        
          ],
        ),
      )
    );
  }
}
