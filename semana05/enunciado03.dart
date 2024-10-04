import 'dart:io';
void main() {
  print('Ingresa un número para calcular su factorial:');
  int n = int.parse(stdin.readLineSync()!);
  if (n < 0) {
    print('El factorial no está definido para números negativos.');
    return;
  }
  BigInt factorial = BigInt.one;

  for (int i = 2; i <= n; i++) {
    factorial *= BigInt.from(i);
  }
  print('El factorial de $n es: $factorial');
}
