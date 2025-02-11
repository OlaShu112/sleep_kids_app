import 'package:flutter/material.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  double targetBedtime = 22.0; // Default 10:00 PM
  double targetWakeup = 7.0;   // Default 7:00 AM

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sleep Goals")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Set Your Sleep Goals", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            Text("Target Bedtime: ${targetBedtime.toInt()}:00"),
            Slider(
              value: targetBedtime,
              min: 18,
              max: 24,
              divisions: 6,
              label: "${targetBedtime.toInt()}:00",
              onChanged: (value) {
                setState(() {
                  targetBedtime = value;
                });
              },
            ),

            Text("Target Wake-up Time: ${targetWakeup.toInt()}:00"),
            Slider(
              value: targetWakeup,
              min: 4,
              max: 10,
              divisions: 6,
              label: "${targetWakeup.toInt()}:00",
              onChanged: (value) {
                setState(() {
                  targetWakeup = value;
                });
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Sleep goals updated!")),
                );
              },
              child: Text("Save Goals"),
            ),
          ],
        ),
      ),
    );
  }
}
