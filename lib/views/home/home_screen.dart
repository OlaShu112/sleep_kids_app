import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:sleep_kids_app/views/home/sleep_tracking_screen.dart';
import 'package:sleep_kids_app/views/home/analytics_screen.dart';
import 'package:sleep_kids_app/views/home/bedtime_stories_screen.dart';
import 'package:sleep_kids_app/views/home/profile_screen.dart';
import 'package:sleep_kids_app/widgets/custom_button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      currentTime = DateFormat('hh:mm a').format(DateTime.now());
    });
    Future.delayed(Duration(seconds: 1), _updateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/sleep_kidss.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Text(
                  'Image not found',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.menu, size: 36, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 100),
              Text(
                currentTime,
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                'Sleep Kids',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CustomButton(
                title: 'Track Sleep',
                route: '/sleep-tracking', // Navigate to SleepTrackingScreen
              ),
              CustomButton(
                title: 'View Analytics',
                route: '/analytics', // Navigate to AnalyticsScreen
              ),
              CustomButton(
                title: 'Bedtime Stories',
                route: '/bedtime-stories', // Navigate to BedtimeStoriesScreen
              ),
              CustomButton(
                title: 'Goal',
                route: '/goal', // Navigate to GoalScreen
              ),
              CustomButton(
                title: 'Education',
                route: '/education', // Navigate to EducationScreen
              ),
              CustomButton(
                title: 'Profile',
                route: '/profile', // Navigate to ProfileScreen
              ),
            ],
          ),
        ],
      ),
    );
  }
}
