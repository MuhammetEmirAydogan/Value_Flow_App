import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/features/alerts/widgets/alert_list_item.dart';
import 'package:value_flow/features/alerts/widgets/new_alert_form.dart';
import 'package:value_flow/providers/alerts_provider.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  bool _isAddingAlert = false;

  void _toggleAddAlertForm() {
    setState(() {
      _isAddingAlert = !_isAddingAlert;
    });
  }

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
            onPressed: _toggleAddAlertForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isAddingAlert) ...[
              NewAlertForm(onAlertAdded: _toggleAddAlertForm),
              const SizedBox(height: 24),
            ],
            Expanded(
              child: Consumer<AlertsProvider>(
                builder: (context, alertsProvider, child) {
                  final alerts = alertsProvider.alerts;
                  if (alerts.isEmpty) {
                    return Center(
                      child: Text(
                        'No active alerts.',
                        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: alerts.length,
                    itemBuilder: (context, index) {
                      final alert = alerts[index];
                      final conditionText = 'Alert when price is ${alert.isPriceAbove ? 'above' : 'below'} \$${alert.targetPrice}';
                      return AlertListItem(
                        assetName: alert.asset.name,
                        condition: conditionText,
                        onDelete: () {
                          alertsProvider.removeAlert(alert.id);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}