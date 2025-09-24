import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/features/asset_list/screens/asset_list_screen.dart';
import 'package:value_flow/features/home/widgets/category_card.dart';
import 'package:value_flow/models/asset.dart';
import 'package:value_flow/providers/assets_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AssetsProvider>(
            builder: (context, assetsProvider, child) {
              if (assetsProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (assetsProvider.errorMessage != null) {
                return Center(child: Text(assetsProvider.errorMessage!));
              }

              final preciousMetalIds = ['pax-gold', 'tether-gold'];
              final stablecoinIds = ['tether', 'usd-coin', 'eurc'];
              final excludedIds = [...preciousMetalIds, ...stablecoinIds];

              final List<Map<String, dynamic>> categories = [
                {
                  'title': 'Precious Metals',
                  'icon': Icons.shield_outlined,
                  'assets': assetsProvider.allAssets
                      .where((asset) => preciousMetalIds.contains(asset.id))
                      .toList(),
                },
                {
                  'title': 'Currencies',
                  'icon': Icons.monetization_on_outlined,
                  'assets': assetsProvider.allAssets
                      .where((asset) => stablecoinIds.contains(asset.id))
                      .toList(),
                },
                {
                  'title': 'Cryptocurrencies',
                  'icon': Icons.donut_small_outlined,
                  'assets': assetsProvider.allAssets
                      .where((asset) => !excludedIds.contains(asset.id))
                      .toList(),
                },
                {
                  'title': 'Energy & Commodities',
                  'icon': Icons.local_fire_department_outlined,
                  'assets': <Asset>[],
                },
              ];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ValueFlow', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome back, \nSelect a category to start tracking.',
                    style: TextStyle(fontSize: 16, color: Theme.of(context).textTheme.bodyMedium?.color),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: ListView.separated(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            if ((category['assets'] as List<Asset>).isEmpty) return;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AssetListScreen(
                                  categoryTitle: category['title'],
                                  assets: category['assets'] as List<Asset>,
                                ),
                              ),
                            );
                          },
                          child: CategoryCard(
                            icon: category['icon'],
                            title: category['title'],
                            subtitle: '${(category['assets'] as List<Asset>).length} assets',
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}