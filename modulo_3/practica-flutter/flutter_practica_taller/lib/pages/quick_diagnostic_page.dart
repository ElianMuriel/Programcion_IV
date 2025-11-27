import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickDiagnostickPage extends StatefulWidget {
  const QuickDiagnostickPage({super.key});

  @override
  State<QuickDiagnostickPage> createState() => _QuickDiagnostickPageState();
}

class _QuickDiagnostickPageState extends State<QuickDiagnostickPage> {
  String? selectedSymptom;
  String kmText = '';
  String resultText = '';

  final List<String> symptoms = [
    'Vibración al frenar',
    'Humo azul del escape',
    'Ralentí inestable',
    'Ruido metálico al arrancar',
  ];

  void showDiagnosis() {
    if (selectedSymptom == null) {
      setState(() {
        resultText = 'Seleccione un síntoma.';
      });
      return;
    }

    final km = int.tryParse(kmText) ?? -1;
    if (km < 0) {
      setState(() {
        resultText = 'Ingrese un número de kilómetros válido.';
      });
      return;
    }

    // Clasificación según kilómetros
    String severity;
    if (km <= 5000) {
      severity = 'Moderado';
    } else if (km <= 15000) {
      severity = 'Importante';
    } else {
      severity = 'Crítico';
    }

    // Problema probable según síntoma
    String probableIssue;
    switch (selectedSymptom) {
      case 'Vibración al frenar':
        probableIssue =
            'Posible desgaste de discos o pastillas de freno, o llantas desequilibradas.';
        break;
      case 'Humo azul del escape':
        probableIssue =
            'Posible consumo excesivo de aceite por desgaste de aros de pistón o retenes de válvulas.';
        break;
      case 'Ralentí inestable':
        probableIssue =
            'Posible suciedad en cuerpo de aceleración, bujías desgastadas o problema en sistema de inyección.';
        break;
      case 'Ruido metálico al arrancar':
        probableIssue =
            'Posible desgaste en motor de arranque, cadena/correa de distribución o taqués del motor.';
        break;
      default:
        probableIssue = 'No se pudo determinar el problema probable.';
    }

    // Recomendación según gravedad
    String recommendation;
    if (severity == 'Moderado') {
      recommendation =
          'Se recomienda agendar una revisión preventiva en los próximos días.';
    } else if (severity == 'Importante') {
      recommendation =
          'Se recomienda traer el vehículo al taller esta semana para un diagnóstico completo.';
    } else {
      recommendation =
          'Se recomienda no seguir conduciendo y traer el vehículo al taller lo antes posible.';
    }

    setState(() {
      resultText =
          'Síntoma: $selectedSymptom\n'
          'Kilómetros desde el último mantenimiento: $km km\n'
          'Gravedad estimada: $severity\n\n'
          'Problema probable:\n$probableIssue\n\n'
          'Recomendación del taller:\n$recommendation';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnóstico rápido'),
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
                'Diagnóstico rápido del vehículo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Dropdown de síntoma
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Síntoma principal',
                  border: OutlineInputBorder(),
                ),
                value: selectedSymptom,
                items: symptoms
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(s),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSymptom = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Input de kilómetros
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Kilómetros desde el último mantenimiento',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  kmText = value;
                },
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: showDiagnosis,
                child: const Text('Ver diagnóstico'),
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
