import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class FirestoreService {

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  Future<void> addUser(User user) {
    return users.add(user.toMap());
  }
}
