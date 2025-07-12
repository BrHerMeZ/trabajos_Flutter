import 'dart:math';

final Random random = Random();

int lanzarDado() => random.nextInt(6) + 1;

void dadosParquesModular() {
  int intentosDobles = 0;

  while (intentosDobles < 3) {
    int dado1 = lanzarDado();
    int dado2 = lanzarDado();

    print("Tiraste: $dado1 y $dado2");

    if (dado1 == dado2) {
      intentosDobles++;
      print("¡Dobles! Llevas $intentosDobles intento(s).");

      if (intentosDobles == 3) {
        print("🎉 ¡Sacás ficha, parcero!");
        return;
      } else {
        print(" Volvé a lanzar...");
      }
    } else {
      print(" No fueron dobles. Perdiste la chance.");
      return;
    }
  }
}
