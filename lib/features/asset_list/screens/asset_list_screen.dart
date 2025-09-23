import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/common/widgets/asset_list_item.dart';
import 'package:value_flow/features/asset_detail/screens/asset_detail_screen.dart';
import 'package:value_flow/models/asset.dart';
import 'package:value_flow/providers/assets_provider.dart';

class AssetListScreen extends StatelessWidget {
  final String categoryTitle;
  final List<Asset> assets;

  const AssetListScreen({
    super.key,
    required this.categoryTitle,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: assets.length,
          itemBuilder: (context, index) {
            final asset = assets[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssetDetailScreen(asset: asset),
                  ),
                );
              },
              child: Consumer<AssetsProvider>(
                builder: (context, assetsProvider, child) {
                  return AssetListItem(
                    iconUrl: asset.image,
                    name: asset.name,
                    symbol: asset.symbol,
                    price: '\$${asset.currentPrice.toStringAsFixed(2)}',
                    changePercentage: asset.priceChangePercentage24h,
                    isFavorite: assetsProvider.isFavorite(asset.id),
                    onFavoriteToggle: () {
                      assetsProvider.toggleFavorite(asset.id);
                    },
                  );
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