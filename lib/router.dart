import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_kids_app/views/home/education_screen.dart';
import 'package:sleep_kids_app/views/home/goal_screen.dart';
import 'views/home/sleep_tracking_screen.dart';  // Correct path to SleepTrackingScreen
import 'views/home/analytics_screen.dart';       // Correct path to AnalyticsScreen
import 'views/home/bedtime_stories_screen.dart'; // Correct path to BedtimeStoriesScreen
import 'views/home/profile_screen.dart';         // Correct path to ProfileScreen
import '../views/home/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        // Home Screen (the main screen)
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        // Route for SleepTrackingScreen
        GoRoute(
          path: '/sleep-tracking',
          builder: (context, state) => const SleepTrackingScreen(),
        ),
        // Route for AnalyticsScreen
        GoRoute(
          path: '/analytics',
          builder: (context, state) => const AnalyticsScreen(),
        ),
        // Route for BedtimeStoriesScreen
        GoRoute(
          path: '/bedtime-stories',
          builder: (context, state) => const BedtimeStoriesScreen(),
        ),
        // Route for ProfileScreen
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/goal',
          builder: (context, state) => const GoalScreen(),
        ),
        // Route for ProfileScreen
        GoRoute(
          path: '/education',
          builder: (context, state) => const EducationScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Sleep Kids',
      routerConfig: _router, // Set the GoRouter config here
    );
  }
}
