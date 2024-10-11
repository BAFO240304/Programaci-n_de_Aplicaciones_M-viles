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
  // Definimos las categorías
  Categoria categoriaA = Categoria('A', 550);
  Categoria categoriaB = Categoria('B', 500);
  Categoria categoriaC = Categoria('C', 460);
  Categoria categoriaD = Categoria('D', 400);
  print('Ingrese el nombre del estudiante:');
  String nombre = stdin.readLineSync() ?? '';
  print('Ingrese la categoría del estudiante (A, B, C, D):');
  String categoriaInput = stdin.readLineSync()?.toUpperCase() ?? '';
  Categoria categoria;
  switch (categoriaInput) {
    case 'A':
      categoria = categoriaA;
      break;
    case 'B':
      categoria = categoriaB;
      break;
    case 'C':
      categoria = categoriaC;
      break;
    case 'D':
      categoria = categoriaD;
      break;
    default:
      print('Categoría no válida.');
      return;
  }
  print('Ingrese el promedio ponderado del estudiante:');
  double promedio = double.parse(stdin.readLineSync() ?? '0');
  Estudiante estudiante = Estudiante(nombre, categoria, promedio);
  double nuevaPension = estudiante.nuevaPension();
  double descuento = estudiante.calcularDescuento() * categoria.pension;
  print('Estudiante: ${estudiante.nombre}');
  print('Categoría: ${estudiante.categoria.nombre}');
  print('Pensión actual: S/. ${estudiante.categoria.pension}');
  print('Descuento: S/. ${descuento.toStringAsFixed(2)}');
  print('Nueva pensión: S/. ${nuevaPension.toStringAsFixed(2)}');
}
