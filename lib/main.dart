import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:value_flow/app/theme/app_theme.dart';
import 'package:value_flow/features/auth/screens/login_screen.dart';
import 'package:value_flow/features/dashboard/screens/dashboard_screen.dart';
import 'package:value_flow/providers/alerts_provider.dart';
import 'package:value_flow/providers/auth_provider.dart';
import 'package:value_flow/providers/assets_provider.dart';
import 'package:value_flow/providers/theme_provider.dart';
import 'package:value_flow/providers/converter_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AssetsProvider()),
        ChangeNotifierProvider(create: (_) => ConverterProvider()),
        ChangeNotifierProvider(create: (_) => AlertsProvider()),
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