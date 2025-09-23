import 'package:flutter/foundation.dart';
import 'package:value_flow/models/asset.dart';

class ConverterProvider with ChangeNotifier {
  Asset? _fromAsset;
  Asset? _toAsset;
  double _amount = 1.0;
  double _result = 0.0;

  Asset? get fromAsset => _fromAsset;
  Asset? get toAsset => _toAsset;
  double get amount => _amount;
  double get result => _result;

  void initialize(Asset defaultFrom, Asset defaultTo) {
    _fromAsset = defaultFrom;
    _toAsset = defaultTo;
    _calculateResult();
  }

  void setFromAsset(Asset asset) {
    if (_toAsset?.id == asset.id) {
      _toAsset = _fromAsset;
    }
    _fromAsset = asset;
    _calculateResult();
    notifyListeners();
  }

  void setToAsset(Asset asset) {
    if (_fromAsset?.id == asset.id) {
      _fromAsset = _toAsset;
    }
    _toAsset = asset;
    _calculateResult();
    notifyListeners();
  }

  void setAmount(String value) {
    _amount = double.tryParse(value) ?? 0.0;
    _calculateResult();
    notifyListeners();
  }

  void swapAssets() {
    final temp = _fromAsset;
    _fromAsset = _toAsset;
    _toAsset = temp;
    _calculateResult();
    notifyListeners();
  }

  void _calculateResult() {
    if (_fromAsset != null && _toAsset != null) {
      _result = (_amount * _fromAsset!.price) / _toAsset!.price;
    } else {
      _result = 0.0;
    }
  }
}