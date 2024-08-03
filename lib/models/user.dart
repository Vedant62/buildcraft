import 'package:cloud_firestore/cloud_firestore.dart';

class User {
   User(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.email});

  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
