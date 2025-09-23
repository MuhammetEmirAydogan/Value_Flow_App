import 'package:flutter/foundation.dart';
import 'package:value_flow/models/alert.dart';

class AlertsProvider with ChangeNotifier {
  final List<Alert> _alerts = [];

  List<Alert> get alerts => _alerts;

  void addAlert(Alert newAlert) {
    _alerts.add(newAlert);
    notifyListeners();
  }

  void removeAlert(String alertId) {
    _alerts.removeWhere((alert) => alert.id == alertId);
    notifyListeners();
  }
}