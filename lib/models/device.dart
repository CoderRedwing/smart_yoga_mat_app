class Device {
  final String deviceId;
  final String name;
  final bool isConnected;

  Device({
    required this.deviceId,
    required this.name,
    this.isConnected = false,
  });

  // Factory method to create Device instance from JSON data
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      deviceId: json['deviceId'],
      name: json['name'],
      isConnected: json['isConnected'] ?? false,
    );
  }

  // Convert Device instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'name': name,
      'isConnected': isConnected,
    };
  }
}
