import 'package:flutter/material.dart';

class AlertListItem extends StatelessWidget {
  final String assetName;
  final String condition;

  const AlertListItem({
    super.key,
    required this.assetName,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Icon(Icons.notifications_active_outlined, color: Theme.of(context).primaryColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(assetName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(condition, style: TextStyle(color: Colors.grey[400])),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red[300]),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}