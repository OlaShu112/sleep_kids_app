import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter
import 'core/providers/auth_provider.dart';
import 'core/providers/sleep_provider.dart';
import 'views/auth/login_screen.dart';
import 'views/auth/signup_screen.dart';
import 'views/home/home_screen.dart';
import 'package:intl/intl.dart'; // For formatting the time
import 'views/home/sleep_tracking_screen.dart'; // Import SleepTrackingScreen
import 'views/home/analytics_screen.dart'; // Import AnalyticsScreen (if you have it)
import 'views/home/bedtime_stories_screen.dart'; // Import BedtimeStoriesScreen (if you have it)
import 'views/home/profile_screen.dart'; // Import ProfileScreen (if you have it)
import 'views/home/goal_screen.dart';
import 'views/home/education_screen.dart';
import 'views/home/dashboard_screen.dart';
import 'package:sleep_kids_app/widgets/main_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Firebase is initialized
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create a GoRouter instance
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      // Define routes
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/sleep-tracking',
        builder: (context, state) => MainLayout(
            child: SleepTrackingScreen()), // Add your sleep tracking route here
      ),
      GoRoute(
        path: '/analytics',
        builder: (context, state) => MainLayout(child: AnalyticsScreen()),
      ),
      GoRoute(
        path: '/bedtime-stories',
        builder: (context, state) => MainLayout(child: BedtimeStoriesScreen()),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => MainLayout(child: ProfileScreen()),
      ),
      GoRoute(
        path: '/goal',
        builder: (context, state) => MainLayout(child: GoalScreen()),
      ),
      GoRoute(
        // ✅ Added this
        path: '/education',
        builder: (context, state) =>
            MainLayout(child: EducationScreen()), // Ensure HomeScreen exists
      ),
      GoRoute(
        // ✅ Added this
        path: '/home',
        builder: (context, state) => MainLayout(child: HomeScreen()), // Ensure HomeScreen exists
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) =>
            DashboardScreen(), // Replace with the actual path of DashboardScreen
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => SleepProvider()),
      ],
      child: MaterialApp.router(
        title: 'Sleep Kids',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _router, // Pass GoRouter configuration here
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String currentTime = '';
  bool showSleepKids = false;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    if (mounted) {
      currentTime = DateFormat('hh:mm a').format(DateTime.now());
      setState(() {});
    }
    Future.delayed(Duration(seconds: 1), _updateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: Drawer(
        child: Container(
          color:
              Colors.black.withOpacity(0.8), // Dark background for the drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero, // No padding for the header
                child: Container(
                  padding: EdgeInsets.all(16), // Padding for the header content
                  color:
                      Colors.transparent, // Transparent background for header
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Menu title color
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent, // No white background
                ),
              ),
              // No extra padding between header and menu items
              Column(
                children: [
                  ListTile(
                    title:
                        Text('About Us', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      print('Navigating to About Us');
                    },
                  ),
                  ListTile(
                    title: Text('Contact Us',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      print('Navigating to Contact Us');
                    },
                  ),
                  ListTile(
                    title: Text('Other Pages',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      print('Navigating to Other Pages');
                    },
                  ),
                  // Add the Dashboard menu item here
                  ListTile(
                    title: Text('Dashboard',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Navigate to the Dashboard screen
                      context.go('/dashboard');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(
                'assets/images/sleep_kids.jpg',
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

              // Main Content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Menu Button (Toggle Drawer)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.menu, size: 36, color: Colors.white),
                        onPressed: () {
                          // Open drawer using the new context provided by Builder
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // Reduced gap between menu and content

                  // Display Current Time
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

                  // Sleep Kids Text (conditionally shown)
                  if (showSleepKids)
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

                  // Tagline Text
                  Text(
                    'Wake Up Easy with Sleep Kids',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  // Description Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Sleep Kids tracks and analyzes your sleep, waking you up at the most perfect time.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(flex: 14),

                  // Get Started Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the login page using GoRouter
                      context.go('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(flex: 6),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
