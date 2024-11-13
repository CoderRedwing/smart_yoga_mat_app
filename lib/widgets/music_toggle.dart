import 'package:flutter/material.dart';

class MusicToggle extends StatefulWidget {
  final String title;

  MusicToggle({required this.title});

  @override
  _MusicToggleState createState() => _MusicToggleState();
}

class _MusicToggleState extends State<MusicToggle> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      value: isOn,
      onChanged: (bool value) {
        setState(() {
          isOn = value;
        });
        // Handle music toggle functionality here
      },
    );
  }
}
