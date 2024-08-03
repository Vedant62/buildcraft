import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Project {
  const Project(
      {required this.title,
      required this.id,
      required this.description,
      required this.userId,
      required this.startDate,
      required this.endDate,
      required this.checkInTime,
      required this.createdAt});

  final String id;
  final String title;
  final String description;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay checkInTime;
  final DateTime createdAt;

  factory Project.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Project(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      userId: data['userId'] ?? '',
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      checkInTime: data['checkInTime'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'userId': userId,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'checkInTime': checkInTime,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
