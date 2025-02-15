import 'package:cloud_firestore/cloud_firestore.dart';


class Challenge {
  String userId;
  String challengeTitle;
  String challengeDescription;
  bool isCompleted;
  DateTime createdAt;

  Challenge({
    required this.userId,
    required this.challengeTitle,
    required this.challengeDescription,
    required this.isCompleted,
    required this.createdAt,
  });

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return Challenge(
      userId: map['userId'],
      challengeTitle: map['challengeTitle'],
      challengeDescription: map['challengeDescription'],
      isCompleted: map['isCompleted'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'challengeTitle': challengeTitle,
      'challengeDescription': challengeDescription,
      'isCompleted': isCompleted,
      'createdAt': createdAt,
    };
  }
}
