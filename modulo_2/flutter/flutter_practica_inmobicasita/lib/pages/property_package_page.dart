import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PropertyPackagePage extends StatefulWidget {
  const PropertyPackagePage({super.key});

  @override
  State<PropertyPackagePage> createState() => _PropertyPackagePageState();
}

class _PropertyPackagePageState extends State<PropertyPackagePage> {
  String packageType = 'Básico';
  String resultText = '';

  void showPackageInfo() {
    double extra = 0;
    String description;

    if (packageType == 'Básico') {
      extra = 0;
      description = 'Propiedad sin amoblar, solo arriendo estándar.';
    } else if (packageType == 'Amoblado') {
      extra = 80;
      description = 'Incluye muebles básicos y línea blanca.';
    } else {
      extra = 150;
      description = 'Propiedad amoblada premium, incluye servicios y mantenimiento.';
    }

    setState(() {
      resultText =
          'Paquete: $packageType\n'
          'Cargo adicional aproximado: \$${extra.toStringAsFixed(2)}\n'
          'Incluye: $description';
    });
  }

  @override
  void initState() {
    super.initState();
    showPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paquetes de propiedad'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione un paquete de propiedad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: packageType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Propiedad básica'),
                ),
                DropdownMenuItem(
                  value: 'Amoblado',
                  child: Text('Propiedad amoblada'),
                ),
                DropdownMenuItem(
                  value: 'Premium',
                  child: Text('Propiedad premium'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  packageType = value;
                  showPackageInfo();
                });
              },
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
