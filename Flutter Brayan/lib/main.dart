// main.dart

import 'package:flutter/material.dart';
import 'menu_consola.dart'; // Este archivo contiene todo el menú de consola

void main() {
  runApp(const MyApp());
  menuEjercicios(); // Corre el menú por consola
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Este proyecto está pensado para ejecutarse por consola.\n'
            'Ejecuta el archivo principal desde Visual Studio Code o terminal para usar el menú interactivo.\n\n'
            'Autor: Brayan Stiven Herrera Mateus ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
