import 'package:cloud_firestore/cloud_firestore.dart';

class Achievement {
  String userId;
  String title;
  String description;
  DateTime dateEarned;
  int points;
  String category;

  Achievement({
    required this.userId,
    required this.title,
    required this.description,
    required this.dateEarned,
    required this.points,
    required this.category,
  });

  // Convert Achievement object to Fires-compatible Map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'dateEarned': dateEarned,
      'points': points,
      'category': category,
    };
  }

  // Create Achievement object from Fires document snapshot
  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      userId: map['userId'],
      title: map['title'],
      description: map['description'],
      dateEarned: (map['dateEarned'] as Timestamp).toDate(),
      points: map['points'],
      category: map['category'],
    );
  }
}
