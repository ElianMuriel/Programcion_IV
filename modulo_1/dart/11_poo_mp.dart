void main() {
  final Propiedad departamento = Propiedad(
    nombre: 'Departamento Bellavista',
    ubicacion: 'Quito, Ecuador'
  );

  print(departamento);
  print("Nombre: ${departamento.nombre}");
  print("Ubicación: ${departamento.ubicacion}");
}

class Propiedad {
  String nombre = "";
  String ubicacion = "";

  Propiedad({ required this.nombre, this.ubicacion = "Ubicación no registrada" });

  @override
  String toString() {
    return "$nombre - $ubicacion";
  }
}
