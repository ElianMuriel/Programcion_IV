void main() {
  print(welcomeClient());
  print(calcularPrecioTotal(400, 50));
  print(calcularDescuento(500, 50));
  print(calcularDescuento(600));
  print(saludarCliente(nombre: "Elian", mensaje: "Gracias por elegirnos"));
  print(saludarCliente(nombre: "Elian"));
}

String welcomeClient() => 'Bienvenido a inmobiCasita, su inmobiliaria de confianza';

int calcularPrecioTotal(int renta, int alicuota) => renta + alicuota;

int calcularDescuento(int precio, [int descuento = 0]) {
  return precio - descuento;
}

String saludarCliente({required String nombre, String mensaje = "¡Hola!"}) {
  return '$mensaje $nombre';
}
