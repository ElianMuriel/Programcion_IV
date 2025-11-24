void main() {
  int habitaciones = 2;

  if (habitaciones > 2) {
    print('La propiedad tiene más de 2 habitaciones');
  }

  if (habitaciones < 2) {
    print('La propiedad tiene menos de 2 habitaciones');
  }

  if (habitaciones == 2) {
    print('La propiedad tiene exactamente 2 habitaciones');
  }

  if (habitaciones > 2) {
    print('Propiedad amplia (más de 2 habitaciones)');
  } else {
    print('Propiedad estándar (hasta 2 habitaciones)');
  }

  if (habitaciones == 2) {
    print('Coincide con la característica buscada: 2 habitaciones');
  } else {
    print('No coincide con la característica de 2 habitaciones');
  }
}
