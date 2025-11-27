import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DailyIncomePage extends StatefulWidget {
  const DailyIncomePage({super.key});

  @override
  State<DailyIncomePage> createState() => _DailyIncomePageState();
}

class _DailyIncomePageState extends State<DailyIncomePage> {
  String servicesCountText = '';
  int servicesCount = 0;

  final List<TextEditingController> amountControllers = [];
  String resultText = '';

  void _generateServices() {
    final parsed = int.tryParse(servicesCountText) ?? 0;

    if (parsed <= 0 || parsed > 20) {
      setState(() {
        resultText = 'Ingrese una cantidad de servicios entre 1 y 20.';
        servicesCount = 0;
        amountControllers.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La cantidad de servicios debe estar entre 1 y 20'),
        ),
      );
      return;
    }

    servicesCount = parsed;
    amountControllers.clear();

    for (int i = 0; i < servicesCount; i++) {
      amountControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese el monto de cada servicio o renta.';
    });
  }

  void _calculateDailyIncome() {
    if (servicesCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Primero indique cuántos servicios hubo y genere la lista.'),
        ),
      );
      return;
    }

    double total = 0;
    final List<String> lines = [];

    for (int i = 0; i < servicesCount; i++) {
      final raw = amountControllers[i].text.trim();
      final amount = double.tryParse(raw.replaceAll(',', '.')) ?? 0.0;

      total += amount;

      lines.add(
        'Servicio ${i + 1}: \$${amount.toStringAsFixed(2)}',
      );
    }

    String dayType;
    if (total < 200) {
      dayType = 'Día flojo';
    } else if (total <= 500) {
      dayType = 'Día aceptable';
    } else {
      dayType = 'Día excelente';
    }

    setState(() {
      resultText =
          'Montos registrados:\n'
          '${lines.join('\n')}\n\n'
          'Total del día: \$${total.toStringAsFixed(2)}\n'
          'Resumen: $dayType';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cálculo de ventas completado.'),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in amountControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de ventas diarias'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Taller / Renta de autos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de servicios/rentas en el día',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  servicesCountText = value;
                },
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _generateServices,
                child: const Text('Generar servicios'),
              ),

              const SizedBox(height: 16),

              if (servicesCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: servicesCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: amountControllers[index],
                          decoration: InputDecoration(
                            labelText: 'Monto servicio ${index + 1} (\$)',
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),

              if (servicesCount > 0)
                ElevatedButton(
                  onPressed: _calculateDailyIncome,
                  child: const Text('Calcular resumen del día'),
                ),

              const SizedBox(height: 16),

              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
