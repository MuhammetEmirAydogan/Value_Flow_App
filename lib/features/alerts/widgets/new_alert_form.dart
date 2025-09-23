import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/models/alert.dart';
import 'package:value_flow/models/asset.dart';
import 'package:value_flow/providers/alerts_provider.dart';
import 'package:value_flow/providers/assets_provider.dart';

class NewAlertForm extends StatefulWidget {
  final VoidCallback onAlertAdded;

  const NewAlertForm({super.key, required this.onAlertAdded});

  @override
  State<NewAlertForm> createState() => _NewAlertFormState();
}

class _NewAlertFormState extends State<NewAlertForm> {
  Asset? _selectedAsset;
  final _priceController = TextEditingController();
  bool _isPriceAbove = true;

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _addAlert() {
    final targetPrice = double.tryParse(_priceController.text);
    if (_selectedAsset != null && targetPrice != null) {
      final newAlert = Alert(
        id: DateTime.now().toIso8601String(),
        asset: _selectedAsset!,
        targetPrice: targetPrice,
        isPriceAbove: _isPriceAbove,
      );
      Provider.of<AlertsProvider>(context, listen: false).addAlert(newAlert);
      widget.onAlertAdded();
    }
  }

  @override
  Widget build(BuildContext context) {
    final allAssets = Provider.of<AssetsProvider>(context, listen: false).allAssets;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("New Alert", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Asset>(
                value: _selectedAsset,
                hint: const Text("Select Asset"),
                isExpanded: true,
                items: allAssets.map((Asset asset) {
                  return DropdownMenuItem<Asset>(
                    value: asset,
                    child: Text(asset.name, overflow: TextOverflow.ellipsis),
                  );
                }).toList(),
                onChanged: (newAsset) {
                  setState(() {
                    _selectedAsset = newAsset;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _priceController,
            decoration: const InputDecoration(hintText: 'Target Price'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() => _isPriceAbove = true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isPriceAbove ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: const Text('Price Above'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() => _isPriceAbove = false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !_isPriceAbove ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: const Text('Price Below'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _addAlert,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Add Alert'),
          ),
        ],
      ),
    );
  }
}