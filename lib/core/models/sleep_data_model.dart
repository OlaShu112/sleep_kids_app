import 'package:cloud_firestore/cloud_firestore.dart';

class SleepData {
  String sleepId; // Changed to String to match Firestore ID format
  String userId;
  String childId; // Changed to match Firebase schema
  DateTime date;
  int sleepDuration; // in minutes
  int sleepQuality; // on a scale from 1 to 10
  String notes;

  SleepData({
    required this.sleepId,
    required this.userId,
    required this.childId,
    required this.date,
    required this.sleepDuration,
    required this.sleepQuality,
    required this.notes,
  });

  // Factory constructor from a DocumentSnapshot
  factory SleepData.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return SleepData(
      sleepId: doc.id,
      userId: data['userId'] ?? '',
      childId: data['child_id'] ?? '',
      date: (data['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      sleepDuration: data['sleepDuration'] ?? 0,
      sleepQuality: data['sleepQuality'] ?? 0,
      notes: data['notes'] ?? '',
    );
  }

  // Factory constructor from a Map
  factory SleepData.fromMap(Map<String, dynamic> map, {String? sleepId}) {
    return SleepData(
      sleepId: sleepId ?? '',
      userId: map['userId'] ?? '',
      childId: map['child_id'] ?? '',
      date: (map['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      sleepDuration: map['sleepDuration'] ?? 0,
      sleepQuality: map['sleepQuality'] ?? 0,
      notes: map['notes'] ?? '',
    );
  }

  // Convert the SleepData instance to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'child_id': childId, // Matches Firebase foreign key
      'date': Timestamp.fromDate(date),
      'sleepDuration': sleepDuration,
      'sleepQuality': sleepQuality,
      'notes': notes,
    };
  }
}
