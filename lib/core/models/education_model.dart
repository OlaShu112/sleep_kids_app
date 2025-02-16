import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String userId;
  String courseName;
  String context;

  Education({
    required this.userId,
    required this.courseName,
    required this.context,
  });

  static List<Education> getEducation() {
    return [
      Education(
        courseName: 'Sleep Duration',
        context: 'Getting 7-9 hours of sleep per night is essential for both children and adults. Sleep duration impacts cognitive function, memory consolidation, mood regulation, and overall well-being. Consistently getting enough sleep helps to maintain energy levels, improve concentration, and boost immune function.',
        userId: 'easy',
      ),
      Education(
        courseName: 'Healthy Sleep Habits',
        context: 'Developing good sleep habits is crucial for achieving restful sleep. This includes maintaining a consistent sleep schedule, limiting exposure to screens before bedtime, and creating a relaxing bedtime routine. Good sleep hygiene can significantly improve sleep quality and duration.',
        userId: 'medium',
      ),
      Education(
        courseName: 'Diet and Sleep',
        context: 'What you eat can affect how well you sleep. Avoiding caffeine, sugar, and heavy meals in the evening can help prevent sleep disturbances. Consuming sleep-promoting foods like bananas, almonds, and warm milk may support better sleep patterns.',
        userId: 'easy',
      ),
      Education(
        courseName: 'Daytime Habits',
        context: 'Daytime activities influence nighttime sleep. Regular physical activity during the day can promote better sleep at night. However, avoid exercising close to bedtime, as it may make falling asleep more difficult. Limiting naps to 20-30 minutes can also aid nighttime sleep.',
        userId: 'hard',
      ),
    ];
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      userId: map['userId'] ?? '',
      courseName: map['courseName'] ?? '',
      context: map['context'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'courseName': courseName,
      'context': context,
    };
  }
}
