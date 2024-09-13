import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Project {
  const Project({
    required this.title,
    required this.id,
    required this.description,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.checkInTime,
    required this.createdAt,
  });

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
      checkInTime: _parseTimeOfDay(data['checkInTime'] ?? ''),
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
      'checkInTime': _formatTimeOfDay(checkInTime),
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  static TimeOfDay _parseTimeOfDay(String timeString) {
    final parts = timeString.split(':');
    if (parts.length == 2) {
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
    return TimeOfDay.now(); // Default value if parsing fails
  }

  static String _formatTimeOfDay(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}