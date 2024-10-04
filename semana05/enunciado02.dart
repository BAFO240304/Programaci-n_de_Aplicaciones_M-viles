import 'dart:io';
void main() {
  print('Ingresa el número de términos de la secuencia de Fibonacci:');
  int n = int.parse(stdin.readLineSync()!);
  if (n <= 0) {
    print('Por favor, ingresa un número positivo.');
    return;
  }
  BigInt a = BigInt.zero;
  BigInt b = BigInt.one; 
  print('La secuencia de Fibonacci hasta $n términos es:');
  for (int i = 0; i < n; i++) {
    if (i == 0) {
      print(a);
      continue;
    }
    if (i == 1) {
      print(b);
      continue;
    }
    BigInt siguiente = a + b;
    print(siguiente);
    a = b;
    b = siguiente;
  }
}
