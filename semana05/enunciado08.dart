import 'dart:io';
import 'dart:math';
void main() {
  print('Ingresa un número:');
  int numero = int.parse(stdin.readLineSync()!);
  String numeroStr = numero.toString();
  int cantidadDigitos = numeroStr.length;
  int suma = 0;
  print('Calculando la suma de los dígitos elevados a la potencia de $cantidadDigitos:');
  for (int i = 0; i < cantidadDigitos; i++) {
    int digito = int.parse(numeroStr[i]);
    int potencia = pow(digito, cantidadDigitos).toInt();
    suma += potencia;
    print('$digito elevado a $cantidadDigitos = $potencia');
  }
  if (suma == numero) {
    print('$numero es un número de Armstrong.');
  } else {
    print('$numero no es un número de Armstrong.');
  }
}
