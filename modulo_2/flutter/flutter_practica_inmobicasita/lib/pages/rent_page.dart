import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  String monthlyRentText = '';
  String monthsText = '';
  String resultText = '';

  void calculateRent() {
    final monthly = double.tryParse(monthlyRentText.replaceAll(',', '.')) ?? 0.0;
    final months = int.tryParse(monthsText) ?? 0;

    if (monthly <= 0 || months <= 0) {
      setState(() {
        resultText = 'Ingrese un monto mensual y meses válidos';
      });
      return;
    }

    final total = monthly * months;

    String tipoContrato;
    if (months < 6) {
      tipoContrato = 'Contrato corto';
    } else if (months <= 12) {
      tipoContrato = 'Contrato estándar';
    } else {
      tipoContrato = 'Contrato a largo plazo';
    }

    setState(() {
      resultText =
          'Alquiler mensual: \$${monthly.toStringAsFixed(2)}\n'
          'Meses de contrato: $months\n'
          'Total a pagar: \$${total.toStringAsFixed(2)}\n'
          'Tipo de contrato: $tipoContrato';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de alquiler'),
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
              'Contrato de arriendo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Alquiler mensual (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                monthlyRentText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de meses',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                monthsText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateRent,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
