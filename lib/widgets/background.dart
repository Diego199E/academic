import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        Positioned.fill(
          child: Image.asset(
            'assets/images/fondo.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // Capa oscura para mejorar legibilidad
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        // Contenido de la pantalla
        child,
      ],
    );
  }
}
