import 'package:cloud_firestore/cloud_firestore.dart';


class ChildProfile {
  String childId;
  String childName;
  DateTime dateOfBirth;
  String profileImageUrl;
  String guardianId;
  List<String> healthConditions; // List of health conditions or notes

  ChildProfile({
    required this.childId,
    required this.childName,
    required this.dateOfBirth,
    required this.profileImageUrl,
    required this.guardianId,
    required this.healthConditions,
  });

  factory ChildProfile.fromMap(Map<String, dynamic> map) {
    return ChildProfile(
      childId: map['childId'],
      childName: map['childName'],
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      profileImageUrl: map['profileImageUrl'] ?? '',
      guardianId: map['guardianId'],
      healthConditions: List<String>.from(map['healthConditions'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': childId,
      'childName': childName,
      'dateOfBirth': dateOfBirth,
      'profileImageUrl': profileImageUrl,
      'guardianId': guardianId,
      'healthConditions': healthConditions,
    };
  }
}
