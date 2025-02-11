import 'package:flutter/material.dart';

class SleepTrackingScreen extends StatelessWidget {
  const SleepTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleep Tracking')),
      body: const Center(
        child: Text('Sleep tracking features will go here.'),
      ),
    );
  }
}
