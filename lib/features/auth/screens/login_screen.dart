// lib/features/auth/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:value_flow/features/auth/screens/register_screen.dart';
import 'package:value_flow/features/dashboard/screens/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo veya Uygulama Adı
              const Text(
                'ValueFlow',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 48.0),

              // E-posta Giriş Alanı
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),

              // Şifre Giriş Alanı
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),

              // Giriş Butonu
              ElevatedButton(
                onPressed: () {
                  // Giriş başarılı olduğunda bu kod çalışacak.
                  // pushReplacement ile giriş ekranını yığından kaldırıp
                  // yerine ana ekranı koyuyoruz. Böylece kullanıcı geri tuşuyla
                  // giriş ekranına dönemiyor.
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 16.0),

              // Kayıt Ol'a Yönlendirme
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigator.push ile yeni bir ekran açıyoruz
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}