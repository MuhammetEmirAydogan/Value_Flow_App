import 'package:flutter/material.dart';

class AssetListItem extends StatelessWidget {
  final String iconUrl;
  final String name;
  final String symbol;
  final String price;
  final double changePercentage;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const AssetListItem({
    super.key,
    required this.iconUrl,
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercentage,
    this.isFavorite = false,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final Color changeColor = changePercentage >= 0 ? Colors.green : Colors.red;
    final IconData changeIcon = changePercentage >= 0 ? Icons.arrow_upward : Icons.arrow_downward;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(iconUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 4),
                Text(symbol.toUpperCase(), style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
              ],
            ),
          ),
          const SizedBox(width: 8),
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
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.yellow[600] : Theme.of(context).iconTheme.color,
            ),
            onPressed: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}