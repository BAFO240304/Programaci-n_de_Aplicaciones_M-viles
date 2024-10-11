import 'dart:io';
class Producto {
  String nombre;
  double precio;
  Producto(this.nombre, this.precio);
}
class Compra {
  Producto producto;
  int cantidad;
  Compra(this.producto, this.cantidad);
  double importeAPagar() {
    return producto.precio * cantidad;
  }
  String determinarRegalo() {
    if (cantidad < 26) {
      return 'Un lapicero';
    } else if (cantidad <= 50) {
      return 'Un cuaderno';
    } else {
      return 'Una agenda';
    }
  }
}
void main() {
  Producto p1 = Producto('P1', 15.0);
  Producto p2 = Producto('P2', 17.5);
  Producto p3 = Producto('P3', 20.0);
  print('Seleccione el tipo de producto:');
  print('1. P1 (S/. 15.0)');
  print('2. P2 (S/. 17.5)');
  print('3. P3 (S/. 20.0)');
  int seleccion = int.parse(stdin.readLineSync() ?? '1');
  Producto productoSeleccionado;
  switch (seleccion) {
    case 1:
      productoSeleccionado = p1;
      break;
    case 2:
      productoSeleccionado = p2;
      break;
    case 3:
      productoSeleccionado = p3;
      break;
    default:
      print('Selección no válida.');
      return;
  }
  print('Ingrese la cantidad de unidades adquiridas:');
  int cantidad = int.parse(stdin.readLineSync() ?? '0');
  Compra compra = Compra(productoSeleccionado, cantidad);
  double totalAPagar = compra.importeAPagar();
  String regalo = compra.determinarRegalo();
  print('Tipo de producto: ${productoSeleccionado.nombre}');
  print('Importe a pagar: S/. ${totalAPagar.toStringAsFixed(2)}');
  print('Regalo: $regalo');
}
