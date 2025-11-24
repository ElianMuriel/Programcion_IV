void main() {
  print("Maps iterables en Inmobiliaria");

  final precios = [450, 500, 500, 600, 600, 750, 750, 750, 850, 900, 900];

  print("Lista original de precios: $precios");
  print("Tamaño de la lista: ${precios.length}");
  print("Precio en el índice 4: \$${precios[4]}");
  print("Primer precio de la lista: \$${precios.first}");

  final preciosReverso = precios.reversed;
  print("\nPrecios en reversa: ${precios.reversed}");

  print("Como Lista: ${preciosReverso.toList()}");
  print("Como Set (precios únicos): ${preciosReverso.toSet()}");
}
