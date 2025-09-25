import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const CategoryCard({
    super.key,
    required this.iconPath,
    required this.title,
    this.subtitle = 'View assets',
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 28,
            width: 28,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}