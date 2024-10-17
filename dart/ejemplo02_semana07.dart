import 'dart:io';

class Estudiante {
  String codigo;
  String nombres;
  double nota1;
  double nota2;

  Estudiante(this.codigo, this.nombres, this.nota1, this.nota2);

  void mostrarInformacion() {
    print('Código : $codigo');
    print('Nombres : $nombres');
    print('Nota 1 : $nota1');
    print('Nota 2 : $nota2');
    print('Promedio: ${calcularPromedio()}');
  }

  double calcularPromedio() {
    return (nota1 + nota2) / 2; // Calcular el promedio
  }
}

void main() {
  List<Estudiante> listaEstudiante = [];
  
  while (true) {
    print('Ingrese el código del estudiante (o "salir" para terminar):');
    String codigo = stdin.readLineSync() ?? '';
    if (codigo.toLowerCase() == 'salir') {
      break;
    }

    print('Ingrese el nombre del estudiante:');
    String nombres = stdin.readLineSync() ?? '';

    double nota1;
    while (true) {
      print('Ingrese la nota 1:');
      String? input = stdin.readLineSync();
      if (input != null) {
        try {
          nota1 = double.parse(input);
          break; // Salir del bucle si la conversión fue exitosa
        } catch (e) {
          print('Por favor, ingrese un número válido para la nota 1.');
        }
      }
    }

    double nota2;
    while (true) {
      print('Ingrese la nota 2:');
      String? input = stdin.readLineSync();
      if (input != null) {
        try {
          nota2 = double.parse(input);
          break; // Salir del bucle si la conversión fue exitosa
        } catch (e) {
          print('Por favor, ingrese un número válido para la nota 2.');
        }
      }
    }

    Estudiante nuevoEstudiante = Estudiante(codigo, nombres, nota1, nota2);
    listaEstudiante.add(nuevoEstudiante);
    
    // Mostrar información inmediatamente después de agregar
    nuevoEstudiante.mostrarInformacion();
    print('Estudiante agregado.');
    print('---');
  }

  // Mostrar la información de los estudiantes ingresados
  print('Resumen de estudiantes:');
  for (var estudiante in listaEstudiante) {
    estudiante.mostrarInformacion();
    print('---');
  }
}