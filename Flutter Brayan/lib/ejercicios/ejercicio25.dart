import 'dart:io';

void vectorOrdenado() {
  stdout.write("¿Cuántos elementos quieres ingresar? ");
  int cantidad = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];

  // Ingreso de números
  for (int i = 0; i < cantidad; i++) {
    stdout.write("Número ${i + 1}: ");
    int numero = int.parse(stdin.readLineSync()!);
    numeros.add(numero);
  }

  // Pregunta por el orden
  stdout.write("¿Quieres orden ascendente (a) o descendente (d)? ");
  String orden = stdin.readLineSync()!.toLowerCase();

  // Validación y ordenamiento
  if (orden == 'a') {
    numeros.sort();
    print("Vector ordenado ascendentemente: $numeros");
  } else if (orden == 'd') {
    numeros.sort((a, b) => b.compareTo(a));
    print("Vector ordenado descendentemente: $numeros");
  } else {
    print("Opción no válida. Usa 'a' para ascendente o 'd' para descendente.");
  }
}
