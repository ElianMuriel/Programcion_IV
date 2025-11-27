import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TipsCalculatorPage extends StatefulWidget {
  const TipsCalculatorPage({super.key});

  @override
  State<TipsCalculatorPage> createState() => _TipsCalculatorPageState();
}

class _TipsCalculatorPageState extends State<TipsCalculatorPage> {
  String tablesCountText = '';
  int tablesCount = 0;

  final List<TextEditingController> consumptionControllers = [];

  double? selectedTipPercent;
  String resultText = '';

  final List<double> tipOptions = [0.10, 0.12, 0.15];

  void _generateTables() {
    final parsed = int.tryParse(tablesCountText) ?? 0;

    if (parsed <= 0 || parsed > 10) {
      setState(() {
        resultText = 'Ingrese una cantidad de mesas entre 1 y 10';
        tablesCount = 0;
        consumptionControllers.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La cantidad de mesas debe estar entre 1 y 10'),
        ),
      );
      return;
    }

    tablesCount = parsed;
    consumptionControllers.clear();

    for (int i = 0; i < tablesCount; i++) {
      consumptionControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese el consumo para cada mesa.';
    });
  }

  void _calculateTips() {
    if (tablesCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Primero indique cuántas mesas atendió y genere el formulario.'),
        ),
      );
      return;
    }

    if (selectedTipPercent == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seleccione un porcentaje de propina.'),
        ),
      );
      return;
    }

    double totalConsumption = 0;
    double totalTips = 0;
    final List<String> lines = [];

    for (int i = 0; i < tablesCount; i++) {
      final raw = consumptionControllers[i].text.trim();
      final consumption =
          double.tryParse(raw.replaceAll(',', '.')) ?? 0.0;

      final tip = consumption * selectedTipPercent!;

      totalConsumption += consumption;
      totalTips += tip;

      lines.add(
        'Mesa ${i + 1}: Consumo \$${consumption.toStringAsFixed(2)} '
        '- Propina \$${tip.toStringAsFixed(2)}',
      );
    }

    setState(() {
      resultText =
          'Propinas por mesa:\n'
          '${lines.join('\n')}\n\n'
          'Total consumido: \$${totalConsumption.toStringAsFixed(2)}\n'
          'Total de propinas: \$${totalTips.toStringAsFixed(2)}';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cálculo de propinas completado.'),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in consumptionControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de propinas'),
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
                'Calculadora de propinas por mesa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Número de mesas atendidas (1 - 10)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tablesCountText = value;
                },
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _generateTables,
                child: const Text('Generar mesas'),
              ),

              const SizedBox(height: 16),

              if (tablesCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tablesCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: consumptionControllers[index],
                          decoration: InputDecoration(
                            labelText: 'Consumo mesa ${index + 1} (\$)',
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),

              DropdownButtonFormField<double>(
                decoration: const InputDecoration(
                  labelText: 'Porcentaje de propina',
                  border: OutlineInputBorder(),
                ),
                value: selectedTipPercent,
                items: tipOptions
                    .map(
                      (p) => DropdownMenuItem<double>(
                        value: p,
                        child: Text('${(p * 100).toInt()} %'),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTipPercent = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              if (tablesCount > 0)
                ElevatedButton(
                  onPressed: _calculateTips,
                  child: const Text('Calcular propinas'),
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
