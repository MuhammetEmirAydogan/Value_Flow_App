// lib/features/dashboard/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:value_flow/features/home/screens/home_screen.dart'; // Birazdan oluşturacağız

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Hangi sekmenin seçili olduğunu takip eden değişken
  int _selectedIndex = 0;

  // Alt menüdeki sekmelere karşılık gelen ekranların listesi
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(), // Ana Sayfa
    const Text('Favorites Screen', style: TextStyle(color: Colors.white)), // Favoriler (Şimdilik boş)
    const Text('Converter Screen', style: TextStyle(color: Colors.white)), // Dönüştürücü (Şimdilik boş)
    const Text('Alerts Screen', style: TextStyle(color: Colors.white)),    // Alarmlar (Şimdilik boş)
    const Text('Settings Screen', style: TextStyle(color: Colors.white)),  // Ayarlar (Şimdilik boş)
  ];

  // Bir sekmeye tıklandığında bu fonksiyon çalışır
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Converter'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Tema Ayarları
        type: BottomNavigationBarType.fixed, // 4'ten fazla item için bu gerekli
        backgroundColor: const Color(0xFF2D3748), // Menü arkaplanı
        selectedItemColor: Theme.of(context).primaryColor, // Seçili ikon rengi
        unselectedItemColor: Colors.grey[400], // Seçili olmayan ikon rengi
        showUnselectedLabels: false, // Seçili olmayan etiketleri gizle
        showSelectedLabels: false,
      ),
    );
  }
}