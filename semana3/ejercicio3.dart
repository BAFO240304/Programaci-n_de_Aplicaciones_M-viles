import 'dart:io';
void main() {
  stdout.write('Ingresa el monto total de dinero a invertir: ');
  double totalDinero = double.parse(stdin.readLineSync()!);
  double alquiler = totalDinero * 0.23;
  double publicidad = totalDinero * 0.07;
  double transporte = totalDinero * 0.26;
  double serviciosFeriales = totalDinero * 0.12;
  double decoracion = totalDinero * 0.21;
  double gastosVarios = totalDinero * 0.11;
  print('\nDistribución del gasto en la feria:');
  print('Alquiler de espacio en la feria: \$${alquiler.toStringAsFixed(2)}');
  print('Publicidad: \$${publicidad.toStringAsFixed(2)}');
  print('Transporte: \$${transporte.toStringAsFixed(2)}');
  print('Servicios feriales: \$${serviciosFeriales.toStringAsFixed(2)}');
  print('Decoración: \$${decoracion.toStringAsFixed(2)}');
  print('Gastos varios: \$${gastosVarios.toStringAsFixed(2)}');
}
