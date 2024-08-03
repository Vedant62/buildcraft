import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project.dart';
import '../models/task.dart';
import '../models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference _projects =
      FirebaseFirestore.instance.collection("projects");
  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection("tasks");

  Future<void> createUser(User user) async {
    await _users.doc(user.id).set(user.toFirestore());
  }

  Future<User?> getUser(String userId) async {
    DocumentSnapshot doc = await _users.doc(userId).get();
    return doc.exists ? User.fromFirestore(doc) : null;
  }

  Future<void> createProject(Project project) async {
    await _projects.doc(project.id).set(project.toFirestore());
  }

  Stream<List<Project>> getUserProjects(String userId) {
    return _projects.where("userId", isEqualTo: userId).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Project.fromFirestore(doc)).toList());
  }

  Future<void> createTask(Task task) async {
    await _tasks.doc(task.id).set(task.toFirestore());
  }

  Stream<List<Task>> getProjectTasks(String projectId) {
    return _tasks.where("projectId", isEqualTo: projectId).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }
}
