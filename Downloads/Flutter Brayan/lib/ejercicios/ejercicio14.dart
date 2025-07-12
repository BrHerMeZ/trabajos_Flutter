import 'dart:io';

void mostrarTabla(int numero, {int hasta = 10}) {
  print("\n Tabla de multiplicar del $numero:");
  for (var i = 1; i <= hasta; i++) {
    print("$numero × $i = ${numero * i}");
  }
}

void tablaMultiplicarMejorada() {
  stdout.write("👉 Ingrese un número entero: ");
  String? entrada = stdin.readLineSync();

  int? numero = int.tryParse(entrada ?? '');

  if (numero == null) {
    print(" Entrada inválida. Debe ser un número entero.");
    return;
  }

  mostrarTabla(numero);
}
