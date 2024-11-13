import 'package:flutter/material.dart';
import 'music_screen.dart'; // Import the MusicScreen

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  String statusMessage = '';

  void _startWarmUp() {
    setState(() {
      statusMessage = 'Warm-Up Mode Activated';
    });
  }

  // Function to start relaxation mode on the mat
  void _beginRelaxationMode() {
    setState(() {
      statusMessage = 'Relaxation Mode Activated';
    });
  }

  // Navigate to the Music Screen
  void _goToMusicScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MusicScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mat Control')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Start Warm-Up Button
            ControlButton(
              title: 'Start Warm-Up',
              onPressed: _startWarmUp,
            ),
            SizedBox(height: 20),
            // Begin Relaxation Mode Button
            ControlButton(
              title: 'Begin Relaxation Mode',
              onPressed: _beginRelaxationMode,
            ),
            SizedBox(height: 30),
            // Status message displaying the current mode
            Text(
              statusMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.teal),
            ),
            SizedBox(height: 30),
            // Button to navigate to the Music Screen
            ElevatedButton(
              onPressed: _goToMusicScreen,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Go to Music Screen',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  ControlButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
