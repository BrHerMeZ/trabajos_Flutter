void vectorBasico() {
  List<int> numeros = List.generate(10, (index) => index + 1);

  print("Contenido del vector:");
  for (int i = 0; i < numeros.length; i++) {
    print("Índice $i = ${numeros[i]}");
  }
}
