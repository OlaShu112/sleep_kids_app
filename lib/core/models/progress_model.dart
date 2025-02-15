import 'package:cloud_firestore/cloud_firestore.dart';


class Progress {
  String userId;
  String task;
  int progressPercentage;
  String notes;
  DateTime date;

  Progress({
    required this.userId,
    required this.task,
    required this.progressPercentage,
    required this.notes,
    required this.date,
  });

  factory Progress.fromMap(Map<String, dynamic> map) {
    return Progress(
      userId: map['userId'],
      task: map['task'],
      progressPercentage: map['progressPercentage'],
      notes: map['notes'],
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'task': task,
      'progressPercentage': progressPercentage,
      'notes': notes,
      'date': date,
    };
  }
}
