import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/home',
    '/sleep-tracking',
    '/analytics',
    '/bedtime-stories',
    '/profile',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final location = GoRouterState.of(context).uri.toString(); // ✅ Fix for GoRouter
    setState(() {
      _selectedIndex = _routes.indexOf(location);
    });
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      context.go(_routes[index]); // ✅ Navigate while keeping the navbar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, // ✅ Keeps the current page while showing navbar
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
}
