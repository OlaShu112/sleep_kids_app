import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Tindercard {
  final String title;
  final String description;
  final Color boxColor;
  final IconData image;

  Tindercard({
    required this.title,
    required this.description,
    required this.boxColor,
    required this.image,
  });
}

class TindercardView extends StatelessWidget {
  final List<Tindercard> cards = [
    Tindercard(
      title: "The Sleepy Owl",
      description: "A calming tale of a wise owl and how it finds its way to sleep.",
      image: Icons.nightlight_round,
      boxColor: Colors.blue.withOpacity(0.4),
    ),
    Tindercard(
      title: "The Starry Night Adventure",
      description: "A story about a child who journeys through a world of stars and dreams.",
      image: Icons.star,
      boxColor: Colors.pinkAccent,
    ),
    Tindercard(
      title: "The Dreamland Train",
      description: "Follow a magical train that takes children on a dreamy journey to Dreamland.",
      image: Icons.train,
      boxColor: Colors.brown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
            return GestureDetector(
              onTap: () {
                _openFullScreenCard(context, cards[index]);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cards[index].boxColor,
                ),
                child: Text(
                  cards[index].title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openFullScreenCard(BuildContext context, Tindercard card) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: FullScreenCard(
                card: card,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenCard extends StatelessWidget {
  final Tindercard card;

  FullScreenCard({required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: card.boxColor,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // this is to go back
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                card.title,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  card.description,
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
