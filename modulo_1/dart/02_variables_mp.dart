void main() {
  print("Tipos de Variables en una Inmobiliaria con Dart");


  final String nombrePropiedad = "Departamento Bellavista";
  print(nombrePropiedad);

  String agente = 'Carlos';
  agente = 'María';
  print("Agente asignado: $agente");

  const String ciudad = "Quito";
  print("Ciudad: $ciudad");

  bool disponible = true;
  print("¿Está disponible?: $disponible");

  int precioMensual = 650;
  print("Precio mensual: $precioMensual USD");

  List<String> caracteristicas = ["2 habitaciones", "Balcón", "Parqueadero"];
  print("Características: $caracteristicas");

  final imagenes = <String>[
    "img/depa_frontal.jpg",
    "img/depa_sala.jpg"
  ];
  print("Imágenes: $imagenes");

  print("\nImpresión en múltiples líneas:");
  print("""
  Propiedad: $nombrePropiedad
  Ciudad: $ciudad
  Disponible: $disponible
  Precio: $precioMensual USD
  Características: $caracteristicas
  Imágenes: $imagenes
  """);
}
