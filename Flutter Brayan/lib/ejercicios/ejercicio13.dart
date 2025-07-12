import 'dart:io';

bool esArticuloCanasta(String respuesta) {
  return respuesta.trim().toLowerCase() == 'si';
}

double calcularTotal(double valor, int cantidad, bool exentoIVA) {
  double subtotal = valor * cantidad;
  return exentoIVA ? subtotal : subtotal * 1.19;
}

void canastaIVARefactor() {
  stdout.write("Ingrese el nombre del artículo: ");
  String? articulo = stdin.readLineSync();

  stdout.write("Ingrese el valor unitario: ");
  double? valor = double.tryParse(stdin.readLineSync()!);

  stdout.write("Ingrese la cantidad: ");
  int? cantidad = int.tryParse(stdin.readLineSync()!);

  stdout.write("¿Es de la canasta familiar? (si/no): ");
  String? respuesta = stdin.readLineSync();

  if (articulo == null || valor == null || cantidad == null || respuesta == null) {
    print(" Datos inválidos. Intenta de nuevo.");
    return;
  }

  bool exento = esArticuloCanasta(respuesta);
  double total = calcularTotal(valor, cantidad, exento);

  print(" Total a pagar por $articulo: \$${total.toStringAsFixed(2)}");
}
