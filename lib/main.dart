import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/app/theme/app_theme.dart';
import 'package:value_flow/features/auth/screens/login_screen.dart';
import 'package:value_flow/features/dashboard/screens/dashboard_screen.dart';
import 'package:value_flow/providers/auth_provider.dart';
import 'package:value_flow/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, ThemeProvider>(
      builder: (context, auth, theme, child) {
        return MaterialApp(
          title: 'ValueFlow',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: theme.themeMode,
          home: auth.isLoggedIn ? const DashboardScreen() : const LoginScreen(),
        );
      },
    );
  }
}