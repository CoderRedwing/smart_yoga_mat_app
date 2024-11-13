import 'package:flutter/material.dart';

import 'control_screen.dart';

class ConnectionScreen extends StatefulWidget {
  final Function(bool) onConnectionChange;  // Callback to pass connection status

  ConnectionScreen({required this.onConnectionChange});

  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  bool isConnected = false;

  void _connectToMat() {
    // Simulate connection logic (replace with actual Bluetooth/Wi-Fi logic)
    setState(() {
      isConnected = true;
    });
    widget.onConnectionChange(true);  // Pass status back to HomeScreen
  }

  void _disconnectFromMat() {
    // Simulate disconnection logic
    setState(() {
      isConnected = false;
    });
    widget.onConnectionChange(false);  // Update status on HomeScreen
  }

  void _goToControlScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControlScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connect to Mat')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isConnected ? 'Connected to Mat' : 'Connecting to Mat...',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isConnected ? _disconnectFromMat : _connectToMat,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                primary: isConnected ? Colors.red : Colors.teal,
              ),
              child: Text(
                isConnected ? 'Disconnect' : 'Connect via Bluetooth/Wi-Fi',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isConnected ? _goToControlScreen : null, // Only go to Control Screen if connected
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                primary: Colors.teal,
              ),
              child: Text(
                'Go to Control Screen',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
