import 'package:flutter/cupertino.dart';

import '../services/bluetooth_service.dart';

class DeviceProvider with ChangeNotifier {
  bool _isConnected = false;
  String _deviceStatus = 'Disconnected';

  bool get isConnected => _isConnected;
  String get deviceStatus => _deviceStatus;

  BluetoothService _bluetoothService = BluetoothService(); // Instance of BluetoothService

  // Connect to the smart yoga mat via Bluetooth
  Future<void> connectToDevice() async {
    _deviceStatus = 'Connecting...';
    notifyListeners();

    try {
      await _bluetoothService.connectToDevice('deviceId'); // Pass the actual device ID here
      _isConnected = true;
      _deviceStatus = 'Connected';
    } catch (e) {
      _isConnected = false;
      _deviceStatus = 'Error: $e';
    }

    notifyListeners();
  }

  // Disconnect from the smart yoga mat
  Future<void> disconnectFromDevice() async {
    try {
      await _bluetoothService.disconnectDevice();
      _isConnected = false;
      _deviceStatus = 'Disconnected';
    } catch (e) {
      _deviceStatus = 'Error: $e';
    }

    notifyListeners();
  }

  // Send command to the device
  Future<void> sendCommand(String command) async {
    if (_isConnected) {
      try {
        bool result = await _bluetoothService.sendCommand(command); // Make sure sendCommand exists
        if (!result) {
          _deviceStatus = 'Error sending command';
        }
      } catch (e) {
        _deviceStatus = 'Error: $e';
      }
      notifyListeners();
    } else {
      _deviceStatus = 'Not connected';
      notifyListeners();
    }
  }
}
