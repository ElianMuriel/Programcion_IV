import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderTotalPage extends StatefulWidget {
  const OrderTotalPage({super.key});

  @override
  State<OrderTotalPage> createState() => _OrderTotalPageState();
}

class _OrderTotalPageState extends State<OrderTotalPage> {
  String subtotalText = '';
  String resultText = '';

  void calculateTotal() {
    final subtotal = double.tryParse(subtotalText.replaceAll(',', '.')) ?? 0.0;

    if (subtotal <= 0) {
      setState(() {
        resultText = 'Ingrese un subtotal válido';
      });
      return;
    }

    const ivaRate = 0.12;
    final iva = subtotal * ivaRate;
    final total = subtotal + iva;

    setState(() {
      resultText =
        'Subtotal: \$${subtotal.toStringAsFixed(2)}\n'
        'IVA (12%): \$${iva.toStringAsFixed(2)}\n'
        'Total a pagar: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total con IVA'),
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
              'Calcular',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Precio base del menu',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                subtotalText = value;
              },
            ),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de menus',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                subtotalText = value;
              },
            ),

            DropdownButton<String>(
              value: subtotalText,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Nuevo',
                  child: Text('Cliente nuevo'),

                ),
                DropdownMenuItem(
                  value: 'Frecuente',
                  child: Text('cliente frecuente'),
                  onTap: () {
                    var descuento = 0.08;
                  },
                ),
                DropdownMenuItem(
                  value: 'Corporativo',
                  child: Text('Cliente corporativo'),
                  onTap: () {
                    var descuento = 0.12;
                  },
                ),
              ],
              onChanged: (precio, cantidad) {
                if (precio != null && cantidad != null) return;
                setState(() {
                  subtotalText = precio * cantidad;
                });
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateTotal,
              child: const Text('total con IVA'),
            ),

            ElevatedButton(
              onPressed: calculateTotal,
              child: const Text(''),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/tip'),
              child: const Text('Calcular propina'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/split'),
              child: const Text('Dividir cuenta'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}


 

 