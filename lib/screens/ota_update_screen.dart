import 'package:flutter/material.dart';

class OtaUpdateScreen extends StatefulWidget {
  @override
  _OtaUpdateScreenState createState() => _OtaUpdateScreenState();
}

class _OtaUpdateScreenState extends State<OtaUpdateScreen> {
  String currentVersion = '1.0.0';
  String latestVersion = '1.0.0'; // Placeholder for the latest version check
  bool isUpdateAvailable = false;

  void _checkForUpdates() {
    // Mock update check logic (replace with actual update check logic)
    setState(() {
      latestVersion = '1.1.0'; // Example of a newer version
      isUpdateAvailable = latestVersion != currentVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTA Updates')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Version: $currentVersion', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            isUpdateAvailable
                ? Column(
              children: [
                Text('New Version Available: $latestVersion',
                    style: TextStyle(fontSize: 16, color: Colors.green)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Logic to download and apply the update
                  },
                  child: Text('Update to $latestVersion'),
                ),
              ],
            )
                : ElevatedButton(
              onPressed: _checkForUpdates,
              child: Text('Check for Updates'),
            ),
          ],
        ),
      ),
    );
  }
}
