import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/app/theme/app_theme.dart';
import 'package:value_flow/features/auth/screens/login_screen.dart';
import 'package:value_flow/features/dashboard/screens/dashboard_screen.dart';
import 'package:value_flow/providers/auth_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueFlow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return auth.isLoggedIn ? const DashboardScreen() : const LoginScreen();
        },
      ),
    );
  }
}