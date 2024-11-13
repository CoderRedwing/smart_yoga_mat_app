import 'package:flutter/material.dart';
import 'connection_screen.dart'; // Import the ConnectionScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMatConnected = false;

  void updateConnectionStatus(bool isConnected) {
    setState(() {
      isMatConnected = isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Yoga Mat'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/yoga_mat.png', height: 200), // Add a relevant image
            SizedBox(height: 20),
            Text(
              'Welcome to Smart Yoga Mat',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Experience real-time feedback, posture correction, and personalized yoga sessions with our Smart Yoga Mat!.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConnectionScreen(
                      onConnectionChange: updateConnectionStatus,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                isMatConnected ? 'Disconnect from Mat' : 'Connect to Mat',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Benefits:',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeature('Real-time feedback on your posture'),
                _buildFeature('Personalized yoga sessions'),
                _buildFeature('Track your progress easily'),
                _buildFeature('Improve your wellness journey'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              isMatConnected ? 'Status: Connected' : 'Status: Not Connected',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.teal[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.teal),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              feature,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
