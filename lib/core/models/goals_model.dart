import 'package:cloud_firestore/cloud_firestore.dart';


class Goal {
  String userId;
  String goalDescription;
  bool isCompleted;
  DateTime targetDate;

  Goal({
    required this.userId,
    required this.goalDescription,
    required this.isCompleted,
    required this.targetDate,
  });

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      userId: map['userId'],
      goalDescription: map['goalDescription'],
      isCompleted: map['isCompleted'],
      targetDate: (map['targetDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'goalDescription': goalDescription,
      'isCompleted': isCompleted,
      'targetDate': targetDate,
    };
  }
}
