import 'dart:io';
void main() {
  print('Ingresa la base:');
  int base = int.parse(stdin.readLineSync()!);
  print('Ingresa el exponente:');
  int exponente = int.parse(stdin.readLineSync()!);
  int resultado = 1;
  for (int i = 0; i < exponente; i++) {
    resultado *= base;
  }
  print('$base elevado a $exponente es: $resultado');
}