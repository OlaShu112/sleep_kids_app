// lib/core/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sleep_kids_app/core/models/achievement_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Method to save an achievement to Firestore
  Future<void> saveAchievement(Achievement achievement) async {
    try {
      await _db.collection('achievements').add(achievement.toMap());
      print("Achievement saved successfully!");
    } catch (e) {
      print("Error saving achievement: $e");
    }
  }

  // Method to get achievements for a user from Firestore
  Future<List<Achievement>> getAchievements(String userId) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection('achievements')
          .where('userId', isEqualTo: userId)
          .get();

      return snapshot.docs
          .map((doc) => Achievement.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching achievements: $e");
      return [];
    }
  }
}
