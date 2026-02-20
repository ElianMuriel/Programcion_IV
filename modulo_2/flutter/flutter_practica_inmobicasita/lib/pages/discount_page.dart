import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  String baseRentText = '';
  String tenantType = 'Nuevo';
  String resultText = '';

  void calculateDiscount() {
    final baseRent = double.tryParse(baseRentText.replaceAll(',', '.')) ?? 0.0;

    if (baseRent <= 0) {
      setState(() {
        resultText = 'Ingrese un valor de alquiler válido';
      });
      return;
    }

    double discount = 0;

    if (tenantType == 'Nuevo') {
      discount = 0;
    } else if (tenantType == 'Recurrente') {
      discount = 5;
    } else if (tenantType == 'Corporativo') {
      discount = 10;
    }

    final discountAmount = baseRent * discount / 100;
    final finalRent = baseRent - discountAmount;

    setState(() {
      resultText =
          'Tipo de inquilino: $tenantType\n'
          'Alquiler base: \$${baseRent.toStringAsFixed(2)}\n'
          'Descuento: ${discount.toStringAsFixed(0)} %\n'
          'Monto descuento: \$${discountAmount.toStringAsFixed(2)}\n'
          'Alquiler final: \$${finalRent.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descuento de alquiler'),
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
              'Descuento por tipo de inquilino',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Alquiler base (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                baseRentText = value;
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: tenantType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Nuevo',
                  child: Text('Inquilino nuevo'),
                ),
                DropdownMenuItem(
                  value: 'Recurrente',
                  child: Text('Inquilino recurrente'),
                ),
                DropdownMenuItem(
                  value: 'Corporativo',
                  child: Text('Empresa / corporativo'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  tenantType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateDiscount,
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
