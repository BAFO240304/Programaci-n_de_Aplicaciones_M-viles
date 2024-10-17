import 'dart:io';
class Categoria {
  String nombre;
  double pension;

  Categoria(this.nombre, this.pension);
}
class Estudiante {
  String nombre;
  Categoria categoria;
  double promedio;
  Estudiante(this.nombre, this.categoria, this.promedio);
  double calcularDescuento() {
    if (promedio < 14.0) {
      return 0.0;
    } else if (promedio < 16.0) {
      return 0.10;
    } else if (promedio < 18.0) {
      return 0.12;
    } else {
      return 0.15;
    }
  }
  double nuevaPension() {
    double descuento = calcularDescuento();
    return categoria.pension * (1 - descuento);
  }
}
void main() {
  iniciarPrograma();
}
void iniciarPrograma() {
  List<Categoria> categorias = [
    Categoria('A', 550),
    Categoria('B', 500),
    Categoria('C', 460),
    Categoria('D', 400),
  ];
  String nombre = ingresarNombreEstudiante();
  Categoria categoria = seleccionarCategoria(categorias);
  double promedio = ingresarPromedioEstudiante();
  Estudiante estudiante = Estudiante(nombre, categoria, promedio);
  mostrarResultados(estudiante);
}
String ingresarNombreEstudiante() {
  print('Ingrese el nombre del estudiante:');
  return stdin.readLineSync() ?? '';
}
Categoria seleccionarCategoria(List<Categoria> categorias) {
  print('Ingrese la categoría del estudiante (A, B, C, D):');
  String categoriaInput = stdin.readLineSync()?.toUpperCase() ?? '';
  
  for (var categoria in categorias) {
    if (categoriaInput == categoria.nombre) {
      return categoria;
    }
  }
  print('Categoría no válida. Se asignará la categoría A por defecto.');
  return categorias[0];
}
double ingresarPromedioEstudiante() {
  double promedio;
  while (true) {
    print('Ingrese el promedio ponderado del estudiante:');
    String? input = stdin.readLineSync();
    try {
      promedio = double.parse(input ?? '0');
      return promedio;
    } catch (e) {
      print('Por favor, ingrese un número válido para el promedio.');
    }
  }
}
void mostrarResultados(Estudiante estudiante) {
  double nuevaPension = estudiante.nuevaPension();
  double descuento = estudiante.calcularDescuento() * estudiante.categoria.pension;

  print('Estudiante: ${estudiante.nombre}');
  print('Categoría: ${estudiante.categoria.nombre}');
  print('Pensión actual: S/. ${estudiante.categoria.pension}');
  print('Descuento: S/. ${descuento.toStringAsFixed(2)}');
  print('Nueva pensión: S/. ${nuevaPension.toStringAsFixed(2)}');
}
