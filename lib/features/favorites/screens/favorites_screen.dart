import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/common/widgets/asset_list_item.dart';
import 'package:value_flow/providers/assets_provider.dart'; // YENİ IMPORT

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AssetsProvider'ı dinliyoruz, favori listesi değiştiğinde bu widget yeniden çizilecek
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
            'No favorite assets yet. Add some from the Home screen!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
        )
            : ListView.separated(
          itemCount: favoriteAssets.length,
          itemBuilder: (context, index) {
            final asset = favoriteAssets[index];
            return GestureDetector( // Tıklanabilirlik için sardık
              onTap: () {
                // TODO: Varlık detay ekranına git
                print('${asset.name} detayına git');
              },
              child: AssetListItem(
                name: asset.name,
                symbol: asset.symbol,
                price: '\$${asset.price.toStringAsFixed(2)}',
                changePercentage: asset.changePercentage,
                isFavorite: assetsProvider.isFavorite(asset.id),
                // Favori butonuna tıklama işlevi ekliyoruz
                onFavoriteToggle: () { // Bu metot AssetListItem'e eklenecek
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