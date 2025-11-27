import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LicenciaPage extends StatefulWidget {
  const LicenciaPage({super.key});

  @override
  State<LicenciaPage> createState() => _LicenciaPageState();
}

class _LicenciaPageState extends State <LicenciaPage> {
  String edadTexto = '';
  String resultText = '';
  String tipoEdad = 'Adulto (18+)';

  void verificarLicencia() {
    final edad = int.tryParse(edadTexto) ?? 0;

    if (edad <= 0) {
      setState(() {
        resultText = 'Ingrese una edad válida';
      });
      return;
    }

    String estadoLicencia = '';

    if (edad >= 18) {
      estadoLicencia = ' \u2714 La persona SÍ puede tener licencia (mayor de edad)';
    } else {
      estadoLicencia = ' \u2716 La persona NO puede tener licencia (menor de edad)';
    }

    setState(() {
      resultText =
          'Edad ingresada: $edad años\n'
          '$estadoLicencia';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificación de licencia'),
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
              'Verificar si puede tener licencia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Dropdown similar
            DropdownButton<String>(
              value: tipoEdad,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Adulto (18+)',
                  child: Text('Adulto (mayor de 18)'),
                ),
                DropdownMenuItem(
                  value: 'Menor (<18)',
                  child: Text('Menor de edad'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  tipoEdad = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                edadTexto = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: verificarLicencia,
              child: const Text('Verificar'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
