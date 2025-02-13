import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4; // ✅ Make sure Profile is selected

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
      appBar: AppBar(title: Text("Profile")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Manage Your Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),

          _buildProfileCard(
            title: "Personal Information",
            description: "Edit your name, email, and other personal details.",
            icon: Icons.info_outline,
          ),

          _buildProfileCard(
            title: "Change Password",
            description: "Update your password for better account security.",
            icon: Icons.lock_outline,
          ),

          _buildProfileCard(
            title: "Privacy Settings",
            description: "Manage your privacy preferences and data sharing.",
            icon: Icons.privacy_tip,
          ),

          _buildProfileCard(
            title: "Notification Preferences",
            description: "Choose the types of notifications you want to receive.",
            icon: Icons.notifications_active,
          ),

          SizedBox(height: 20),
          const Center(child: Icon(Icons.person, size: 80, color: Colors.deepPurple)),
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

  Widget _buildProfileCard({required String title, required String description, required IconData icon}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        leading: Icon(icon, color: Colors.blue),
      ),
    );
  }
}
