import 'dart:io';
bool esPrimo(int numero) {
  if (numero <= 1) return false;
  for (int i = 2; i <= numero ~/ 2; i++) {
    if (numero % i == 0) return false;
  }
  return true;
}
void main() {
  print('Ingresa el primer número:');
  int numero1 = int.parse(stdin.readLineSync()!);
  print('Ingresa el segundo número:');
  int numero2 = int.parse(stdin.readLineSync()!);
  if (numero1 > numero2) {
    int temp = numero1;
    numero1 = numero2;
    numero2 = temp;
  }
  int sumatoria = 0;
  List<int> numerosPrimos = [];
  for (int i = numero1; i <= numero2; i++) {
    if (esPrimo(i)) {
      numerosPrimos.add(i);
      sumatoria += i;
    }
  }
  if (numerosPrimos.isNotEmpty) {
    print('Los números primos entre $numero1 y $numero2 son: ${numerosPrimos.join(', ')}');
    print('La sumatoria de los números primos es: $sumatoria');
  } else {
    print('No hay números primos entre $numero1 y $numero2.');
  }
}
