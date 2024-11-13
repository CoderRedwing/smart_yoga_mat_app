import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  ControlButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: TextStyle(fontSize: 16),
        ),
        child: Text(title),
      ),
    );
  }
}
