import 'package:flutter/material.dart';

class MusicProvider with ChangeNotifier {
  bool _isMusicEnabled = false;
  String _currentTrack = '';

  bool get isMusicEnabled => _isMusicEnabled;
  String get currentTrack => _currentTrack;

  // Toggle music on or off
  void toggleMusic(bool isEnabled) {
    _isMusicEnabled = isEnabled;
    notifyListeners();
  }

  // Select a track to play
  void selectTrack(String trackName) {
    _currentTrack = trackName;
    notifyListeners();
  }
}
