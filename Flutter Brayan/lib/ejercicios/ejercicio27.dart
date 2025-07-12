import 'dart:io';

void facturaConMatrices() {
  List<List<dynamic>> productos = [
    [1, "Papel Higiénico", 4500, true],
    [2, "Jabón en barra", 1200, false],
    [3, "Shampoo", 8500, true],
    [4, "Cepillo de dientes", 2500, false],
    [5, "Pasta dental", 3200, true],
    [6, "Detergente", 9000, true],
    [7, "Esponja", 1000, false],
    [8, "Desodorante", 6800, true],
    [9, "Trapo de cocina", 1500, false],
    [10, "Toalla femenina", 7800, true],
  ];

  List<List<dynamic>> factura = [];

  bool continuar = true;
  int item = 1;
  while (continuar && item <= 10) {
    stdout.write("Ingrese ID del producto: ");
    int id = int.parse(stdin.readLineSync()!);

    var producto = productos.firstWhere((p) => p[0] == id, orElse: () => []);

    if (producto.isEmpty) {
      print("Producto no encontrado.");
      continue;
    }

    stdout.write("¿Cuántos desea llevar?: ");
    int cantidad = int.parse(stdin.readLineSync()!);

    int valorUnidad = producto[2];
    bool tieneIVA = producto[3];
    double iva = tieneIVA ? valorUnidad * 0.19 * cantidad : 0;
    double total = (valorUnidad * cantidad) + iva;

    factura.add([
      item,
      producto[0],
      producto[1],
      cantidad,
      valorUnidad,
      iva,
      total
    ]);
    item++;

    stdout.write("¿Desea ingresar otro producto? (s/n): ");
    continuar = stdin.readLineSync()!.toLowerCase() == 's';
  }

  print("\nFACTURA:");
  print("Item | ID | Producto | Cant | V.Unit | IVA | Total");
  for (var fila in factura) {
    print(fila.join(" | "));
  }
}
