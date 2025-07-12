import 'dart:io';
import 'dart:math';

double leerNumero(String mensaje) {
  stdout.write(mensaje);
  return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
}

void calcularTriangulo() {
  double base = leerNumero("Base: ");
  double altura = leerNumero("Altura: ");
  double lado1 = leerNumero("Lado 1: ");
  double lado2 = leerNumero("Lado 2: ");
  double lado3 = leerNumero("Lado 3: ");

  double area = (base * altura) / 2;
  double perimetro = lado1 + lado2 + lado3;

  print("Área del triángulo: $area unidades²");
  print("Perímetro del triángulo: $perimetro unidades");
}

void calcularRectangulo() {
  double largo = leerNumero("Largo: ");
  double ancho = leerNumero("Ancho: ");

  double area = largo * ancho;
  double perimetro = 2 * (largo + ancho);

  print("Área del rectángulo: $area unidades²");
  print("Perímetro del rectángulo: $perimetro unidades");
}

void calcularCirculo() {
  double radio = leerNumero("Radio: ");

  double area = pi * pow(radio, 2);
  double perimetro = 2 * pi * radio;

  print("Área del círculo: ${area.toStringAsFixed(2)} unidades²");
  print("Perímetro del círculo: ${perimetro.toStringAsFixed(2)} unidades");
}

void menuFigurasModular() {
  print("Seleccione una figura:");
  print("1. Triángulo");
  print("2. Rectángulo");
  print("3. Círculo");

  int opcion = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  switch (opcion) {
    case 1:
      calcularTriangulo();
      break;
    case 2:
      calcularRectangulo();
      break;
    case 3:
      calcularCirculo();
      break;
    default:
      print("Opción inválida.");
  }
}
