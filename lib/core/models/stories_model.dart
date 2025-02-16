import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String storyId;
  String description;
  String context;
  String profileImageUrl;

  // Example: "parent", "child", "admin"

  UserModel({
    required this.storyId,
    required this.description,
    required this.context,
    required this.profileImageUrl,

  });

  // Factory constructor to create a UserModel instance from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      storyId: map['storyId'],
      description: map['description'],
      context: map['context'],
      profileImageUrl: map['profileImageUrl']

    );
  }

  // Method to convert the UserModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'storyId': storyId,
      'description': description,
      'context': context,
      'profileImageUrl': profileImageUrl,

    };
  }
}
