void main() {
  print("Operaciones Aritméticas en una Inmobiliaria");

  final double precioMetro = 850.75;
  final double area = 60;

  print("Precio por m²: \$$precioMetro");
  print("Área del inmueble: $area m²\n");

  // Cálculos
  print("Suma (Ejemplo: agregar impuestos) \$$precioMetro + \$50 = ${precioMetro + 50}");
  print("Resta (Ejemplo: descuento aplicado) \$$precioMetro - \$30 = ${precioMetro - 30}");
  print("Multiplicación (Precio Total) $precioMetro * $area = ${precioMetro * area}");
  print("División (Costo dividido entre áreas iguales) $precioMetro / 2 = ${precioMetro / 2}");
}
