import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/common/widgets/asset_list_item.dart';
import 'package:value_flow/features/asset_detail/screens/asset_detail_screen.dart';
import 'package:value_flow/providers/assets_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);
    final favoriteAssets = assetsProvider.favoriteAssets;

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
        child: favoriteAssets.isEmpty
            ? Center(
          child: Text(
            'No favorite assets yet. Add some from the list!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
        )
            : ListView.separated(
          itemCount: favoriteAssets.length,
          itemBuilder: (context, index) {
            final asset = favoriteAssets[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssetDetailScreen(asset: asset),
                  ),
                );
              },
              child: AssetListItem(
                iconUrl: asset.image,
                name: asset.name,
                symbol: asset.symbol,
                price: '\$${asset.currentPrice.toStringAsFixed(2)}',
                changePercentage: asset.priceChangePercentage24h,
                isFavorite: assetsProvider.isFavorite(asset.id),
                onFavoriteToggle: () {
                  assetsProvider.toggleFavorite(asset.id);
                },
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
        ),
      ),
    );
  }
}