import 'package:flutter/material.dart';

class TimeframeSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTimeframeSelected;
  final List<String> timeframes;

  const TimeframeSelector({
    super.key,
    required this.selectedIndex,
    required this.onTimeframeSelected,
    required this.timeframes,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(timeframes.length, (index) {
          final bool isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () => onTimeframeSelected(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).inputDecorationTheme.fillColor,
                foregroundColor: isSelected
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyLarge?.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(timeframes[index]),
            ),
          );
        }),
      ),
    );
  }
}