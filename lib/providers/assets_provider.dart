import 'package:flutter/foundation.dart';
import 'package:value_flow/models/asset.dart';
import 'package:value_flow/services/api_service.dart';

class AssetsProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Asset> _assets = [];
  bool _isLoading = true;
  String? _errorMessage;

  final Set<String> _favoriteAssetIds = {};

  List<Asset> get allAssets => _assets;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AssetsProvider() {
    fetchAssets();
  }

  Future<void> fetchAssets() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _assets = await _apiService.fetchMarketData();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  List<Asset> get favoriteAssets {
    return _assets.where((asset) => _favoriteAssetIds.contains(asset.id)).toList();
  }

  bool isFavorite(String assetId) {
    return _favoriteAssetIds.contains(assetId);
  }

  void toggleFavorite(String assetId) {
    if (_favoriteAssetIds.contains(assetId)) {
      _favoriteAssetIds.remove(assetId);
    } else {
      _favoriteAssetIds.add(assetId);
    }
    notifyListeners();
  }
}