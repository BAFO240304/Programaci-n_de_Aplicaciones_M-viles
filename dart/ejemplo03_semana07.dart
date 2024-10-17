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
    return (nota1 + nota2) / 2;
  }
}
void main() {
  iniciarPrograma();
}
void iniciarPrograma() {
  List<Estudiante> listaEstudiante = [];
  while (true) {
    Estudiante? nuevoEstudiante = ingresarEstudiante();
    if (nuevoEstudiante == null) break;
    listaEstudiante.add(nuevoEstudiante);
    nuevoEstudiante.mostrarInformacion();
    print('Estudiante agregado.');
    print('---');
  }
  print('Resumen de estudiantes:');
  for (var estudiante in listaEstudiante) {
    estudiante.mostrarInformacion();
    print('-----------------------');
  }
}
Estudiante? ingresarEstudiante() {
  String codigo;
  while (true) {
    print('Ingrese el código del estudiante (o "salir" para terminar):');
    codigo = stdin.readLineSync() ?? '';
    if (codigo.toLowerCase() == 'salir') {
      return null;
    }
    if (validarCodigo(codigo)) {
      break;
    } else {
      print('El código debe ser numérico. Intente nuevamente.');
    }
  }
  String nombres;
  while (true) {
    print('Ingrese el nombre del estudiante:');
    nombres = stdin.readLineSync() ?? '';
    if (validarNombre(nombres)) {
      break;
    } else {
      print('El nombre solo debe contener letras. Intente nuevamente.');
    }
  }
  double nota1 = ingresarNota('Ingrese la nota 1:');
  double nota2 = ingresarNota('Ingrese la nota 2:');

  return Estudiante(codigo, nombres, nota1, nota2);
}
double ingresarNota(String mensaje) {
  double nota;
  while (true) {
    print(mensaje);
    String? input = stdin.readLineSync();
    if (input != null) {
      try {
        nota = double.parse(input);
        return nota; // Retorna la nota válida
      } catch (e) {
        print('Por favor, ingrese un número válido para la nota.');
      }
    }
  }
}

bool validarCodigo(String codigo) {
  return int.tryParse(codigo) != null; 
}

bool validarNombre(String nombre) {
  return RegExp(r'^[a-zA-Z\s]+$').hasMatch(nombre);
}
