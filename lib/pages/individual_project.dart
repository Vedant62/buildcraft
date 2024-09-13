import 'package:flutter/material.dart';

import '../models/project.dart';

class IndividualProject extends StatefulWidget {
  const IndividualProject({super.key, required this.project});

  final Project project;

  @override
  State<IndividualProject> createState() => _IndividualProjectState();
}

class _IndividualProjectState extends State<IndividualProject> {
  late Project _project;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _project = widget.project;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_project.title),),
    );
  }
}
