import 'dart:io';

double leerValor(String mensaje) {
  double? valor;
  do {
    stdout.write(mensaje);
    valor = double.tryParse(stdin.readLineSync() ?? '');
    if (valor == null || valor <= 0) {
      print("Por favor, ingrese un valor positivo válido.");
    }
  } while (valor == null || valor <= 0);
  return valor;
}

void tipoPorLados() {
  double a = leerValor("Lado 1: ");
  double b = leerValor("Lado 2: ");
  double c = leerValor("Lado 3: ");

  if (a + b <= c || a + c <= b || b + c <= a) {
    print("No es un triángulo válido.");
    return;
  }

  if (a == b && b == c) {
    print("Triángulo equilátero");
  } else if (a == b || b == c || a == c) {
    print("Triángulo isósceles");
  } else {
    print("Triángulo escaleno");
  }
}

void tipoPorAngulos() {
  double a1 = leerValor("Ángulo 1: ");
  double a2 = leerValor("Ángulo 2: ");
  double a3 = leerValor("Ángulo 3: ");

  double suma = a1 + a2 + a3;

  if (suma != 180) {
    print("No es un triángulo válido. La suma debe ser 180°.");
    return;
  }

  if (a1 == 90 || a2 == 90 || a3 == 90) {
    print("Triángulo rectángulo");
  } else if (a1 < 90 && a2 < 90 && a3 < 90) {
    print("Triángulo acutángulo");
  } else {
    print("Triángulo obtusángulo");
  }
}

void tipoTrianguloModular() {
  print("¿Desea ingresar lados (1) o ángulos (2)?");
  int opcion = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  switch (opcion) {
    case 1:
      tipoPorLados();
      break;
    case 2:
      tipoPorAngulos();
      break;
    default:
      print("Opción no válida.");
  }
}
