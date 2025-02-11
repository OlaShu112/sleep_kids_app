import 'package:flutter/material.dart';



class SleepTrackingScreen extends StatelessWidget {
  const SleepTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleep Tracking')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Track your sleep patterns here.', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Icon(Icons.nightlight_round, size: 80, color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
