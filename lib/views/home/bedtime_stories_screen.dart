import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sleep_kids_app/ult/tinderCard.dart';

class BedtimeStoriesScreen extends StatefulWidget {
  const BedtimeStoriesScreen({Key? key}) : super(key: key);

  @override
  _BedtimeStoriesScreenState createState() => _BedtimeStoriesScreenState();
}

class _BedtimeStoriesScreenState extends State<BedtimeStoriesScreen> {
  int _selectedIndex = 3; // ✅ Set index to match 'Stories' tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bedtime Stories")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Relax with Engaging Bedtime Stories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildStoryCard(
            title: "The Sleepy Owl",
            description:
                "A calming tale of a wise owl and how it finds its way to sleep.",
            icon: Icons.nightlight_round,
          ),
          _buildStoryCard(
            title: "The Starry Night Adventure",
            description:
                "A story about a child who journeys through a world of stars and dreams.",
            icon: Icons.star,
          ),
          _buildStoryCard(
            title: "The Dreamland Train",
            description:
                "Follow a magical train that takes children on a dreamy journey to Dreamland.",
            icon: Icons.train,
          ),
          _buildStoryCard(
            title: "The Midnight Garden",
            description:
                "A peaceful story of a child who discovers the beauty of nature under the moonlight.",
            icon: Icons.nature,
          ),
          SizedBox(height: 20),
          const Center(
              child: Icon(Icons.menu_book, size: 80, color: Colors.deepPurple)),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TindercardView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCard(
      {required String title,
      required String description,
      required IconData icon}) {
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
