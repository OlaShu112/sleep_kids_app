import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId;
  String firstName;
  String lastName;
  String email;
  DateTime dateOfBirth;
  String profileImageUrl;
  String role; // Example: "parent", "child", "admin"

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    required this.profileImageUrl,
    required this.role,
  });

  // Factory constructor to create a UserModel instance from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      profileImageUrl: map['profileImageUrl'] ?? '',
      role: map['role'] ?? 'user',
    );
  }

  // Method to convert the UserModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'profileImageUrl': profileImageUrl,
      'role': role,
    };
  }
}
