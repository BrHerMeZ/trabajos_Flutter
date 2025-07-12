void todasTablasMultiplicar() {
  List.generate(10, (i) {
    int numero = i + 1;
    print("Tabla del $numero");
    List.generate(10, (j) {
      print("$numero x ${j + 1} = ${numero * (j + 1)}");
    });
    print(""); 
  });
}
