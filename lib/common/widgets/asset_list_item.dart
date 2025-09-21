// lib/common/widgets/asset_list_item.dart
import 'package:flutter/material.dart';

class AssetListItem extends StatelessWidget {
  final String iconUrl; // Şimdilik kullanmayacağız ama ileride lazım olacak
  final String name;
  final String symbol;
  final String price;
  final double changePercentage;
  final bool isFavorite;

  const AssetListItem({
    super.key,
    this.iconUrl = '', // Varsayılan boş değer
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercentage,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    // Yüzdelik değişim için renk belirleme
    final Color changeColor = changePercentage >= 0 ? Colors.green : Colors.red;
    final IconData changeIcon = changePercentage >= 0 ? Icons.arrow_upward : Icons.arrow_downward;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          // Varlık ikonu (şimdilik placeholder)
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            // child: Image.network(iconUrl), // Gerçek ikonlar geldiğinde
          ),
          const SizedBox(width: 12),
          // Varlık Adı ve Sembolü
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(symbol, style: TextStyle(color: Colors.grey[400])),
            ],
          ),
          const Spacer(),
          // Fiyat ve Değişim
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
          // Favori ikonu
          Icon(
            isFavorite ? Icons.star : Icons.star_border,
            color: isFavorite ? Colors.yellow[600] : Colors.grey[400],
          ),
        ],
      ),
    );
  }
}