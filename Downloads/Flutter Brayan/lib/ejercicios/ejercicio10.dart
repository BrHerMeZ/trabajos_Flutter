import 'dart:io';
import 'dart:math';

double leerPositivo(String mensaje) {
  double valor;
  do {
    stdout.write(mensaje);
    valor = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (valor <= 0) {
      print("Por favor ingrese un valor positivo.");
    }
  } while (valor <= 0);
  return valor;
}

void calcularCilindroConTapa() {
  double radio = leerPositivo("Ingrese el radio: ");
  double altura = leerPositivo("Ingrese la altura: ");

  double areaLateral = 2 * pi * radio * altura;
  double areaBase = pi * pow(radio, 2);
  double areaTotal = areaLateral + 2 * areaBase;
  double volumen = areaBase * altura;

  print("Área total del cilindro con tapa: ${areaTotal.toStringAsFixed(2)} unidades²");
  print("Volumen del cilindro: ${volumen.toStringAsFixed(2)} unidades³");
}
