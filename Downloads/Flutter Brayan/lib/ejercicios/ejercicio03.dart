import 'dart:io';

double leerNumero(String mensaje) {
  stdout.write(mensaje);
  return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
}

void realizarSuma() {
  double num1 = leerNumero("Ingrese el primer número: ");
  double num2 = leerNumero("Ingrese el segundo número: ");
  double resultado = num1 + num2;

  print("La suma del número $num1 con el número $num2 es: $resultado");
}
