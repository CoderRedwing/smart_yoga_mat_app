import 'package:flutter/cupertino.dart';

import '../services/ota_service.dart';

class OTAUpdateProvider with ChangeNotifier {
  bool _isUpdating = false;
  String _updateStatus = 'Up to Date';

  bool get isUpdating => _isUpdating;
  String get updateStatus => _updateStatus;

  // Instance of OtaService
  final OtaService _otaService = OtaService();

  // Check if there is a new firmware update available
  Future<void> checkForUpdate() async {
    _updateStatus = 'Checking for update...';
    notifyListeners();

    try {
      bool updateAvailable = (await _otaService.checkForUpdate()) as bool;
      if (updateAvailable) {
        _updateStatus = 'Update Available';
      } else {
        _updateStatus = 'Up to Date';
      }
    } catch (e) {
      _updateStatus = 'Error checking update: $e';
    }

    notifyListeners();
  }

  // Apply firmware update
  Future<void> applyUpdate(BuildContext context) async {
    if (_updateStatus == 'Update Available') {
      _isUpdating = true;
      _updateStatus = 'Updating...';
      notifyListeners();

      try {
        bool updateResult = await _otaService.applyUpdate(context);
        if (updateResult) {
          _updateStatus = 'Update Successful';
        } else {
          _updateStatus = 'Update Failed';
        }
      } catch (e) {
        _updateStatus = 'Error applying update: $e';
      }

      _isUpdating = false;
      notifyListeners();
    }
  }
}
