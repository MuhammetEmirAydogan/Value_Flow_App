// lib/features/converter/widgets/conversion_card.dart
import 'package:flutter/material.dart';

class ConversionCard extends StatelessWidget {
  final String label;
  final String selectedValue;
  final String amount;
  final bool isInput;

  const ConversionCard({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.amount,
    this.isInput = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[400])),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Varlık Seçim Alanı
              Expanded(
                flex: 3, // Yazı alanı daha geniş olabileceği için flex oranını artırdık
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A202C),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // <-- DEĞİŞİKLİK BURADA
                      // Text widget'ını Expanded ile sardık, böylece uzun yazılar sığıyor.
                      Expanded(
                        child: Text(
                          selectedValue,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis, // Sığmazsa sonuna ... koy
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Miktar Alanı
              Expanded(
                flex: 2, // <-- VE BURADA (Buranın flex oranını düşürdük)
                child: isInput
                    ? const TextField(
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '1',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
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