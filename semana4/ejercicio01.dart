import 'dart:io';
void main() {
  Map<String, double> pensiones = {
    'A': 550.0,
    'B': 500.0,
    'C': 460.0,
    'D': 400.0,
  };
  Map<String, double> descuentos = {
    '0-13.99': 0.0,
    '14.00-15.99': 0.10,
    '16.00-17.99': 0.12,
    '18.00-20.00': 0.15,
  };
  print("Ingrese su categoría (A, B, C, D): ");
  String categoria = stdin.readLineSync()!.toUpperCase();
  if (!pensiones.containsKey(categoria)) {
    print("Categoría no válida.");
    return;
  }
  print("Ingrese su promedio ponderado (0 a 20): ");
  double promedio = double.parse(stdin.readLineSync()!);
  if (promedio < 0 || promedio > 20) {
    print("Promedio no válido. Debe estar entre 0 y 20.");
    return;
  }
  double pensionActual = pensiones[categoria]!;
  double descuento = 0.0;
  if (promedio >= 0 && promedio < 14) {
    descuento = descuentos['0-13.99']!;
  } else if (promedio >= 14 && promedio < 16) {
    descuento = descuentos['14.00-15.99']!;
  } else if (promedio >= 16 && promedio < 18) {
    descuento = descuentos['16.00-17.99']!;
  } else {
    descuento = descuentos['18.00-20.00']!;
  }
  double montoDescuento = pensionActual * descuento;
  double nuevaPension = pensionActual - montoDescuento;
  print("Pensión actual: S/. ${pensionActual.toStringAsFixed(2)}");
  print("Descuento: S/. ${montoDescuento.toStringAsFixed(2)}");
  print("Nueva pensión: S/. ${nuevaPension.toStringAsFixed(2)}");
}
