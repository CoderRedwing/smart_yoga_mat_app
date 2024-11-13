import 'package:flutter/material.dart';

class DeviceStatusIndicator extends StatelessWidget {
  final bool isConnected;

  DeviceStatusIndicator({required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isConnected ? Icons.bluetooth_connected : Icons.bluetooth_disabled,
          color: isConnected ? Colors.green : Colors.red,
        ),
        SizedBox(width: 8),
        Text(
          isConnected ? 'Connected' : 'Disconnected',
          style: TextStyle(
            color: isConnected ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
