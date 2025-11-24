void main() {
  int precio = 450;

  if (precio > 600) {
    print('Propiedad de alto costo');
  } else if (precio < 300) {
    print('Propiedad económica');
  } else {
    print('Propiedad de precio promedio');
  }

  int ingresoCliente = 700;
  String posibleContrato = ingresoCliente >= precio 
    ? 'Cliente apto para alquiler'
    : 'Cliente no cumple con el ingreso necesario';

  print(posibleContrato);
}
