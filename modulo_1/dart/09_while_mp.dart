void main() {
  int meses = 12;
  int cuota = 350;
  int i = 0;

  print("Pagos mensuales por alquiler de \$$cuota");

  while (i < meses) {
    i++;
    print("Mes $i → Pago: \$$cuota");
  }

  i = 1;
  print("\nUsando do-while:");

  do {
    print("Mes $i → Pago: \$$cuota");
    i++;
  } while (i <= meses);
}
