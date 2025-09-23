import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/features/converter/widgets/conversion_card.dart';
import 'package:value_flow/models/asset.dart';
import 'package:value_flow/providers/assets_provider.dart';
import 'package:value_flow/providers/converter_provider.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final assetsProvider = Provider.of<AssetsProvider>(context, listen: false);
      final converterProvider = Provider.of<ConverterProvider>(context, listen: false);
      if (assetsProvider.allAssets.isNotEmpty) {
        converterProvider.initialize(assetsProvider.allAssets[4], assetsProvider.allAssets[2]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context, listen: false);
    final allAssets = assetsProvider.allAssets;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.swap_horiz),
            SizedBox(width: 8),
            Text('Converter'),
          ],
        ),
      ),
      body: Consumer<ConverterProvider>(
        builder: (context, converter, child) {
          if (converter.fromAsset == null || converter.toAsset == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ConversionCard(
                  label: 'From',
                  selectedAsset: converter.fromAsset!,
                  amount: converter.amount.toString(),
                  allAssets: allAssets,
                  isInput: true,
                  onAssetChanged: (newAsset) {
                    converter.setFromAsset(newAsset);
                  },
                  onAmountChanged: (newAmount) {
                    converter.setAmount(newAmount);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
                    child: IconButton(
                      icon: const Icon(Icons.swap_vert),
                      onPressed: () {
                        converter.swapAssets();
                      },
                    ),
                  ),
                ),
                ConversionCard(
                  label: 'To',
                  selectedAsset: converter.toAsset!,
                  amount: converter.result.toStringAsFixed(2),
                  allAssets: allAssets,
                  onAssetChanged: (newAsset) {
                    converter.setToAsset(newAsset);
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Convert'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}