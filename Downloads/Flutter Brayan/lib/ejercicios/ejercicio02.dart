import 'dart:io';

String leerTexto(String mensaje) {
  stdout.write(mensaje);
  return stdin.readLineSync() ?? '';
}

int leerEntero(String mensaje) {
  return int.tryParse(leerTexto(mensaje)) ?? 0;
}

double leerDecimal(String mensaje) {
  return double.tryParse(leerTexto(mensaje)) ?? 0.0;
}

bool leerBool(String mensaje) {
  String respuesta = leerTexto(mensaje).toLowerCase();
  return respuesta == 'si' || respuesta == 'sí';
}

void variablesEntradaModular() {
  String nombre = leerTexto("Ingrese su nombre: ");
  String sexo = leerTexto("Ingrese su sexo: ");
  int edad = leerEntero("Ingrese su edad: ");
  double salario = leerDecimal("Ingrese su salario: ");
  bool tieneVehiculo = leerBool("¿Tiene vehículo? (si/no): ");

  print("Nombre: $nombre");
  print("Sexo: $sexo");
  print("Edad: $edad");
  print("Salario: \$${salario.toStringAsFixed(2)}");
  print("¿Tiene vehículo?: ${tieneVehiculo ? 'Sí' : 'No'}");
}
