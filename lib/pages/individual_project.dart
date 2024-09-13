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
      appBar: AppBar(
        title: Text(_project.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(

              child: DropdownButton<String>(

                borderRadius: BorderRadius.circular(8),
                icon: const Icon(Icons.settings_rounded),
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    onTap: (){print('lmao');},
                    value: 'edit',
                    child: Text(
                      'Edit',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    onTap: (){print('lmao2');},
                    value: 'delete',
                    child: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
                onChanged: (String? value) {
                  // Handle the selected option here
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
