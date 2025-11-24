void main() {
  int meses = 10;
  double totalPagado = 0;
  double rentaMensual = 450;

  for (int i = 1; i <= meses; i++) {
    totalPagado += rentaMensual;
  }

  print("Total pagado por alquilar durante $meses meses es: \$$totalPagado");
}
