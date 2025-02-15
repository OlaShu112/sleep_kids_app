import 'package:cloud_firestore/cloud_firestore.dart';


class Education {
  String userId;
  String courseName;
  String institution;
  DateTime startDate;
  DateTime endDate;

  Education({
    required this.userId,
    required this.courseName,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      userId: map['userId'],
      courseName: map['courseName'],
      institution: map['institution'],
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'courseName': courseName,
      'institution': institution,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
