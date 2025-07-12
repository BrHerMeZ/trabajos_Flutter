import 'dart:io';

double leerNumero(String mensaje) {
  stdout.write(mensaje);
  return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
}

void realizarDivisionSegura() {
  double numerador = leerNumero("Ingrese el numerador: ");
  double denominador = leerNumero("Ingrese el denominador: ");

  if (denominador == 0) {
    print("Imposible la división por 0, parcero.");
  } else {
    double resultado = numerador / denominador;
    print("La división del número $numerador entre el número $denominador es: $resultado");
  }
}
