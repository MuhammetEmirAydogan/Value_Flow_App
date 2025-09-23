import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/features/home/widgets/category_card.dart';
import 'package:value_flow/providers/assets_provider.dart'; // YENİ IMPORT

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AssetsProvider'a erişiyoruz
    final assetsProvider = Provider.of<AssetsProvider>(context);

    // Varlıkları kategorilerine göre ayırabiliriz (örneğin)
    // Şimdilik sadece örnek olarak tüm varlıkları çekiyoruz, ileride filtrelenecek
    final preciousMetals = assetsProvider.allAssets
        .where((asset) => asset.id == 'gold' || asset.id == 'silver')
        .toList();
    final currencies = assetsProvider.allAssets
        .where((asset) => asset.id == 'usd' || asset.id == 'eur')
        .toList();
    final cryptocurrencies = assetsProvider.allAssets
        .where((asset) => asset.id == 'btc' || asset.id == 'eth')
        .toList();
    final energyCommodities = assetsProvider.allAssets
        .where((asset) => asset.id == 'crude_oil' || asset.id == 'natural_gas')
        .toList();


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ValueFlow', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Welcome back, \nSelect a category to start tracking.', style: TextStyle(fontSize: 16, color: Theme.of(context).textTheme.bodyMedium?.color)),
              const SizedBox(height: 32),

              // Kategori Kartları
              GestureDetector( // Kartlara tıklanabilir özellik kazandırıyoruz
                onTap: () {
                  // TODO: İlgili varlık listesi ekranına yönlendirme
                  print('Precious Metals Tıklandı');
                },
                child: CategoryCard(
                  icon: Icons.shield_outlined,
                  title: 'Precious Metals',
                  // Alt başlıkta kategoriye ait varlık sayısını gösterebiliriz
                  subtitle: '${preciousMetals.length} assets',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  print('Currencies Tıklandı');
                },
                child: CategoryCard(
                  icon: Icons.monetization_on_outlined,
                  title: 'Currencies',
                  subtitle: '${currencies.length} assets',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  print('Cryptocurrencies Tıklandı');
                },
                child: CategoryCard(
                  icon: Icons.donut_small_outlined,
                  title: 'Cryptocurrencies',
                  subtitle: '${cryptocurrencies.length} assets',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  print('Energy & Commodities Tıklandı');
                },
                child: CategoryCard(
                  icon: Icons.local_fire_department_outlined,
                  title: 'Energy & Commodities',
                  subtitle: '${energyCommodities.length} assets',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}