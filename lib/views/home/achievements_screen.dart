import 'package:flutter/material.dart';
import 'package:sleep_kids_app/core/models/achievement_model.dart';
import 'package:sleep_kids_app/core/services/firestore_service.dart';

// SleepGoalScreen with interactive sliders
class SleepGoalScreen extends StatefulWidget {
  const SleepGoalScreen({super.key});

  @override
  _SleepGoalScreenState createState() => _SleepGoalScreenState();
}

class _SleepGoalScreenState extends State<SleepGoalScreen> {
  double targetBedtime = 22.0; // Default 10:00 PM
  double targetWakeup = 7.0;   // Default 7:00 AM

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sleep Goals")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Set Your Sleep Goals",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Text("Target Bedtime: \${targetBedtime.toInt()}:00"),
            Slider(
              value: targetBedtime,
              min: 18,
              max: 24,
              divisions: 6,
              label: "\${targetBedtime.toInt()}:00",
              onChanged: (value) {
                setState(() => targetBedtime = value);
              },
            ),

            Text("Target Wake-up Time: \${targetWakeup.toInt()}:00"),
            Slider(
              value: targetWakeup,
              min: 4,
              max: 10,
              divisions: 6,
              label: "\${targetWakeup.toInt()}:00",
              onChanged: (value) {
                setState(() => targetWakeup = value);
              },
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sleep goals updated!")),
                );
              },
              child: const Text("Save Goals"),
            ),
          ],
        ),
      ),
    );
  }
}

// AchievementsScreen with Firestore integration
class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(title: const Text('Achievement')),
      body: FutureBuilder<List<Achievement>>(
        future: firestoreService.getAchievements('userId'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: \${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No achievements found.'));
          }

          final achievements = snapshot.data!;
          return ListView.builder(
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(
                    achievement.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(achievement.description),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Add these to your router references:
final Map<String, WidgetBuilder> routes = {
  '/sleepGoals': (context) => const SleepGoalScreen(),
  '/achievement': (context) => const AchievementsScreen(),
};
