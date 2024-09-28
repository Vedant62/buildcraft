import 'package:cloud_firestore/cloud_firestore.dart';

class Update {
  Update({
    required this.id,
    required this.projectId,
    required this.projectUpdateImageLink,
    required this.dateTime,
    required this.status,
  });

  final String id;
  final String projectId;
  final String projectUpdateImageLink;
  final DateTime dateTime;
  final Status status;

  factory Update.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Update(
      id: doc.id,
      projectId: data['projectId'] ?? '',
      projectUpdateImageLink: data['projectUpdateImageLink'] ?? '',
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      status: Status.values[data['status'] ?? 0],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'projectId': projectId,
      'projectUpdateImageLink': projectUpdateImageLink,
      'dateTime': Timestamp.fromDate(dateTime),
      'status': status.index,
    };
  }
}

enum Status {
  late,
  onTime,
  ahead,
}