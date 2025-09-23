import 'package:flutter/material.dart';

class AssetListItem extends StatelessWidget {
  final String iconUrl;
  final String name;
  final String symbol;
  final String price;
  final double changePercentage;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle; // YENİ PARAMETRE

  const AssetListItem({
    super.key,
    this.iconUrl = '',
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercentage,
    this.isFavorite = false,
    this.onFavoriteToggle, // YENİ PARAMETRE
  });

  @override
  Widget build(BuildContext context) {
    final Color changeColor = changePercentage >= 0 ? Colors.green : Colors.red;
    final IconData changeIcon = changePercentage >= 0 ? Icons.arrow_upward : Icons.arrow_downward;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor, // Tema rengine göre güncelledik
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(symbol, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)), // Tema rengine göre güncelledik
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(changeIcon, color: changeColor, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    '${changePercentage.toStringAsFixed(2)}%',
                    style: TextStyle(color: changeColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Favori ikonunu IconButton ile sarmalıyoruz
          IconButton( // YENİ
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.yellow[600] : Theme.of(context).iconTheme.color, // Tema rengine göre güncelledik
            ),
            onPressed: onFavoriteToggle, // İkona basıldığında callback tetiklenecek
          ),
        ],
      ),
    );
  }
}