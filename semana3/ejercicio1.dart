import 'dart:math';
import 'dart:io';

void main() {
  stdout.write('Ingresa el radio del cilindro: ');
  double radio = double.parse(stdin.readLineSync()!);
  stdout.write('Ingresa la altura del cilindro: ');
  double altura = double.parse(stdin.readLineSync()!);
  double areaTotal = 2 * pi * radio * (radio + altura);
  double volumen = pi * pow(radio, 2) * altura;
  print('El área total del cilindro es: ${areaTotal.toStringAsFixed(2)}');
  print('El volumen del cilindro es: ${volumen.toStringAsFixed(2)}');
}      