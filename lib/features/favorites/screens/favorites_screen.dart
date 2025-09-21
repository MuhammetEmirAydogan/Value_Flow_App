// lib/features/favorites/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:value_flow/common/widgets/asset_list_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.star),
            SizedBox(width: 8),
            Text('Favorites'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Gerçek veriler geldiğinde ListView.builder kullanacağız
        child: ListView(
          children: const [
            // Mock Data - Tasarımdaki gibi sahte verilerle dolduruyoruz
            AssetListItem(
              name: 'Gold',
              symbol: 'XAU/USD',
              price: '\$2,350.55',
              changePercentage: 0.75,
              isFavorite: true,
            ),
            SizedBox(height: 12),
            AssetListItem(
              name: 'Bitcoin',
              symbol: 'BTC/USD',
              price: '\$62,045.87',
              changePercentage: -2.5,
              isFavorite: true,
            ),
            SizedBox(height: 12),
            AssetListItem(
              name: 'S&P 500',
              symbol: 'SPX',
              price: '\$5,470.21',
              changePercentage: 0.4,
              isFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}