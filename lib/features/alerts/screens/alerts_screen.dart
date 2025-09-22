import 'package:flutter/material.dart';
import 'package:value_flow/features/alerts/widgets/alert_list_item.dart';
import 'package:value_flow/features/alerts/widgets/new_alert_form.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  bool _isAddingAlert = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.notifications),
            SizedBox(width: 8),
            Text('Price Alerts'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_isAddingAlert ? Icons.close : Icons.add),
            onPressed: () {
              setState(() {
                _isAddingAlert = !_isAddingAlert;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isAddingAlert) ...[
              const NewAlertForm(),
              const SizedBox(height: 24),
            ],
            Expanded(
              child: ListView(
                children: const [
                  AlertListItem(
                    assetName: 'Bitcoin',
                    condition: 'Alert when price is above \$65000',
                  ),
                  SizedBox(height: 12),
                  AlertListItem(
                    assetName: 'Ethereum',
                    condition: 'Alert when price is below \$3000',
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