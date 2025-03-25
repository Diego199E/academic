import 'package:academic/src/home_screen_android.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../src/login_screen.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // 🔄 Pantalla de carga
        } else if (snapshot.hasData) {
          return const HomeScreenAndroid(); // ✅ Usuario autenticado
        } else {
          return const LoginScreen(); // ❌ No hay sesión iniciada
        }
      },
    );
  }
}
