void main() {
  int n = 12;
  int tabla = 5;
  int i=0;
  print("Tabla del $tabla");
  while (i<n){
    i++;
    print("$i * $tabla = ${i*tabla}");
  }
  i=1;
  do{
    print("$i * $tabla = ${i*tabla}");
    i++;
  } while(i<n);
}
