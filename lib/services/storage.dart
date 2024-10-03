import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService{
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String projectId) async {
    try {
      String fileName = basename(file.path);
      Reference storageRef = firebaseStorage.ref().child('project_${projectId}_updates/$fileName');

      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Encountered this error: $e");
      rethrow;
    }
  }

  Future<void> deleteImage(String fileUrl) async {
    try {
      Reference storageRef = firebaseStorage.refFromURL(fileUrl);
      await storageRef.delete();
    } catch (e) {
      print('Error deleting image: $e');
      rethrow;
    }
  }

  Future<List<String>> getAllProjectFiles(String folderPath) async {
    try {
      ListResult result = await firebaseStorage.ref(folderPath).listAll();
      List<String> fileUrls = [];
      for (Reference ref in result.items) {
        String downloadUrl = await ref.getDownloadURL();
        fileUrls.add(downloadUrl);
      }
      return fileUrls;
    } catch (e) {
      print('Error listing files: $e');
      throw e;
    }
  }

}