import 'package:flutter/material.dart';
import 'package:value_flow/models/asset.dart';

class ConversionCard extends StatelessWidget {
  final String label;
  final Asset selectedAsset;
  final String amount;
  final List<Asset> allAssets;
  final bool isInput;
  final Function(Asset) onAssetChanged;
  final Function(String)? onAmountChanged;

  const ConversionCard({
    super.key,
    required this.label,
    required this.selectedAsset,
    required this.amount,
    required this.allAssets,
    this.isInput = false,
    required this.onAssetChanged,
    this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Asset>(
                      value: selectedAsset,
                      isExpanded: true,
                      items: allAssets.map((Asset asset) {
                        return DropdownMenuItem<Asset>(
                          value: asset,
                          child: Text(asset.name, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (newAsset) {
                        if (newAsset != null) {
                          onAssetChanged(newAsset);
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: isInput
                    ? TextFormField(
                  initialValue: amount,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: onAmountChanged,
                )
                    : Text(
                  amount,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}