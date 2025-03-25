import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:academic/services/auth_check.dart';

// 🔹 Configuración para Web
const FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyCWdLyLMTOW_DvfQoIRImcVvbYase15qyo",
  authDomain: "academic-dbb22.firebaseapp.com",
  projectId: "academic-dbb22",
  storageBucket: "academic-dbb22.firebasestorage.app",
  messagingSenderId: "380921306547",
  appId: "1:380921306547:web:24c0eabba33a4e7f6d7fc6",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 Inicializar Firebase para diferentes plataformas
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.android)
          ? null
          : firebaseOptions,
    );
  }

  // 🔹 Cambiar el título de la pestaña en Flutter Web
  if (kIsWeb) {
    SystemChrome.setApplicationSwitcherDescription(
      const ApplicationSwitcherDescription(
        label: 'Academic', // Nombre en la pestaña
        primaryColor: 0xFF42A5F5, // Color del tema
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Aplicación Académica', // 🔹 También cambia el título aquí
      home: const AuthCheck(),
    );
  }
}
