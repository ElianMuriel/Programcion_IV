import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlignmentBalancePage extends StatefulWidget {
  const AlignmentBalancePage({super.key});

  @override
  State<AlignmentBalancePage> createState() => _AlignmentBalancePageState();
}

class _AlignmentBalancePageState extends State<AlignmentBalancePage> {
  String? selectedVehicle;
  String? selectedService;
  String tiresText = '';
  String resultText = '';

  // Listas para los dropdowns
  final List<String> vehicleTypes = ['Auto', 'Camioneta', 'Camión'];
  final List<String> serviceTypes = [
    'Solo alineación',
    'Solo balanceo',
    'Ambos', // Alineación y balanceo
  ];

  void calculateTotal() {
    // Validaciones básicas
    if (selectedVehicle == null || selectedService == null) {
      setState(() {
        resultText = 'Seleccione tipo de vehículo y tipo de servicio.';
      });
      return;
    }

    final tires = int.tryParse(tiresText) ?? 0;
    if (tires < 2 || tires > 6) {
      setState(() {
        resultText = 'Ingrese una cantidad de llantas válida (entre 2 y 6).';
      });
      return;
    }

    // Tarifas base por tipo de vehículo
    double baseRate;
    switch (selectedVehicle) {
      case 'Auto':
        baseRate = 10;
        break;
      case 'Camioneta':
        baseRate = 15;
        break;
      case 'Camión':
        baseRate = 25;
        break;
      default:
        baseRate = 0;
    }

    // Costo por llanta según tipo de servicio
    double tireCost;
    switch (selectedService) {
      case 'Solo alineación':
        tireCost = 8;
        break;
      case 'Solo balanceo':
        tireCost = 5;
        break;
      case 'Ambos': // Alineación y balanceo
        tireCost = 12;
        break;
      default:
        tireCost = 0;
    }

    final total = baseRate + (tireCost * tires);

    // Clasificación del trabajo
    String classification;
    if (total < 50) {
      classification = 'Trabajo pequeño';
    } else if (total <= 100) {
      classification = 'Trabajo medio';
    } else {
      classification = 'Trabajo grande';
    }

    setState(() {
      resultText =
          'Tipo de vehículo: $selectedVehicle\n'
          'Tipo de servicio: $selectedService\n'
          'Cantidad de llantas: $tires\n'
          'Tarifa base: \$${baseRate.toStringAsFixed(2)}\n'
          'Costo por llanta: \$${tireCost.toStringAsFixed(2)}\n'
          'Total a pagar: \$${total.toStringAsFixed(2)}\n'
          'Clasificación: $classification';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alineación y balanceo'),
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
                'Cálculo de alineación y balanceo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Tipo de vehículo
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipo de vehículo',
                  border: OutlineInputBorder(),
                ),
                value: selectedVehicle,
                items: vehicleTypes
                    .map(
                      (v) => DropdownMenuItem(
                        value: v,
                        child: Text(v),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedVehicle = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Tipo de servicio
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipo de servicio',
                  border: OutlineInputBorder(),
                ),
                value: selectedService,
                items: serviceTypes
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(s),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedService = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Cantidad de llantas
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de llantas (2 - 6)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tiresText = value;
                },
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: calculateTotal,
                child: const Text('Calcular'),
              ),

              const SizedBox(height: 16),

              Text(
                resultText,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
