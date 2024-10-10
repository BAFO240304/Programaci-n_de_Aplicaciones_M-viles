import 'dart:io';
class Tienda {
  final double porcentajeDescuento = 0.07;
  double precioCamisa = 0.0;
  int cantidad = 0;
  void solicitarDatos() {
    print("Ingrese el precio de la camisa:");
    String? precioInput = stdin.readLineSync();
    precioCamisa = double.tryParse(precioInput!) ?? 0;
    print("Ingrese la cantidad de camisas a comprar:");
    String? cantidadInput = stdin.readLineSync();
    cantidad = int.tryParse(cantidadInput!) ?? 0;
  }
  double calcularImporteCompra() {
    return precioCamisa * cantidad;
  }
  double calcularPrimerDescuento(double importeCompra) {
    return importeCompra * porcentajeDescuento;
  }
  double calcularSegundoDescuento(double importeCompra, double primerDescuento) {
    double restante = importeCompra - primerDescuento;
    return restante * porcentajeDescuento;
  }
  double calcularDescuentoTotal(double primerDescuento, double segundoDescuento) {
    return primerDescuento + segundoDescuento;
  }
  double calcularImporteAPagar(double importeCompra, double descuentoTotal) {
    return importeCompra - descuentoTotal;
  }
  void imprimirDetalleCompra() {
    double importeCompra = calcularImporteCompra();
    double primerDescuento = calcularPrimerDescuento(importeCompra);
    double segundoDescuento = calcularSegundoDescuento(importeCompra, primerDescuento);
    double descuentoTotal = calcularDescuentoTotal(primerDescuento, segundoDescuento);
    double importeAPagar = calcularImporteAPagar(importeCompra, descuentoTotal);
    print("\n===== DETALLE DE LA COMPRA =====");
    print("Importe de la compra: S/. ${importeCompra.toStringAsFixed(2)}");
    print("Primer descuento (7%): S/. ${primerDescuento.toStringAsFixed(2)}");
    print("Segundo descuento (7% del restante): S/. ${segundoDescuento.toStringAsFixed(2)}");
    print("Descuento total: S/. ${descuentoTotal.toStringAsFixed(2)}");
    print("Importe a pagar: S/. ${importeAPagar.toStringAsFixed(2)}");
    print("===================================");
  }
}
void main() {
  Tienda tienda = Tienda();
  tienda.solicitarDatos();
  tienda.imprimirDetalleCompra();
}
