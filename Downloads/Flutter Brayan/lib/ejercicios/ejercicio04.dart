import 'dart:io';

double pedirNumero(String mensaje) {
  stdout.write(mensaje);
  return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
}

void realizarResta() {
  double num1 = pedirNumero("Ingrese el primer número: ");
  double num2 = pedirNumero("Ingrese el segundo número: ");
  double diferencia = num1 - num2;

  print("La diferencia del número $num1 con el número $num2 es: $diferencia");
}
