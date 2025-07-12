import 'dart:io';

Map<int, String> colores = {
  1: "Amarillo",
  2: "Azul",
  3: "Rojo",
};

String combinarColores(int a, int b) {
  if ((a == 1 && b == 2) || (a == 2 && b == 1)) return "Verde";
  if ((a == 1 && b == 3) || (a == 3 && b == 1)) return "Naranja";
  if ((a == 2 && b == 3) || (a == 3 && b == 2)) return "Violeta";
  if (a == b && colores.containsKey(a)) return "Mismo color";
  return "Combinación no válida";
}

int pedirOpcion(String mensaje) {
  stdout.write(mensaje);
  return int.tryParse(stdin.readLineSync() ?? '') ?? -1;
}

void mostrarMenu() {
  print("Menú de colores:");
  colores.forEach((key, value) => print("$key. $value"));
}

void ejecutarCombinacionColores() {
  mostrarMenu();

  int color1 = pedirOpcion("Digite el primer número: ");
  int color2 = pedirOpcion("Digite el segundo número: ");

  String resultado = combinarColores(color1, color2);
  print("Su combinación es: $resultado");
}
