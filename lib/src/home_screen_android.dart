import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class HomeScreenAndroid extends StatelessWidget {
  const HomeScreenAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Titulo"),
        backgroundColor: Colors.green,
        actions: [
          Row(
            children: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.person),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'welcome',
                    child: Text('Bienvenido, ${user?.email ?? "Usuario"}')
                  ),
                  const PopupMenuItem(
                    value: 'edit_profile',
                    child: Text('Editar perfil'),
                  ),
                ],
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                onSelected: (value) async {
                  if (value == 'logout') {
                    await FirebaseAuth.instance.signOut();
                    if (!context.mounted) return;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                    );
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'option1',
                    child: Text('Opción 1'),
                  ),
                  const PopupMenuItem(
                    value: 'option2',
                    child: Text('Opción 2'),
                  ),
                  const PopupMenuItem(
                    value: 'option3',
                    child: Text('Opción 3'),
                  ),
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Cerrar sesión'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text("Noticias", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text("Carrusel de imágenes", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
