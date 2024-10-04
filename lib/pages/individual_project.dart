import 'package:buildcraft/pages/add_update_page.dart';
import 'package:buildcraft/widgets/tasks_card.dart';
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
                    onTap: () {
                      print('lmao');
                    },
                    value: 'edit',
                    child: Text(
                      'Edit',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    onTap: () {
                      print('lmao2');
                    },
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _project.description,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'checklist',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                  child: TasksCard(
                projectId: _project.id!,
              )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                  child: Container(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'updates',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddUpdatePage(project: _project,)));
                      },
                      child: Text('Add update', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w300) ,),
                    ),
                  ),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
