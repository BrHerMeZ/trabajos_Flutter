void vectorMatriz() {
  List<String> encabezado = ["Nombre", "Apellido", "Edad", "Estado Civil", "Teléfono"];
  List<List<String>> datos = [
    ["Mateo", "Rodríguez", "25", "Soltero", "3101112233"],
    ["Valentina", "García", "23", "Casada", "3209988776"],
    ["Santiago", "Martínez", "28", "Soltero", "3015566778"],
    ["Isabela", "Ramírez", "22", "Soltera", "3154433221"]
  ];

  print(encabezado.join(" | "));
  for (var fila in datos) {
    print(fila.join(" | "));
  }
}
