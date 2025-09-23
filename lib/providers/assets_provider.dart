import 'package:flutter/foundation.dart';
import 'package:value_flow/models/asset.dart'; // Henüz oluşturmadık, hata normal

class AssetsProvider with ChangeNotifier {
  // Şimdilik sahte varlıklar kullanıyoruz
  final List<Asset> _allAssets = [
    Asset(id: 'gold', name: 'Gold', symbol: 'XAU/USD', price: 2350.55, changePercentage: 0.75),
    Asset(id: 'silver', name: 'Silver', symbol: 'XAG/USD', price: 29.88, changePercentage: -1.25),
    Asset(id: 'usd', name: 'US Dollar', symbol: 'USD/TRY', price: 32.50, changePercentage: 0.00),
    Asset(id: 'eur', name: 'Euro', symbol: 'EUR/TRY', price: 35.00, changePercentage: 0.15),
    Asset(id: 'btc', name: 'Bitcoin', symbol: 'BTC/USD', price: 62045.87, changePercentage: -2.50),
    Asset(id: 'eth', name: 'Ethereum', symbol: 'ETH/USD', price: 3412.33, changePercentage: 0.87),
    Asset(id: 'crude_oil', name: 'Crude Oil (WTI)', symbol: 'CL', price: 85.43, changePercentage: 1.10),
    Asset(id: 'natural_gas', name: 'Natural Gas', symbol: 'NG', price: 2.88, changePercentage: -2.30),
    Asset(id: 'sandp', name: 'S&P 500', symbol: 'SPX', price: 5470.21, changePercentage: 0.40),
    Asset(id: 'nasdaq', name: 'NASDAQ Composite', symbol: 'IXIC', price: 17721.23, changePercentage: 0.65),
  ];

  // Favori varlıkların ID'lerini tutan set
  final Set<String> _favoriteAssetIds = {};

  List<Asset> get allAssets => _allAssets;

  List<Asset> get favoriteAssets {
    return _allAssets.where((asset) => _favoriteAssetIds.contains(asset.id)).toList();
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
    notifyListeners(); // Favori durumu değişti, dinleyenleri güncelle
  }
}