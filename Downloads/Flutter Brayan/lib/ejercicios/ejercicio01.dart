void mostrarDatosConstantes() {
  final persona = const {
    'nombre': 'Brayan',
    'sexo': 'Masculino',
    'edad': 25,
    'salario': 1525000.75,
    'tieneVehiculo': true,
  };

  print("Nombre: ${persona['nombre']}");
  print("Sexo: ${persona['sexo']}");
  print("Edad: ${persona['edad']}");
  print("Salario: \$${(persona['salario'] as double).toStringAsFixed(2)}");
  print("¿Tiene vehículo?: ${(persona['tieneVehiculo'] as bool) ? 'Sí' : 'No'}");
}
