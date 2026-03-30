import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class SuccessScreen extends StatefulWidget {
  final String userName;

  const SuccessScreen({super.key, required this.userName});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    // Start confetti as soon as the screen appears
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 4));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('You\'re In!'),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false, // no back button
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Confetti bursts from the top center
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: pi / 2, // straight down
            emissionFrequency: 0.05,
            numberOfParticles: 20,
            gravity: 0.2,
            colors: const [
              Colors.purple,
              Colors.pink,
              Colors.orange,
              Colors.yellow,
              Colors.green,
            ],
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome, ${widget.userName}!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Your account has been created successfully.\nTime to get the Cash Money!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Pop all the way back to WelcomeScreen
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Back to Start',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}