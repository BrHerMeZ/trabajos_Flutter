import 'dart:io';
import 'dart:math';

double leerNumero(String mensaje) {
  stdout.write(mensaje);
  return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
}

void suma() {
  double a = leerNumero("A: ");
  double b = leerNumero("B: ");
  print("Resultado: ${a + b}");
}

void resta() {
  double a = leerNumero("A: ");
  double b = leerNumero("B: ");
  print("Resultado: ${a - b}");
}

void multiplicacion() {
  double a = leerNumero("A: ");
  double b = leerNumero("B: ");
  print("Resultado: ${a * b}");
}

void division() {
  double a = leerNumero("A: ");
  double b = leerNumero("B: ");
  if (b == 0) {
    print("No se puede dividir por cero.");
  } else {
    print("Resultado: ${a / b}");
  }
}

void modulo() {
  double a = leerNumero("A: ");
  double b = leerNumero("B: ");
  print("Resultado: ${a % b}");
}

void cuadrado() {
  double a = leerNumero("Número: ");
  print("Cuadrado: ${a * a}");
}

void raizCuadrada() {
  double a = leerNumero("Número: ");
  print("Raíz cuadrada: ${sqrt(a)}");
}

void potencia() {
  double base = leerNumero("Base: ");
  double exponente = leerNumero("Exponente: ");
  print("Potencia: ${pow(base, exponente)}");
}

void porcentaje() {
  double numero = leerNumero("Número: ");
  double porcentaje = leerNumero("Porcentaje (%): ");
  print("Resultado: ${numero * (porcentaje / 100)}");
}

void numeroAleatorio() {
  var random = Random();
  print("Número aleatorio entre 1 y 100: ${random.nextInt(100) + 1}");
}

void mostrarMenu() {
  print('''
Selecciona una operación:
1. Suma
2. Resta
3. Multiplicación
4. División
5. Módulo
6. Cuadrado
7. Raíz cuadrada
8. Potencia
9. Porcentaje
10. Número aleatorio
''');
}

void menuOperacionesModular() {
  mostrarMenu();

  int opcion = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  switch (opcion) {
    case 1:
      suma();
      break;
    case 2:
      resta();
      break;
    case 3:
      multiplicacion();
      break;
    case 4:
      division();
      break;
    case 5:
      modulo();
      break;
    case 6:
      cuadrado();
      break;
    case 7:
      raizCuadrada();
      break;
    case 8:
      potencia();
      break;
    case 9:
      porcentaje();
      break;
    case 10:
      numeroAleatorio();
      break;
    default:
      print("Opción no válida");
  }
}
