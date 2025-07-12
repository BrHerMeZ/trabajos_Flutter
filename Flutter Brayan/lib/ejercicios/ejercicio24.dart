void arregloEjercicios() {
  // Lista original de números
  List<int> numeros = [5, 3, 9, 1, 6, 8, 2, 4, 7, 0];

  // Orden ascendente
  print("Orden Ascendente:");
  List<int> ordenAscendente = [...numeros]..sort();
  print(ordenAscendente);

  // Orden descendente
  print("Orden Descendente:");
  List<int> ordenDescendente = [...numeros]..sort((a, b) => b.compareTo(a));
  print(ordenDescendente);
}
