import 'dart:io';

void main() {
  print('Ingresa un número entero:');
  int numero = int.parse(stdin.readLineSync()!);
  int numeroInvertido = 0;
  int original = numero;
  while (numero != 0) {
    int digito = numero % 10;
    numeroInvertido = (numeroInvertido * 10) + digito;
    numero ~/= 10;
  }
  print('El número invertido de $original es: $numeroInvertido');
}
