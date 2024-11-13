import 'package:flutter_blue/flutter_blue.dart';

class BluetoothService {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice;

  // Connect to a Bluetooth device
  Future<void> connectToDevice(String deviceId) async {
    try {
      // Check if the device is already connected
      List<BluetoothDevice> connectedDevices = await _flutterBlue.connectedDevices;
      connectedDevice = connectedDevices.firstWhere(
              (device) => device.id.id == deviceId,
          orElse: () => throw Exception("Device not found") // Returning null if not found
      );

      if (connectedDevice == null) {
        throw Exception("Device not found");
      }

      await connectedDevice?.connect();
      print("Connected to device: ${connectedDevice?.name}");
    } catch (e) {
      print("Error connecting to device: $e");
    }
  }

  // Disconnect from a Bluetooth device
  Future<void> disconnectDevice() async {
    try {
      if (connectedDevice != null) {
        await connectedDevice?.disconnect();
        connectedDevice = null;
        print("Disconnected from device");
      } else {
        print("No device to disconnect from");
      }
    } catch (e) {
      print("Error disconnecting from device: $e");
    }
  }

  // Check connection status
  bool isConnected() {
    return connectedDevice != null;
  }

  // Send command to Bluetooth device
  Future<bool> sendCommand(String command) async {
    // Implement your logic to send command to the device
    // For now, just returning true as a placeholder
    return true;
  }
}
