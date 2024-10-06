import 'dart:io';
import 'package:buildcraft/models/update.dart';
import 'package:buildcraft/services/firestore.dart';
import 'package:buildcraft/services/storage.dart';
import 'package:buildcraft/utils/timeFormat.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/project.dart';

class AddUpdatePage extends StatefulWidget {
  const AddUpdatePage({super.key, required this.project});

  final Project project;

  @override
  State<AddUpdatePage> createState() => _AddUpdatePageState();
}

class _AddUpdatePageState extends State<AddUpdatePage> {
  bool imageSelected = false;
  late StorageService storageService;
  late Project _project;
  late FirestoreService firestoreService;
  File? selectedImage;
  String? imageUrl;
  String _selectedStatus = 'On time';
  Map<String, Status> statusLookup = {
    'Behind': Status.late,
    'On time': Status.onTime,
    'Ahead': Status.ahead
  };
  Status? status;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storageService = StorageService();
    firestoreService = FirestoreService();
    _project = widget.project;
  }

  void pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    setState(() {
      selectedImage = File(image.path);

      // await storageService.uploadImage(selectedImage!, _project.id!);
    });
  }

  void saveAndUpload() async {
    imageUrl = await storageService.uploadImage(selectedImage!, _project.id!);
    print('uploaded the url: $imageUrl');
    status = statusLookup[_selectedStatus];
    final _update = Update(projectId: _project.id!, projectUpdateImageLink: imageUrl!, dateTime: DateTime.now(), status: status!);
    await firestoreService.addUpdate(_update);
    print('saved update to db');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              color: Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withOpacity(0.3),
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: selectedImage == null
                  ? Center(
                      child: TextButton(
                        onPressed: pickImage,
                        child: Text('Upload an image',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey.withOpacity(0.5))),
                      ),
                    )
                  : GestureDetector(
                      onTap: pickImage,
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Text(
                formatTimeOfDay(TimeOfDay.now()),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
            ),
            SegmentedButton(
                emptySelectionAllowed: true,
                segments:  <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: 'Behind',
                    label: Text('Behind', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.w300),),
                  ),
                  ButtonSegment<String>(
                    value: 'On time',
                    label: Text('On time', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.w300),),
                  ),
                  ButtonSegment<String>(
                    value: 'Ahead',
                    label: Text('Ahead', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.w300),),
                  ),
                ],
                selected: <String>{_selectedStatus},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _selectedStatus = newSelection.first;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: saveAndUpload,
                child: Text(
                  'Add',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
