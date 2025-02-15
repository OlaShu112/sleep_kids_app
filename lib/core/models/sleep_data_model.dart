import 'package:cloud_firestore/cloud_firestore.dart';


class SleepData {
  String userId;
  DateTime date;
  int sleepDuration; // in minutes
  int sleepQuality; // on a scale from 1 to 10
  String notes;

  SleepData({
    required this.userId,
    required this.date,
    required this.sleepDuration,
    required this.sleepQuality,
    required this.notes,
  });

  factory SleepData.fromMap(Map<String, dynamic> map) {
    return SleepData(
      userId: map['userId'],
      date: (map['date'] as Timestamp).toDate(),
      sleepDuration: map['sleepDuration'],
      sleepQuality: map['sleepQuality'],
      notes: map['notes'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'date': date,
      'sleepDuration': sleepDuration,
      'sleepQuality': sleepQuality,
      'notes': notes,
    };
  }
}
