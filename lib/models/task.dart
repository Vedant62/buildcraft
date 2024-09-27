import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  Task({
    this.id,
    required this.title,
    required this.projectId,
    this.isCompleted = false,
    required this.createdAt,
  });

  String? id;
  final String projectId;
  final String title;
  bool isCompleted;
  final DateTime createdAt;

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      projectId: data['projectId'] ?? '',
      title: data['title'] ?? '',
      isCompleted: data['isCompleted'] ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'projectId': projectId,
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
