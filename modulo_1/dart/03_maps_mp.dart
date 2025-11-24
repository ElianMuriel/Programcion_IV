void main() {
  print("Ejemplo de Maps en una Inmobiliaria");

  final Map<String, dynamic> propiedad = {
    'titulo': 'Departamento Bellavista',
    'precioMensual': 650,
    'disponible': true,
    'caracteristicas': <String>['2 habitaciones', 'Balcón', 'Parqueadero'],
    'imagenes': {
      1: 'img/depa_frontal.jpg',
      2: 'img/depa_sala.jpg'
    }
  };

  print(propiedad);                        
  print(propiedad['titulo']);
  print(propiedad['imagenes']);
  print(propiedad['disponible']);
  print(propiedad['precioMensual']);
}
