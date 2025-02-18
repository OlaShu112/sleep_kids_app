import 'package:cloud_firestore/cloud_firestore.dart';

class ChildProfile {
  String childId;
  String childName;
  String issueId;
  DateTime dateOfBirth;
  String profileImageUrl;
  String guardianId;

  ChildProfile({
    required this.childId,
    required this.childName,
    required this.issueId,
    required this.dateOfBirth,
    required this.profileImageUrl,
    required this.guardianId,
  });

  // fetch data directly from fireStore.
  factory ChildProfile.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChildProfile(
      childId: doc.id,
      childName: data['childName'],
      issueId: data['IssueId'],
      dateOfBirth: (data['dateOfBirth'] as Timestamp).toDate(),
      profileImageUrl: data['profileImageUrl'] ?? '',
      guardianId: data['guardianId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': childId,
      'childName': childName,
      'IssueId': issueId,
      'dateOfBirth': dateOfBirth,
      'profileImageUrl': profileImageUrl,
      'guardianId': guardianId,
    };
  }
}
