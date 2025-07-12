import 'dart:io';
import 'dart:math';

void guayabita() {
  stdout.write("¿Cuántos jugadores van a jugar? ");
  int jugadores = int.parse(stdin.readLineSync()!);
  int acumulado = 0;

  List<String> nombres = [];
  for (int i = 0; i < jugadores; i++) {
    stdout.write("Nombre del jugador ${i + 1}: ");
    String? nombre = stdin.readLineSync();
    if (nombre != null && nombre.isNotEmpty) {
      nombres.add(nombre);
    } else {
      nombres.add("Jugador${i + 1}");
    }
  }

  // Aporte inicial al acumulado
  acumulado = jugadores;
  print("\nCada jugador pone 1 moneda al inicio. Acumulado: $acumulado\n");

  while (true) {
    for (var jugador in nombres) {
      print("\n Turno de $jugador");
      print("Acumulado actual: $acumulado monedas");

      int tiro1 = Random().nextInt(6) + 1;
      print("Primer tiro: $tiro1");

      if (tiro1 == 1 || tiro1 == 6) {
        print("$jugador pierde y aporta 1 moneda al acumulado.");
        acumulado += 1;
        continue;
      }

      stdout.write("¿Cuánto desea apostar (mínimo 1, máximo $acumulado)? ");
      int apuesta = int.parse(stdin.readLineSync()!);

      if (apuesta <= 0 || apuesta > acumulado) {
        print(" Apuesta inválida. Se salta el turno.");
        continue;
      }

      int tiro2 = Random().nextInt(6) + 1;
      print("Segundo tiro: $tiro2");

      if (tiro2 > tiro1) {
        print(" ¡Ganó! Se lleva $apuesta monedas.");
        acumulado -= apuesta;
      } else {
        print(" Perdió. Aporta $apuesta al acumulado.");
        acumulado += apuesta;
      }

      if (acumulado <= 0) {
        print("\n El acumulado quedó en 0. ¡Fin del juego!");
        return;
      }
    }
  }
}
