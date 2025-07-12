void tablaInvertida() {
  List.generate(10, (i) {
    int tabla = 10 - i;
    print(" Tabla del $tabla");
    List.generate(10, (j) {
      int multiplicador = 10 - j;
      print("$tabla x $multiplicador = ${tabla * multiplicador}");
    });
    print(""); 
  });
}
