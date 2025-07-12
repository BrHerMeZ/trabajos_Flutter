// menu_consola.dart

import 'dart:io';

// 🔹 Importaciones de ejercicios (usa tus rutas reales)
import 'ejercicios/ejercicio01.dart';
import 'ejercicios/ejercicio02.dart';
import 'ejercicios/ejercicio03.dart';
import 'ejercicios/ejercicio04.dart';
import 'ejercicios/ejercicio05.dart';
import 'ejercicios/ejercicio06.dart';
import 'ejercicios/ejercicio07.dart';
import 'ejercicios/ejercicio08.dart';
import 'ejercicios/ejercicio09.dart';
import 'ejercicios/ejercicio10.dart';
import 'ejercicios/ejercicio11.dart';
import 'ejercicios/ejercicio12.dart';
import 'ejercicios/ejercicio13.dart';
import 'ejercicios/ejercicio14.dart';
import 'ejercicios/ejercicio15.dart';
import 'ejercicios/ejercicio16.dart';
import 'ejercicios/ejercicio17.dart';
import 'ejercicios/ejercicio18.dart';
import 'ejercicios/ejercicio19.dart';
import 'ejercicios/ejercicio20.dart';
import 'ejercicios/ejercicio21.dart';
import 'ejercicios/ejercicio22.dart';
import 'ejercicios/ejercicio23.dart';
import 'ejercicios/ejercicio24.dart';
import 'ejercicios/ejercicio25.dart';
import 'ejercicios/ejercicio26.dart';
import 'ejercicios/ejercicio27.dart';
import 'ejercicios/ejercicio28.dart';

void menuEjercicios() {
  int opcion;

  do {
    print('\n======= MENÚ DE EJERCICIOS =======');
    print('0. Salir');
    for (int i = 1; i <= 28; i++) {
      print('$i. Ejercicio ${i.toString().padLeft(2, '0')}');
    }
    stdout.write('\nSelecciona una opción: ');
    opcion = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    print('');
    switch (opcion) {
      case 0: print('Saliendo...'); break;
      case 1: constantesDatos(); break;
      case 2: variablesEntrada(); break;
      case 3: sumaSecuencial(); break;
      case 4: restaSecuencial(); break;
      case 5: multiplicacionSecuencial(); break;
      case 6: divisionCondicional(); break;
      case 7: combinacionColores(); break;
      case 8: menuOperaciones(); break;
      case 9: menuFiguras(); break;
      case 10: cilindroConTapa(); break;
      case 11: tipoTriangulo(); break;
      case 12: dadosParques(); break;
      case 13: canastaIVA(); break;
      case 14: tablaMultiplicar(); break;
      case 15: numerosPares(); break;
      case 16: multiplosDe3(); break;
      case 17: paresEImpares(); break;
      case 18: multiploDe2y3(); break;
      case 19: multiploDe2y3y5(); break;
      case 20: todasTablasMultiplicar(); break;
      case 21: tablaInvertida(); break;
      case 22: vectorBasico(); break;
      case 23: vectorMatriz(); break;
      case 24: arregloEjercicios(); break;
      case 25: vectorOrdenado(); break;
      case 26: guayabita(); break;
      case 27: facturaConMatrices(); break;
      case 28: funcionesSuma(); break;
      default: print('❌ Opción inválida, intenta de nuevo.');
    }

    if (opcion != 0) {
      stdout.write('\nPresiona ENTER para continuar...');
      stdin.readLineSync();
    }
  } while (opcion != 0);
}
