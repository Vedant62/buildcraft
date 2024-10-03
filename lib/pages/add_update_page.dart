import 'dart:io';
import 'package:buildcraft/services/storage.dart';
import 'package:buildcraft/utils/timeFormat.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  late StorageService storageService;
  late Project _project;
  File? selectedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storageService = StorageService();
    _project = widget.project;

  }
  void pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() async {
      selectedImage = File(image.path);
      await storageService.uploadImage(selectedImage!, _project.id!);
    });
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
              child: Center(
                child: TextButton(
                  onPressed: pickImage,
                  child: Text('Upload an image',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.withOpacity(0.5))),
                ),
              ),
              // child: ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                formatTimeOfDay(TimeOfDay.now()),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      ),
    );
  }
}
