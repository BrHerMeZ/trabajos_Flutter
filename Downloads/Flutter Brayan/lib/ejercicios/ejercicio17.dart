void paresEImpares() {
  print(" Números del 1 al 100 con su tipo:");
  for (int i = 1; i <= 100; i++) {
    String tipo = (i % 2 == 0) ? "par" : "impar";
    print("$i es $tipo");
  }
}
