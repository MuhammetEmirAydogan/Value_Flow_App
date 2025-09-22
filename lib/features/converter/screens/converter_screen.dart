// lib/features/converter/screens/converter_screen.dart
import 'package:flutter/material.dart';
import 'package:value_flow/features/converter/widgets/conversion_card.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ConversionCard(
              label: 'From',
              selectedValue: 'Bitcoin (BTC)',
              amount: '1',
              isInput: true,
            ),
            // İki kart arasındaki değiştirme butonu
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CircleAvatar(
                backgroundColor: const Color(0xFF2D3748),
                child: IconButton(
                  icon: const Icon(Icons.swap_vert, color: Colors.white),
                  onPressed: () {
                    // TODO: Dönüştürme yönünü değiştirme mantığı
                  },
                ),
              ),
            ),
            const ConversionCard(
              label: 'To',
              selectedValue: 'US Dollar (USD)',
              amount: '62,045.87',
            ),
            const Spacer(), // Boşlukları doldurur, butonu aşağı iter
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
      ),
    );
  }
}