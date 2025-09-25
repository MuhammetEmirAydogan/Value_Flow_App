import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:value_flow/features/home/screens/home_screen.dart';
import 'package:value_flow/features/favorites/screens/favorites_screen.dart';
import 'package:value_flow/features/converter/screens/converter_screen.dart';
import 'package:value_flow/features/alerts/screens/alerts_screen.dart';
import 'package:value_flow/features/settings/screens/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    ConverterScreen(),
    AlertsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;
    final Color unselectedColor = Colors.grey[400]!;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset('assets/icons/home.svg', colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn)),
            activeIcon: SvgPicture.asset('assets/icons/home.svg', colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: SvgPicture.asset('assets/icons/star.svg', colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn)),
            activeIcon: SvgPicture.asset('assets/icons/star.svg', colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: 'Converter',
            icon: SvgPicture.asset('assets/icons/converter.svg', colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn)),
            activeIcon: SvgPicture.asset('assets/icons/converter.svg', colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: 'Alerts',
            icon: SvgPicture.asset('assets/icons/bell.svg', colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn)),
            activeIcon: SvgPicture.asset('assets/icons/bell.svg', colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: SvgPicture.asset('assets/icons/cog.svg', colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn)),
            activeIcon: SvgPicture.asset('assets/icons/cog.svg', colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn)),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}