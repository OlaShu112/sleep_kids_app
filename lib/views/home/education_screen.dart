import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  int _selectedIndex = 0; // Adjust index if adding Education tab to navbar

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
      appBar: AppBar(title: Text("Sleep Education")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Learn About Healthy Sleep Habits", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),

          _buildEducationCard(
            title: "Why Sleep is Important",
            description: "Understand why quality sleep matters for your child’s growth and well-being.",
          ),

          _buildEducationCard(
            title: "Bedtime Routines That Work",
            description: "Discover effective bedtime routines to help your child sleep better.",
          ),

          _buildEducationCard(
            title: "Reducing Screen Time Before Bed",
            description: "Learn how screens impact sleep and how to set screen-free bedtime rules.",
          ),

          _buildEducationCard(
            title: "Foods That Help or Harm Sleep",
            description: "Find out which foods promote better sleep and which ones to avoid.",
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.blue,
            tabBackgroundColor: Colors.white24,
            gap: 8,
            padding: EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.nightlight, text: 'Sleep'),
              GButton(icon: Icons.analytics, text: 'Analytics'),
              GButton(icon: Icons.book, text: 'Stories'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationCard({required String title, required String description}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
      ),
    );
  }
}
