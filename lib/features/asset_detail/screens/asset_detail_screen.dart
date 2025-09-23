import 'package:flutter/material.dart';
import 'package:value_flow/features/asset_detail/widgets/price_chart.dart';
import 'package:value_flow/features/asset_detail/widgets/timeframe_selector.dart';
import 'package:value_flow/models/asset.dart';

class AssetDetailScreen extends StatelessWidget {
  final Asset asset;

  const AssetDetailScreen({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final Color changeColor = asset.changePercentage >= 0 ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: Text(asset.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${asset.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${asset.changePercentage.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20, color: changeColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            const PriceChart(),
            const SizedBox(height: 24),
            const TimeframeSelector(),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    '${asset.name} price in the global market, reflecting its status as a primary safe-haven asset.',
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}