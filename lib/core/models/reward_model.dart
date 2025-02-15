import 'package:cloud_firestore/cloud_firestore.dart';


class Reward {
  String userId;
  String title;
  String description;
  int rewardPoints;
  String category;
  DateTime createdAt;

  Reward({
    required this.userId,
    required this.title,
    required this.description,
    required this.rewardPoints,
    required this.category,
    required this.createdAt,
  });

  factory Reward.fromMap(Map<String, dynamic> map) {
    return Reward(
      userId: map['userId'],
      title: map['title'],
      description: map['description'],
      rewardPoints: map['rewardPoints'],
      category: map['category'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'rewardPoints': rewardPoints,
      'category': category,
      'createdAt': createdAt,
    };
  }
}
