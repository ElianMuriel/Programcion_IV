import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RealEstateHomePage extends StatelessWidget {
  const RealEstateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Inmobiliaria')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/rent'),
              child: const Text('Cálculo de alquiler'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/discount'),
              child: const Text('Descuento por tipo de inquilino'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/package'),
              child: const Text('Paquetes de gestión de propiedad'),
            ),
          ],
        ),
      ),
    );
  }
}
