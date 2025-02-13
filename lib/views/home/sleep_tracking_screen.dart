import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SleepTrackingScreen extends StatefulWidget {
  const SleepTrackingScreen({super.key});

  @override
  _SleepTrackingScreenState createState() => _SleepTrackingScreenState();
}

class _SleepTrackingScreenState extends State<SleepTrackingScreen> {
  int _selectedIndex = 1; // ✅ Make sure Sleep is selected

  final List<String> _routes = [
    '/home',
    '/sleep-tracking',
    '/analytics',
    '/bedtime-stories',
    '/profile',
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      context.go(_routes[index]); // ✅ Navigate between pages
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleep Tracking')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Track your sleep patterns here.',
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Icon(Icons.nightlight_round, size: 80, color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
