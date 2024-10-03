import 'dart:io';
void main() {
  double precioMayorDe18 = 350.0;
  double precioMenorOIgual18 = 200.0;
  print("Ingrese su edad: ");
  int edad = int.parse(stdin.readLineSync()!);
  print("Ingrese su nivel del sistema de beneficio (1, 2, 3 o 4): ");
  int nivel = int.parse(stdin.readLineSync()!);
  double precioFinal;
  double descuento;
  if (edad > 18) {
    precioFinal = precioMayorDe18;
    switch (nivel) {
      case 1:
        descuento = 0.40;
        break;
      case 2:
        descuento = 0.30;
        break;
      case 3:
        descuento = 0.15;
        break;
      default:
        descuento = 0.0;
    }
  } else if (edad == 18) {
    precioFinal = precioMenorOIgual18;
    switch (nivel) {
      case 1:
        descuento = 0.60;
        break;
      case 2:
        descuento = 0.40;
        break;
      case 3:
        descuento = 0.20;
        break;
      default:
        descuento = 0.0;
    }
  } else {
    print("Edad no válida. Debe ser mayor o igual a 18.");
    return;
  }
  double montoDescuento = precioFinal * descuento;
  double precioConDescuento = precioFinal - montoDescuento;
  print("Precio original: S/. ${precioFinal.toStringAsFixed(2)}");
  print("Descuento aplicado: S/. ${montoDescuento.toStringAsFixed(2)}");
  print("Precio final a pagar: S/. ${precioConDescuento.toStringAsFixed(2)}");
}
