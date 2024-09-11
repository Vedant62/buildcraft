import 'package:flutter/material.dart';

class NewProjectForm extends StatefulWidget {
  const NewProjectForm({super.key});

  @override
  State<NewProjectForm> createState() => _NewProjectFormState();
}

class _NewProjectFormState extends State<NewProjectForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController =  TextEditingController();
  final TextEditingController _descController =  TextEditingController();
  DateTimeRange _selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.utc(2026));
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _titleController,
              keyboardType: TextInputType.name,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 17),
              decoration: const InputDecoration(
                  label: Text('Title'),
                  labelStyle: TextStyle(fontWeight: FontWeight.w300)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter the title of your project';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _descController,
              keyboardType: TextInputType.text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 17),
              decoration: const InputDecoration(
                  label: Text('Description'),
                  labelStyle: TextStyle(fontWeight: FontWeight.w300)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Describe your project in short';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration: ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer),
                      onPressed: () async {
                        final DateTimeRange? dateTimeRange =
                            await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        );
                        if (dateTimeRange != null) {
                          setState(() {
                            _selectedDates = dateTimeRange;
                          });
                          print(_selectedDates.duration.inDays);
                        }
                      },
                      child: Text(
                        'Select Duration',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily check-in time:',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                    ),
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(

                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if(time!=null){
                        setState(() {
                          _selectedTime = time;
                        });
                      }
                      print('check in time: $time');
                    },
                    child: Text(
                      'Select time',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryFixedVariant,
              ),
              onPressed: () async {
                if(_formKey.currentState!.validate()){

                }
              },
              child: Text(
                'Create project',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
