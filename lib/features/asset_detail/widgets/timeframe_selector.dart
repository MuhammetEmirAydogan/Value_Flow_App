import 'package:flutter/material.dart';

class TimeframeSelector extends StatefulWidget {
  const TimeframeSelector({super.key});

  @override
  State<TimeframeSelector> createState() => _TimeframeSelectorState();
}

class _TimeframeSelectorState extends State<TimeframeSelector> {
  int _selectedIndex = 0;
  final List<String> _timeframes = ['1D', '7D', '1M', '3M', '1Y', 'ALL'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_timeframes.length, (index) {
          final bool isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
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
              child: Text(_timeframes[index]),
            ),
          );
        }),
      ),
    );
  }
}