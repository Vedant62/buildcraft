import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project.dart';
import '../models/task.dart';
import '../models/update.dart';
import '../models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference _projects =
      FirebaseFirestore.instance.collection("projects");
  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection("tasks");
  final CollectionReference _updates =
      FirebaseFirestore.instance.collection("updates");

  Future<void> createUser(User user) async {
    await _users.doc(user.id).set(user.toFirestore());
  }

  Future<User?> getUser(String userId) async {
    DocumentSnapshot doc = await _users.doc(userId).get();
    return doc.exists ? User.fromFirestore(doc) : null;
  }

  Future<String> createProject(Project project) async {
    DocumentReference docRef = await _projects.add(project.toFirestore());
    return docRef.id;
  }

  Stream<List<Project>> getUserProjects(String userId) {
    return _projects
        .where("userId", isEqualTo: userId)
        .orderBy("createdAt", descending: true)
        .orderBy(FieldPath.documentId, descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Project.fromFirestore(doc)).toList());
  }

  Future<String> createTask(Task task) async {
    DocumentReference docRef = await _tasks.add(task.toFirestore());
    return docRef.id;
  }

  Stream<List<Task>> getProjectTasks(String projectId) {
    return _tasks
        .where("projectId", isEqualTo: projectId)
        .orderBy("createdAt")
        .orderBy(FieldPath.documentId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }

  Future<void> toggleTaskCompletion(String taskId) async {
    DocumentSnapshot taskDoc = await _tasks.doc(taskId).get();
    if (taskDoc.exists) {
      bool currentStatus = taskDoc.get('isCompleted') ?? false;
      await _tasks.doc(taskId).update({'isCompleted': !currentStatus});
    } else {
      throw Exception('Task not found');
    }
  }

  Future<String> addUpdate(Update update) async {
    DocumentReference docRef = await _updates.add(update.toFirestore());
    return docRef.id;
  }

  Stream<List<Update>> getUpdates(String projectId) {
    return _updates
        .where("projectId", isEqualTo: projectId)
        .orderBy("createdAt", descending: true)
        .orderBy(FieldPath.documentId, descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Update.fromFirestore(doc)).toList());
  }
}
