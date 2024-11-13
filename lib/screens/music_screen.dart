import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  Map<String, bool> soundStatus = {
    'Breathing Exercises': false,
    'Ocean Waves': false,
    'Ambient Music': false,
  };

  AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentSound; // To keep track of which sound is currently playing
  bool _isPlaying = false; // To track the current playback state

  Map<String, String> soundFiles = {
    'Breathing Exercises': 'assets/breathing.mp3',
    'Ocean Waves': 'assets/ocean_waves.mp3',
    'Ambient Music': 'assets/ambient_music.mp3',
  };

  Map<String, String> soundImages = {
    'Breathing Exercises': 'assets/breathing_image.jpg', // Replace with your image paths
    'Ocean Waves': 'assets/ocean_waves_image.jpg',
    'Ambient Music': 'assets/ambient_music_image.jpg',
  };

  // Play or stop a sound based on the toggle
  void _toggleSound(String title, bool value) async {
    setState(() {
      soundStatus[title] = value;
    });

    if (value) {
      if (_currentSound != null && _currentSound != title) {
        await _audioPlayer.stop();
        setState(() {
          _isPlaying = false;
        });
      }

      await _audioPlayer.play(AssetSource(soundFiles[title]!));
      setState(() {
        _currentSound = title;
        _isPlaying = true;
      });
    } else {
      await _audioPlayer.stop();
      setState(() {
        _currentSound = null;
        _isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music & Sound')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Displaying the current sound with image and play/pause button
            if (_currentSound != null)
              Column(
                children: [
                  Image.asset(
                    soundImages[_currentSound!]!,
                    height: 250, // Adjust size as needed
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                      color: Colors.teal,
                      size: 60,
                    ),
                    onPressed: () async {
                      if (_isPlaying) {
                        await _audioPlayer.pause();
                      } else {
                        await _audioPlayer.resume();
                      }

                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                  ),
                ],
              ),
            SizedBox(height: 30),
            // Create a list of sounds with toggles and play/pause functionality
            ...soundStatus.keys.map((title) {
              return Column(
                children: [
                  MusicToggle(
                    title: title,
                    value: soundStatus[title]!,
                    onChanged: (value) => _toggleSound(title, value),
                  ),
                  SizedBox(height: 10),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class MusicToggle extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  MusicToggle({required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.teal, // Optional: change the active switch color
    );
  }
}
