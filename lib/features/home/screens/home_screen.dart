// lib/features/home/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:value_flow/features/home/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Başlık Alanı
              const Text('ValueFlow', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Welcome back, \nSelect a category to start tracking.', style: TextStyle(fontSize: 16, color: Colors.grey[400])),
              const SizedBox(height: 32),

              // Kategori Kartları
              const CategoryCard(
                icon: Icons.shield_outlined, // Gerçek ikonlar sonra eklenecek
                title: 'Precious Metals',
              ),
              const SizedBox(height: 16),
              const CategoryCard(
                icon: Icons.monetization_on_outlined,
                title: 'Currencies',
              ),
              const SizedBox(height: 16),
              const CategoryCard(
                icon: Icons.donut_small_outlined,
                title: 'Cryptocurrencies',
              ),
              const SizedBox(height: 16),
              const CategoryCard(
                icon: Icons.local_fire_department_outlined,
                title: 'Energy & Commodities',
              ),
            ],
          ),
        ),
      ),
    );
  }
}