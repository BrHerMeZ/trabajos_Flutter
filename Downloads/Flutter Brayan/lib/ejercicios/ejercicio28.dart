import 'dart:io';

void funcionesSuma() {
  while (true) {
    print("\nMENÚ DE SUMA");
    print("1. Sin parámetros y sin retorno");
    print("2. Con parámetros y sin retorno");
    print("3. Sin parámetros y con retorno");
    print("4. Con parámetros y con retorno");
    print("0. Salir");
    stdout.write("Opción: ");
    int op = int.parse(stdin.readLineSync()!);

    if (op == 0) break;

    switch (op) {
      case 1:
        void sinParametrosSinRetorno() {
          stdout.write("Ingrese el primer número: ");
          int a = int.parse(stdin.readLineSync()!);
          stdout.write("Ingrese el segundo número: ");
          int b = int.parse(stdin.readLineSync()!);
          print("La suma es: ${a + b}");
        }

        sinParametrosSinRetorno();
        break;

      case 2:
        void conParametrosSinRetorno(int a, int b) {
          print("La suma es: ${a + b}");
        }

        stdout.write("Ingrese el primer número: ");
        int x = int.parse(stdin.readLineSync()!);
        stdout.write("Ingrese el segundo número: ");
        int y = int.parse(stdin.readLineSync()!);
        conParametrosSinRetorno(x, y);
        break;

      case 3:
        int sinParametrosConRetorno() {
          stdout.write("Ingrese el primer número: ");
          int a = int.parse(stdin.readLineSync()!);
          stdout.write("Ingrese el segundo número: ");
          int b = int.parse(stdin.readLineSync()!);
          return a + b;
        }

        print("La suma es: ${sinParametrosConRetorno()}");
        break;

      case 4:
        int conParametrosConRetorno(int a, int b) {
          return a + b;
        }

        stdout.write("Ingrese el primer número: ");
        int x = int.parse(stdin.readLineSync()!);
        stdout.write("Ingrese el segundo número: ");
        int y = int.parse(stdin.readLineSync()!);
        print("La suma es: ${conParametrosConRetorno(x, y)}");
        break;

      default:
        print("Opción inválida");
    }
  }
}
